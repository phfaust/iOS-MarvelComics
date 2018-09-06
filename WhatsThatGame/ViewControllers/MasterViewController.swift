//
//  MasterViewController.swift
//  WhatsThatGame
//
//  Created by Fiel Faustino on 13/08/2018.
//  Copyright © 2018 Fiel Faustino. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class MasterViewController: UITableViewController {

    var comicBooks = [ComicBook]()
    var comicThumbnails = [String : UIImage]()
    var thumbnails = [String]()


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        UINavigationBar.appearance().tintColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        
        navigationItem.title = "Marvel DigiComics"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.red, NSAttributedStringKey.font: UIFont(name: "DIN Condensed", size: 25)]
        
        let comicTitleCell = UINib(nibName: MasterTableCell.nibName, bundle: nil)
        self.tableView.register(comicTitleCell, forCellReuseIdentifier: MasterTableCell.cellIdentifier)
        
        self.tableView.rowHeight = 200
    
        getData()
    }

    // MARK: - Table View

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comicBooks.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MasterTableCell.cellIdentifier, for: indexPath) as! MasterTableCell

        let comic = comicBooks[indexPath.row]
        
        // Assigns cell its comic and thumbnail
        if let comicThumbnail = comic.thumbnail {
            cell.configure(withComic: comic, thumbnailUrl: comicThumbnail.getThumbnailUrl())
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let comicBook = comicBooks[indexPath.row]
        
        var vc = ComicDetailViewController(comicBook: comicBook)
        
        // Checks if comic was assigned a cover image
        if let coverImage = comicBook.thumbnail {
            vc = ComicDetailViewController(comicBook: comicBook, coverImageUrl: coverImage.getThumbnailUrl())
        }
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    // MARK: - Functions
    
    // Get initial data from Marvel API (first 20 comics)
    func getData() {
        let url = UrlConstants().comicsUrl
        
        AlamofireManager.getComics(fromUrlWithParameters: url, format: "comic", hasDigitalIssue: "true") {
            response in
            
            if let comicBooks = response {
                self.comicBooks = comicBooks
            } else {
                print("API did not return any comic books")
            }
            
                self.tableView.reloadData()
        }
    }
}

