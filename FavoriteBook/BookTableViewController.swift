
import UIKit

class BookTableViewController: UITableViewController {
    
    struct PropertyKeys {
        static let bookCell = "BookCell"
        static let addBookSegue = "AddBook"
        static let editBookSegue = "EditBook"
    }
    
    var books: [Book] = []
    
    var bookArchiveURL: URL {
        let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        return documentsURL.appendingPathComponent("books")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }
    
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("books count is \(books.count)")
        return books.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PropertyKeys.bookCell, for: indexPath) as! BookTableViewCell
        
        print("index path is: \(indexPath)")
        
        let book = books[indexPath.row]
//        cell.textLabel?.text = book.title
//        cell.detailTextLabel?.text = book.description
        
        cell.update(with: book)
        
        return cell
    }
    
    // MARK: - Navigation
    
    @IBAction func prepareForUnwind(segue: UIStoryboardSegue) {
        print("prepareForUnwind called!")
        guard let source = segue.source as? BookFormTableViewController,
            let book = source.book else {return}
        
        if let indexPath = tableView.indexPathForSelectedRow {
            books.remove(at: indexPath.row)
            // WHY DOES THIS FIX THE ISSUE?!
//            books.insert(book, at: indexPath.row)
            tableView.deselectRow(at: indexPath, animated: true)
            
        } else {
            books.append(book)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let bookFormTableViewController = segue.destination as? BookFormTableViewController else {return}
        
        print("prepare for segue called!")
        
        if let indexPath = tableView.indexPathForSelectedRow,
            segue.identifier == PropertyKeys.editBookSegue {
//            print("editing!")
            bookFormTableViewController.book = books[indexPath.row]
        }
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            books.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
}
