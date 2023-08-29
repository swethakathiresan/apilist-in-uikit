//
//  ViewController.swift
//  titlelist
//
//  Created by Boopathi on 22/08/23.
//


import UIKit

class ViewController: UITableViewController, DetailViewControllerDelegate {

    var titles: [BookModel]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let bookTitleList = BookTitleList()
        bookTitleList.fetchTitles { titleslist in
            self.titles = titleslist
            self.tableView.reloadData()
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BookTitle", for: indexPath)
        let book = titles?[indexPath.row]
        cell.textLabel?.text = book?.title
        return cell
    }

    //segue method
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DetailViewController,
           let indexPath = tableView.indexPathForSelectedRow {
            destination.book = titles?[indexPath.row]
            destination.indexPath = indexPath
            destination.delegate = self
        }
    }
    
    // Delegate method
    func didChangeTitle(newTitle: String, atIndexPath indexPath: IndexPath) {
        titles?[indexPath.row].title = newTitle
        tableView.reloadRows(at: [indexPath], with: .none)
    }
    
}



//import UIKit
//
//class ViewController: UITableViewController {
//
//    var titles : [BookModel]?
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        let bookTitleList = BookTitleList()
//        bookTitleList.fetchTitles { titleslist in
//            self.titles = titleslist
//            self.tableView.reloadData()
//
//        }
//    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return titles?.count ?? 0
//    }
//
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "BookTitle", for: indexPath)
//
//        let book = titles?[indexPath.row]
//        cell.textLabel?.text = book?.title
//        return cell
//    }
//
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//            if let destination = segue.destination as? DetailViewController,
//               let indexPath = tableView.indexPathForSelectedRow {
//                destination.book = titles?[indexPath.row]
//            }
//        }
//}

// MARK: - Properties
//    var decodedData = [BookModel]()
//    let reuseIdentifier = "BookTitle"
//    var booktitle = "TITLE LIST"

//    {
//        didSet {
//            tableView.reloadData()
//        }
//    }

// MARK: - Lifecycle
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view.
////        configureTableView()
//
//        let bookTitleList = BookTitleList()
//        bookTitleList.fetchTitles { (titleslist)  in
////            self.decodedData = decodedData
////            print(titles)
//            self.titles =  titleslist
//        }
//
//    }

    // MARK: - Helpers
    
//    func configureTableView() {
////        tableView.backgroundColor = .tintColor
//        tableView.tableFooterView = UIView()
//    }
// MARK: -UITableViewDataSource & UITableViewDelegate Methods

//extension ViewController{
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return titles?.count ?? 0
//    }
//
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
//
//        let book = titles?[indexPath.row]
//        cell.textLabel?.text = book?.title
//
////        guard let book = titles?[indexPath.row] else { return UITableViewCell()}
////        cell.textLabel?.text = "\(book.id) - \(book.title) "
//
//        return cell
//    }
//
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//            if let destination = segue.destination as? DetailViewController,
//               let indexPath = tableView.indexPathForSelectedRow {
//                destination.book = titles?[indexPath.row]
//            }
//        }
//
//}
