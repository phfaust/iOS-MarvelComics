//
//  ComicCharacter.swift
//  WhatsThatGame
//
//  Created by Fiel Faustino on 20/08/2018.
//  Copyright © 2018 Fiel Faustino. All rights reserved.
//

import Foundation

struct ComicCharacter: Decodable {
    let id: Int
    let name: String
    let thumbnail: Thumbnail?
}
