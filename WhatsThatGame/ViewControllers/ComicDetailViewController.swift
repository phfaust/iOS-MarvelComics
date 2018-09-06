//
//  ComicDetailViewController.swift
//  WhatsThatGame
//
//  Created by Fiel Faustino on 17/08/2018.
//  Copyright © 2018 Fiel Faustino. All rights reserved.
//

import UIKit
import Alamofire

class ComicDetailViewController: UIViewController {

    @IBOutlet weak var comicTitle: UILabel!
    @IBOutlet weak var comicImage: UIImageView!
    @IBOutlet weak var comicDescription: UILabel!
    @IBOutlet weak var comicCharacters: UILabel!
    
    var comicBook: ComicBook!
    var coverImage: UIImage!
    var coverImageUrl: String!
    var comicCharacterList = [ComicCharacter]()
    
    convenience init(comicBook: ComicBook, coverImageUrl: String? = nil) {
        self.init()
        
        self.comicBook = comicBook
        self.coverImageUrl = coverImageUrl
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        getCharacters(fromComic: String(comicBook.id))
        assignValues()
    }
    
    // Assign values of the title text, description text and cover image from the comic book object and coverImage
    func assignValues() {
        comicTitle.text = comicBook.title
        comicDescription.text = comicBook.description
        
        if let url = URL(string: coverImageUrl) {
            comicImage.af_setImage(withURL: url)
            comicImage.contentMode = .scaleAspectFit
        }
    }
    
    // Get characters that appear in the comic from the API
    func getCharacters(fromComic comicBookId: String) {
//        let comicBookId = String(comicBook.id)
        
        let url = UrlConstants().comicBookUrl(comicId: comicBookId)
        
        AlamofireManager.getCharacters(fromUrlWithParameters: url, comicId: comicBookId) {
            characterList in
                var charactersString = ""
            
                if let charactersList = characterList {
                    if ( charactersList.count > 0 ) {
                        for comicCharacter in charactersList {
                            self.comicCharacterList.append(comicCharacter)
                            charactersString.append(comicCharacter.name)
                            
                            if ( comicCharacter.id != charactersList.last?.id ) {
                                charactersString.append(", ")
                            }
                        }
                        
                        self.comicCharacters.text = charactersString
                    } else {
                        self.comicCharacters.text = "None"
                    }
                } else {
                    print("API did not return any character list")
                }
            
            }
    }

}
