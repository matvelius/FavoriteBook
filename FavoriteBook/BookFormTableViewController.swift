//
//  BookFormTableViewController.swift
//  FavoriteBooks
//
//  Created by Matvey on 3/31/19.
//

import UIKit

class BookFormTableViewController: UITableViewController {
    
    var book: Book?
    
    struct PropertyKeys {
        static let unwind = "UnwindToBookTable"
    }
    
    @IBOutlet var titleField: UITextField!
    @IBOutlet var authorField: UITextField!
    @IBOutlet var genreField: UITextField!
    @IBOutlet var lengthField: UITextField!
    
    @IBAction func saveButtonTapped(_ sender: UIButton) {
        guard let title = titleField.text,
            let author = authorField.text,
            let genre = genreField.text,
            let length = lengthField.text else {return}
        
        book = Book(title: title, author: author, genre: genre, length: length)
        
        performSegue(withIdentifier: PropertyKeys.unwind, sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateView()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    func updateView() {
        
        guard let book = book else {return}
        
        titleField.text = book.title
        authorField.text = book.author
        genreField.text = book.genre
        lengthField.text = book.length
        
    }


}
