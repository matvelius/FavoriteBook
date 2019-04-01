//
//  BookTableViewCell.swift
//  FavoriteBooks
//
//  Created by Matvey on 3/31/19.
//

import UIKit

class BookTableViewCell: UITableViewCell {
    @IBOutlet var bookTitleLabel: UILabel!
    @IBOutlet var authorLabel: UILabel!
    @IBOutlet var genreLabel: UILabel!
    @IBOutlet var lengthLabel: UILabel!
    
    func update(with book: Book) {
        bookTitleLabel.text = book.title
        authorLabel.text = book.author
        genreLabel.text = book.genre
        lengthLabel.text = book.length
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
