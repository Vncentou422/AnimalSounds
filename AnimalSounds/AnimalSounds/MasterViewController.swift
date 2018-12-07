//
//  MasterViewController.swift
//  AnimalSounds
//
//  Created by Vincent Ou on 12/3/18.
//  Copyright © 2018 Vincent Ou. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit

class MasterViewController: UITableViewController {
    var download : Bool = false
    var detailViewController: DetailViewController? = nil
    var objects : SoundCollection!
    var audioPlayer : AVAudioPlayer!
    var animalArray = ["🐱","🐶","🐺","🐵"]
    var nameArray = ["CAT","DOG","WOLF","MONKEY"]
    let animalArray2 = ["🐹","🐶","🐺","🐵","🐷","🐻","🐯"]
    let nameArray2 = ["CAT","DOG","WOLF",  "MONKEY" ,  "PIG" ,  "BEAR" , "TIGER"]
    
//    let soundFileNames = ["mouse","cat","rabbit","dog","wolf"]
    var audioPlayers = [AVAudioPlayer]()
    
//    let soundFileNames2
    var temp = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        print(download)
        // Do any additional setup after loading the view, typically from a nib.
        navigationItem.leftBarButtonItem = editButtonItem
        self.navigationController?.setToolbarHidden(false, animated: false)
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(insertNewObject(_:)))
        navigationItem.rightBarButtonItem = addButton
        if let split = splitViewController {
            let controllers = split.viewControllers
            detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
        }
        tableView.rowHeight = 100
        
//        for sound in nameArray{
//            do {
//                let url = Bundle.main.url(forResource: sound, withExtension: "wav")
//                let audioPlayer = try AVAudioPlayer(contentsOf: url!)
//                audioPlayers.append(audioPlayer)
//            }
//            catch{
//                audioPlayers.append(AVAudioPlayer())
//            }
//        }
//        tableView.allowsSelectionDuringEditing = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        clearsSelectionOnViewWillAppear = splitViewController!.isCollapsed
        super.viewWillAppear(animated)
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @objc
    func insertNewObject(_ sender: Any) {
        var sound = Sounds()
        var randomIndex = 0
        if download {
            randomIndex = Int(arc4random_uniform(UInt32(animalArray2.count)))
            sound = Sounds(imagee: animalArray[randomIndex],titlee: nameArray2[randomIndex])
        }
        else{
            randomIndex = Int(arc4random_uniform(UInt32(animalArray.count)))
            sound = Sounds(imagee: animalArray[randomIndex],titlee: nameArray[randomIndex])
        }
//        print(sound)
        objects.addItem(sound)
        let indexPath = IndexPath(row: 0, section: 0)
        tableView.insertRows(at: [indexPath], with: .automatic)
        tableView.reloadData()
    }

    // MARK: - Segues
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
//            print(tableView.indexPathForSelectedRow ?? 0)
            if let indexPath = tableView.indexPathForSelectedRow {
                print("Performing Segue")
//                let object = objects?.sounds[indexPath.row]
//                print("wassap")
                let controller = (segue.destination as! UINavigationController).topViewController as! DetailViewController
                controller.detailItem = objects?.sounds[indexPath.row]
                controller.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
                controller.navigationItem.leftItemsSupplementBackButton = true
                controller.labelText = objects?.sounds[indexPath.row].title
                controller.labelImage = objects?.sounds[indexPath.row].image
                
            }
            else{
                let controller = (segue.destination as! UINavigationController).topViewController as! DetailViewController
                controller.detailItem = objects?.sounds[temp]
                controller.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
                controller.navigationItem.leftItemsSupplementBackButton = true
                controller.labelText = objects?.sounds[temp].title

            }
        }
    }

    // MARK: - Table View
    
    
        
        
        
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objects?.sounds.count ?? 0
    
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> SoundCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! SoundCell
        cell.centerLabeo!.text = objects?.sounds[indexPath.row].image
        return cell
    }

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    func deletionAlert(title: String, completion: @escaping (UIAlertAction) -> Void) {
        let alertMsg = NSLocalizedString("str_deleteWarning", comment: "").replacingOccurrences(of: "_", with: title)
        let alert = UIAlertController(title: NSLocalizedString("str_warning", comment: ""),
                                      message: alertMsg,
                                      preferredStyle: .actionSheet)
        
        let deleteAction = UIAlertAction(title: NSLocalizedString("str_delete", comment: ""),
                                         style: .destructive, handler: completion)
        let cancelAction = UIAlertAction(title: NSLocalizedString("str_cancel", comment: ""),
                                         style: .cancel, handler:nil)
        
        alert.addAction(cancelAction)
        alert.addAction(deleteAction)
        
        alert.popoverPresentationController?.permittedArrowDirections = []
        alert.popoverPresentationController?.sourceView = self.view
        alert.popoverPresentationController?.sourceRect = CGRect(x: self.view.frame.midX, y: self.view.frame.midY, width: 0, height: 0)
        
        present(alert, animated: true, completion: nil)
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
                deletionAlert(title: objects.sounds[indexPath.row].title, completion: { _ in
                    self.objects.removeItem(at: indexPath.row)
                    tableView.deleteRows(at: [indexPath], with: .fade)
                })
            
            
            
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }
        
    }
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let alertMsg = NSLocalizedString("str_selectItemToMove", comment: "")
        
        let alert = UIAlertController(
            title: NSLocalizedString("str_warning", comment: ""),
            message: alertMsg,
            preferredStyle: .actionSheet)
        let moveAction = UIAlertAction(title: NSLocalizedString("str_move", comment: ""),
                                       style: .destructive, handler:nil)
        let cancelAction = UIAlertAction(title: NSLocalizedString("str_cancel", comment: ""),
                                         style: .cancel, handler:nil)
        
        alert.addAction(cancelAction)
        alert.addAction(moveAction)
        alert.popoverPresentationController?.permittedArrowDirections = []
        alert.popoverPresentationController?.sourceView = self.view
        alert.popoverPresentationController?.sourceRect = CGRect(x: self.view.frame.midX, y: self.view.frame.midY, width: 0, height: 0)
        
        present(alert, animated: true, completion: nil)
        objects?.moveItem(fromIndex: sourceIndexPath.row, toIndex: destinationIndexPath.row)
        
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print(indexPath.row)
//        audioPlayers[indexPath.row].play()
        let str = objects.sounds[indexPath.row].title
        let url = Bundle.main.url(forResource: str, withExtension: "wav")
//        var audioPlayer = AVAudioPlayer()
        do {
//            /let url = Bundle.main.url(forResource: sound, withExtension: "wav")
            audioPlayer = try AVAudioPlayer(contentsOf: url!)
//            print(audioPlayer)
//            audioPlayers.append(audioPlayer)
//            audioPlayer.play()
        }
        catch{
//            print("error")
        }
        audioPlayer.play()
//        print(str)
    }
    
    @IBAction func swipe(_ sender: Any) {
//        self.performSegue(withIdentifier: "showDetail", sender: tableView)
        print("Hello")
    }

    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let detail = detailAction(at: indexPath)
        return UISwipeActionsConfiguration(actions: [detail])
    }
    
    func detailAction(at: IndexPath) -> UIContextualAction{
        let action = UIContextualAction(style: .normal, title: "Details") {
            (action, view, completion) in
            print("Detail Action Tapped")
            self.temp = at.row
            print(self.self.temp)
            self.performSegue(withIdentifier: "showDetail", sender: nil)
            completion(true)
        }
        action.backgroundColor = .purple
        return action
    }
    


}

