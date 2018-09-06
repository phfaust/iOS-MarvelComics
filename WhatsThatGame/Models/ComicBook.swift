//
//  ComicBook.swift
//  WhatsThatGame
//
//  Created by Fiel Faustino on 14/08/2018.
//  Copyright © 2018 Fiel Faustino. All rights reserved.
//

import Foundation

struct CharacterList: Decodable {
    let items: [Character]
}

struct Character: Decodable {
    let name: String
}

struct ComicBook: Decodable{
    let id: Int
    let title: String?
    let description: String?
    let thumbnail: Thumbnail?
    let characters: CharacterList?
}
