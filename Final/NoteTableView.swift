//
//  NoteTableView.swift
//  Final
//
//  Created by Mac User on 12/12/22.
//

import Foundation
import UIKit

var noteList = [Note]()

class NoteTableView: UITableViewController {
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let noteCell = tableView.dequeueReusableCell(withIdentifier: "noteCellID") as! NoteCell
        
        let thisNote: Note!
        thisNote = noteList[indexPath.row]
        
        noteCell.titleLabel.text = thisNote.title
        noteCell.descLabel.text = thisNote.desc
        
        return noteCell
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return noteList.count
    }
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
    }
}

