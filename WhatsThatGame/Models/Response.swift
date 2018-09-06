//
//  Response.swift
//  WhatsThatGame
//
//  Created by Fiel Faustino on 22/08/2018.
//  Copyright © 2018 Fiel Faustino. All rights reserved.
//

import Foundation

struct ComicsResponse: Decodable {
    let status: String
    let data: ComicsResponseData
}

struct CharactersResponse: Decodable {
    let status: String
    let data: CharactersResponseData
}

struct ComicsResponseData: Decodable {
    let results: [ComicBook]?
}

struct CharactersResponseData: Decodable {
    let results: [ComicCharacter]?
}
