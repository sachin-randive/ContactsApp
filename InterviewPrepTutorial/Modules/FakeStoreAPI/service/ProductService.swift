//
//  ProductService.swift
//  InterviewPrepTutorial
//
//  Created by Sachin Randive on 10/12/25.
//

import Foundation

protocol ProductServiceProtocol {
    func fetchProducts() async throws -> [Product]
}

struct ProductService: ProductServiceProtocol {
    
    func fetchProducts() async throws -> [Product] {
        return []
    }
}

struct MocProductService: ProductServiceProtocol {
    
    func fetchProducts() async throws -> [Product] {
        try await Task.sleep(for: .seconds(2))
        return Product.mockProducts
    }
}
