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
    private let urlString = "https://fakestoreapi.com/products"
    func fetchProducts() async throws -> [Product] {
        guard let url = URL(string: urlString) else { throw APIError.invalidURL}
        let (data, response) = try await URLSession.shared.data(from: url)
        try validateResponse(response)
        return try JSONDecoder().decode([Product].self, from: data)
    }
    
    func validateResponse(_ response: URLResponse) throws {
        guard let httpResponse = response as? HTTPURLResponse else {
            throw APIError.invalidResponse
        }
        guard httpResponse.statusCode == 200 else {
            throw APIError.invalidResponse
        }
    }
}

struct MocProductService: ProductServiceProtocol {
    
    func fetchProducts() async throws -> [Product] {
        try await Task.sleep(for: .seconds(2))
        return Product.mockProducts
    }
}
