//
//  Model.swift
//  Networking
//
//  Created by sangheon on 2020/11/09.
//

import Foundation

struct APIResponse:Decodable {
    let results:[Friend]
}

struct Friend:Decodable {
    struct Name:Decodable {
        let title:String
        let first:String
        let last:String
        
        var full:String {
            return self.title.capitalized + "." + self.first.capitalized + " " + self.last.capitalized
        }
    }
    
    struct Picture:Decodable {
        let large:String
        let medium:String
        let thumnail:String
    }
    
    let name:Name
    let email:String
    let picture: Picture
}
