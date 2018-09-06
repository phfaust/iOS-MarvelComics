//
//  MasterTableCell.swift
//  WhatsThatGame
//
//  Created by Fiel Faustino on 16/08/2018.
//  Copyright © 2018 Fiel Faustino. All rights reserved.
//

import UIKit

class MasterTableCell: UITableViewCell {

    @IBOutlet weak var comicTitle: UILabel!
    @IBOutlet weak var comicThumbnail: UIImageView!
    @IBOutlet weak var titleBorder: UIView!
    
    static let nibName = "MasterTableCell"
    static let cellIdentifier = "masterTableCell"
    
    // Disable change of background color of the title border view so that it doesn't change when cell is selected
    override func setSelected(_ selected: Bool, animated: Bool) {
        let borderColor = titleBorder.backgroundColor
        
        if selected {
            titleBorder.backgroundColor = borderColor
        }
    }
    
    // Disable change of background color of the title border view so that it doesn't change when cell is highlighted
    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
        let borderColor = titleBorder.backgroundColor
        
        if highlighted {
            titleBorder.backgroundColor = borderColor
        }
    }
    
    // Configure view when comic book and thumbnail url is passed to the controller
    func configure( withComic comicBook: ComicBook, thumbnailUrl: String? ) {
        comicTitle.text = comicBook.title
        if let thumbnailUrlString = thumbnailUrl {
            if let url = URL(string: thumbnailUrlString) {
                comicThumbnail.af_setImage(withURL: url)
            } else {
                if let imageNotAvailableUrl = UrlConstants().imageNotAvailableUrl() {
                    comicThumbnail.af_setImage(withURL: imageNotAvailableUrl)
                } else {
                    print("Error: API image not available jpg file is not available")
                }
            }
        } else {
            if let imageNotAvailableUrl = UrlConstants().imageNotAvailableUrl() {
                comicThumbnail.af_setImage(withURL: imageNotAvailableUrl)
            } else {
                print("Error: API image not available jpg file is not available")
            }
        }
    }
}
