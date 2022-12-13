//
//  ViewController.swift
//  Final
//
//  Created by Mac User on 12/11/22.
//

import UIKit
import CoreData

class NoteDetailVC: UIViewController {

    @IBOutlet weak var titleTF: UITextField!
    @IBOutlet weak var descTF: UITextField!
    @IBOutlet weak var usernameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var notesTV: UITextView!
    
    var selectedNote: Note? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if(selectedNote != nil){
            titleTF.text = selectedNote?.title
            descTF.text = selectedNote?.desc
            usernameTF.text = selectedNote?.username
            passwordTF.text = selectedNote?.password
            notesTV.text = selectedNote?.notes
        }
    }

    @IBAction func saveAction(_ sender: Any) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context: NSManagedObjectContext = appDelegate.persistentContainer.viewContext
        if(selectedNote == nil)
        {
            let entity = NSEntityDescription.entity(forEntityName: "Note", in: context)
            let newNote = Note(entity: entity!, insertInto: context)
            newNote.id = noteList.count as NSNumber
            newNote.title = titleTF.text
            newNote.desc = descTF.text
            newNote.username = usernameTF.text
            newNote.password = passwordTF.text
            newNote.notes = notesTV.text
            do{
                try context.save()
                noteList.append(newNote)
                navigationController?.popViewController(animated: true)
            }catch{
                print("error")
            }
        }else{
            let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Note")
            do{
                let results:NSArray = try context.fetch(request) as NSArray
                for result in results {
                    let note = result as! Note
                    if(note == selectedNote)
                    {
                        note.title = titleTF.text
                        note.desc = descTF.text
                        note.username = usernameTF.text
                        note.password = passwordTF.text
                        note.notes = notesTV.text
                        try context.save()
                        navigationController?.popViewController(animated: true)
                    }
                }
            }catch{
                print("Fetch Failed")
            }
        }
    }
    
    @IBAction func DeleteNote(_ sender: Any) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context: NSManagedObjectContext = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Note")
        do{
            let results:NSArray = try context.fetch(request) as NSArray
            for result in results {
                let note = result as! Note
                if(note == selectedNote)
                {
                    note.deletedDate = Date()
                    try context.save()
                    navigationController?.popViewController(animated: true)
                }
            }
        }catch{
            print("Fetch Failed")
        }
    }
    
}

