//
//  CacheManager.swift
//  InterviewPrepTutorial
//
//  Created by Sachin Randive on 21/12/25.
//

import Foundation
protocol CacheManagerProtocol {
    func getData<T:Codable>(as type: T.Type) throws -> [T]
    func saveData<T:Codable>(_ data: [T])
    func invalidateCache()
    
    var filename: String { get }
}

struct CacheManager: CacheManagerProtocol {
    let filename: String
    
    init(filename: String) {
        self.filename = filename
    }
}

extension CacheManagerProtocol {
    var documentsDirectoryURL: URL? {
        FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    }
    
    func getData<T:Codable>(as type: T.Type) throws -> [T] {
        guard let fileURL = documentsDirectoryURL?.appendingPathComponent(filename) else {
            return []
        }
        guard FileManager.default.fileExists(atPath: fileURL.path) else {
            return []
        }
        let data = try Data(contentsOf: fileURL)
        return try JSONDecoder().decode([T].self, from: data)
    }
    
    func saveData<T:Codable>(_ data: [T]) {
        guard let fileURL = documentsDirectoryURL?.appendingPathComponent(filename) else {
            return
        }
        do {
            let data = try JSONEncoder().encode(data)
            try data.write(to: fileURL)
        } catch {
            print("Unable to fetch documents directory Products")
        }
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
