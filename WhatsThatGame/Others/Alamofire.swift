//
//  Alamofire.swift
//  WhatsThatGame
//
//  Created by Fiel Faustino on 20/08/2018.
//  Copyright © 2018 Fiel Faustino. All rights reserved.
//

import Foundation
import Alamofire

class AlamofireManager {
    static func getComics( fromUrlWithParameters url: String, format: String?, hasDigitalIssue: String?, completion: @escaping([ComicBook]?) -> () ) {
        
        var parameters = ["apikey": "543ab6dd3d414983e71b41c14300e826",
                          "ts": "skidikipappap",
                          "hash": "ba7e126f0e775a9d6e76b3729058d47c"]
        
        let formatParam = format
        parameters["format"] = formatParam
        
        let hasDigitalIssueParam = hasDigitalIssue
        parameters["hasDigitalIssue"] = hasDigitalIssueParam
        
        Alamofire.request( url, parameters: parameters, headers: ["Accept": "application/json"] )
            .responseJSON { response in
                guard response.result.isSuccess,
                    let _ = response.result.value else {
                        print( "Error fetching results: \(response.result.error ?? "" as! Error )" )
                        return
                }

                do {
                    if let responseData = response.data {
                        let jsonResponse = try JSONDecoder().decode(ComicsResponse.self, from: responseData)

                        if let comicBooks = jsonResponse.data.results {
                            completion(comicBooks)
                        } else {
                            print("There were no comic books returned")
                            
                            completion(nil)
                        }

                    }

                } catch let error {
                    print("Error: \(error)")
                }
        }
    }
    
    static func getCharacters( fromUrlWithParameters url: String, comicId: String?, completion: @escaping([ComicCharacter]?) -> () ) {
        
        var parameters = ["apikey": "543ab6dd3d414983e71b41c14300e826",
                          "ts": "skidikipappap",
                          "hash": "ba7e126f0e775a9d6e76b3729058d47c"]
        
        let comicIdParam = comicId
            parameters["comicId"] = comicIdParam
        
        Alamofire.request( url, parameters: parameters, headers: ["Accept": "application/json"] )
            .responseJSON { response in
                guard response.result.isSuccess,
                    let _ = response.result.value else {
                        print( "Error fetching results: \(response.result.error ?? "" as! Error )" )
                        return
                }
                
                do {
                    if let responseData = response.data {
                        let jsonResponse = try JSONDecoder().decode(CharactersResponse.self, from: responseData)
                        
                        if let characters = jsonResponse.data.results {
                            completion(characters)
                        } else {
                            print("There were no characters returned")
                            
                            completion(nil)
                        }
                        
                    }
                    
                } catch let error {
                    print("Error: \(error)")
                }
        }
    }
    
    static func downloadImage( withUrl url: String, completion: @escaping(UIImage) ->() ) {
        Alamofire.request(url).responseImage {
            response in
            if let image = response.result.value {
                completion(image)
            }
        }
    }
}
