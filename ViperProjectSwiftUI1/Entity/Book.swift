//
//  Book.swift
//  ViperProjectSwiftUI1
//
//  Created by Pedro Luis on 20/06/23.
//

struct Book : Codable, Identifiable {
    let id: Int
    let title: String
    let authors: [Author]
    let description: String
}
