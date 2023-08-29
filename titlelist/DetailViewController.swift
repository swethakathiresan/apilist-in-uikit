//
//  DetailViewController.swift
//  titlelist
//
//  Created by Boopathi on 28/08/23.
//

import UIKit

protocol DetailViewControllerDelegate: AnyObject {
    func didChangeTitle(newTitle: String, atIndexPath indexPath: IndexPath)
}

class DetailViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var albumIdLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var titletextfield: UITextField!
    @IBOutlet weak var urlimage: UIImageView!
    @IBOutlet weak var thumbanailimage: UIImageView!
    var book: BookModel?
    var indexPath: IndexPath?
    //Setting up the Delegate
    weak var delegate: DetailViewControllerDelegate?
//    weak var delegate = didChangeTitle(newTitle: String, indexPath: IndexPath)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let book = book {
            titleLabel.text = "Title:"
            albumIdLabel.text = "Album ID: \(book.albumId)"
            idLabel.text = "ID: \(book.id)"
            titletextfield.text = book.title
            //            urlimage.image = book.url
            //            thumbanailimage.image = book.thumbnailUrl
            let data = try? Data(contentsOf: book.url)
            let dataa = try? Data(contentsOf: book.thumbnailUrl)
            urlimage.image = UIImage(data: data!)
            thumbanailimage.image = UIImage(data: dataa!)
        }
    }
    
    @IBAction func changedtitlebutton(_ sender: Any) {
        if let newTitle = titletextfield.text,
           let indexPath = indexPath {
            delegate?.didChangeTitle(newTitle: newTitle, atIndexPath: indexPath)
        }
    }
    
}

//import UIKit
//
//class DetailViewController: UIViewController {
//
//    @IBOutlet weak var titleLabel: UILabel!
//
//    @IBOutlet weak var albumIdLabel: UILabel!
//
//    @IBOutlet weak var idLabel: UILabel!
//
//    @IBOutlet weak var titletextfield: UITextField!
//
//    @IBOutlet weak var changedtitle: UITextField!
//    //    @IBOutlet weak var changedtitle: UITextField!
//    var book: BookModel?
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        //            titletextfield.delegate = self
//        if let book = book {
//            titleLabel.text = "Title:"
//            albumIdLabel.text = "Album ID: \(book.albumId)"
//            idLabel.text = "ID: \(book.id)"
//            titletextfield.text = book.title
//            // Load and display images from URLs: book.url, book.thumbnailUrl
//        }
//
//    }
//
//    @IBAction func changedtitlebutton(_ sender: Any) {
//        //        let titletextfield = titletextfield.text
//        changedtitle.text = titletextfield.text
//    }
//}
//    @IBAction func changetitlebutton(_ sender: Any) {
//        let titlelabel = titleLabel.text ?? ""
//        changedtitle.text = titlelabel
//    }


//extension DetailViewController : UITextFieldDelegate {
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        textField.resignFirstResponder()
//        return true
//    }
//}
