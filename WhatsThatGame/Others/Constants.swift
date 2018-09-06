//
//  UrlConstants.swift
//  WhatsThatGame
//
//  Created by Fiel Faustino on 23/08/2018.
//  Copyright © 2018 Fiel Faustino. All rights reserved.
//

import Foundation

struct UrlConstants {
    let comicsUrl = "https://gateway.marvel.com/v1/public/comics"
    func comicBookUrl(comicId: String) -> String {
        return "https://gateway.marvel.com/v1/public/comics/\(comicId)/characters"
    }
    func imageNotAvailableUrl() -> URL? {
        if let imageNotAvailableUrl: URL = URL(string: "http://i.annihil.us/u/prod/marvel/i/mg/b/40/image_not_available.jpg") {
            return imageNotAvailableUrl
        }
        
        print("Error: API image not available jpg file is not available")
        return nil
        
    }
}
