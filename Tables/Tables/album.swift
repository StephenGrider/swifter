//
//  album.swift
//  Tables
//
//  Created by stephen g on 12/16/14.
//  Copyright (c) 2014 stephen g. All rights reserved.
//

import Foundation

class Album {
    var title: String
    var price: String
    var thumbnailImageUrl: String
    var largeImageUrl: String
    var itemUrl: String
    var artistUrl: String
    
    init(title: String, price: String, thumbnailImageUrl: String, largeImageUrl: String, itemUrl: String, artistUrl:String) {
        self.title = title
        self.price = price
        self.thumbnailImageUrl = thumbnailImageUrl
        self.largeImageUrl = largeImageUrl
        self.itemUrl = itemUrl
        self.artistUrl = artistUrl
    }
    
    class func albumsWithJson(json: NSArray) -> [Album] {
        var albums = [Album]()
        
        if json.count>0 {
            for result in json {
                
                var name = result["trackName"] as? String
                if name == nil {
                    name = result["collectionName"] as? String
                }
                
                var price = result["formattedPrice"] as? String
                if price == nil {
                    price = result["collectionPrice"] as? String
                    if price == nil {
                        var priceFloat: Float? = result["collectionPrice"] as? Float
                        var nf: NSNumberFormatter = NSNumberFormatter()
                        nf.maximumFractionDigits = 2
                        if priceFloat != nil {
                            price = "$"+nf.stringFromNumber(priceFloat!)!
                        }
                    }
                }
                
                let thumbnailURL = result["artworkUrl60"] as? String ?? ""
                let imageURL = result["artworkUrl100"] as? String ?? ""
                let artistURL = result["artistViewUrl"] as? String ?? ""
                
                var itemURL = result["collectionViewUrl"] as? String
                if itemURL == nil {
                    itemURL = result["trackViewUrl"] as? String
                }
                
                var newAlbum = Album(title: name!, price: price!, thumbnailImageUrl: thumbnailURL, largeImageUrl: imageURL, itemUrl: itemURL!, artistUrl: artistURL)
                albums.append(newAlbum)
            }
        }
        
        return albums
    }
}

