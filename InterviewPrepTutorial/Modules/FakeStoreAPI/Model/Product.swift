//
//  Product.swift
//  InterviewPrepTutorial
//
//  Created by Sachin Randive on 09/12/25.
//

import Foundation
/*
 [
 {
 "id": 0,
 "title": "string",
 "price": 0.1,
 "description": "string",
 "category": "string",
 "image": "http://example.com"
 }
 ]
 */

struct Product: Identifiable, Codable {
    let id: Int
    let title: String
    let price: Double
    let description: String
    let category: String
    let image: String
}
