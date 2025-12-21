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
   // private let urlString = "https://fakestoreapi.com/products"
    private let cache = CacheManager(filename: "products.json")
    private let refreshInterval: TimeInterval = 60 * 10 // 10 Min
    private var lastFetchedTime: Date?
    private let downloader: HTTPDataDownloaderProtocol
    
    init(downloader: HTTPDataDownloaderProtocol = HTTPDataDownloader()) {
        self.downloader = downloader
        getLastFetchedTime()
    }
    
    func fetchProducts() async throws -> [Product] {
        if !needRefresh {
            print(">>> Fetching products from cache")
            return try cache.getData(as: Product.self)
        }
        
        let products = try await downloader.fetchData(as: Product.self, from: .products)
        saveLastFetchedTime()
        cache.saveData(products)
        return products
    }
    
    private func saveLastFetchedTime() {
        UserDefaults.standard.set(Date(), forKey: "lastFetchedTime")
    }
    
    private mutating func getLastFetchedTime() {
        lastFetchedTime = UserDefaults.standard.object(forKey: "lastFetchedTime") as? Date
    }
    private var needRefresh: Bool {
        guard let lastFetchedTime = lastFetchedTime else { return true }
        print("Last fetched time: \(lastFetchedTime)")
        print("Time since last fetch: \(Date().timeIntervalSince(lastFetchedTime))")
        return Date().timeIntervalSince(lastFetchedTime) > refreshInterval
    }
}

struct MocProductService: ProductServiceProtocol {
    
    func fetchProducts() async throws -> [Product] {
        try await Task.sleep(for: .seconds(2))
        return Product.mockProducts
    }
}
