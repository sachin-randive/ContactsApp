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
    
    private let downloader: HTTPDataDownloaderProtocol
    
    init(downloader: HTTPDataDownloaderProtocol = HTTPDataDownloader(endpoint: .products, cache: CacheManager(filename: "products.json"))) {
        self.downloader = downloader
    }
    
    func fetchProducts() async throws -> [Product] {
        return try await downloader.fetchData(as: Product.self)
    }
}

struct MocProductService: ProductServiceProtocol {
    
    func fetchProducts() async throws -> [Product] {
        try await Task.sleep(for: .seconds(2))
        return Product.mockProducts
    }
}
