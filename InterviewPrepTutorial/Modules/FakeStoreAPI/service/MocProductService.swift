//
//  MocProductService.swift
//  InterviewPrepTutorial
//
//  Created by Sachin Randive on 23/12/25.
//
import Foundation

struct MocProductService: ProductServiceProtocol {
    var mockProducts = Product.mockProducts
    var erroThrows: Error?
    func refreshProducts() async throws -> [Product] {
        if let erroThrows {  throw erroThrows }
        return mockProducts
    }
    
    func fetchProducts() async throws -> [Product] {
        if let erroThrows {  throw erroThrows }
        try await Task.sleep(for: .seconds(2))
        return mockProducts
    }
}
