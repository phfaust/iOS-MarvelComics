//
//  Thumbnail.swift
//  WhatsThatGame
//
//  Created by Fiel Faustino on 20/08/2018.
//  Copyright © 2018 Fiel Faustino. All rights reserved.
//

import Foundation

struct Thumbnail: Decodable {
    let path: String?
    let ext: String?
    
    private enum CodingKeys: String, CodingKey {
        case path
        case ext = "extension"
    }
    
    func getThumbnailUrl() -> String {
        var thumbnailUrl = ""
        if let path = self.path {
            if let ext = self.ext {
                thumbnailUrl = "\(path).\(ext)"
            }
        }
        
        return thumbnailUrl
    }
}
