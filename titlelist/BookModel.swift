//
//  BookModel.swift
//  titlelist
//
//  Created by Boopathi on 22/08/23.
//

import Foundation

struct BookModel: Decodable {
    let albumId: Int
    let id: Int
    var title: String
    let url: URL
    let thumbnailUrl: URL
}
