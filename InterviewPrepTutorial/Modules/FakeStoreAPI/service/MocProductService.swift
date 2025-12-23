//
//  MocProductService.swift
//  InterviewPrepTutorial
//
//  Created by Sachin Randive on 23/12/25.
//
import Foundation

struct MocProductService: ProductServiceProtocol {
    func refreshProducts() async throws -> [Product] {
        return Product.mockProducts
    }
    
    func fetchProducts() async throws -> [Product] {
        try await Task.sleep(for: .seconds(2))
        return Product.mockProducts
    }
}
