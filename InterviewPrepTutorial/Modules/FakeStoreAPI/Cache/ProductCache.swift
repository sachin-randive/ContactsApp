//
//  ProductCache.swift
//  InterviewPrepTutorial
//
//  Created by Sachin Randive on 13/12/25.
//

import Foundation

struct ProductCache {
    private let documentsDirectoryURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
    private let filename = "products.json"
    
     func saveProducts(_ products: [Product]) throws {
        guard let fileURL = documentsDirectoryURL?.appendingPathComponent(filename) else {
            return
        }
        do {
            let data = try JSONEncoder().encode(products)
            try data.write(to: fileURL)
        } catch {
            print("Unable to fetch documents directory Products")
        }
    }
    
    func fetchProducts() throws -> [Product] {
        guard let fileURL = documentsDirectoryURL?.appendingPathComponent(filename) else {
            return []
        }
        guard FileManager.default.fileExists(atPath: fileURL.path) else {
            return []
        }
        let data = try Data(contentsOf: fileURL)
        return try JSONDecoder().decode([Product].self, from: data)
    }
    
    func invalidateCache() {
        guard let fileURL = documentsDirectoryURL?.appendingPathComponent(filename) else {
            return
        }
        do {
            try FileManager.default.removeItem(at: fileURL)
        } catch {
            print("Unable to remove cache file")
        }
    }
}

