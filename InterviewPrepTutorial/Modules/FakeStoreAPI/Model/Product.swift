//
//  Product.swift
//  InterviewPrepTutorial
//
//  Created by Sachin Randive on 09/12/25.
//

import Foundation

struct Product: Identifiable, Codable, Equatable {
    let id: Int
    let title: String
    let price: Double
    let description: String
    let category: String
    let image: String
}

extension Product {
    static let mockProducts: [Product] = [
        Product(
            id: 1,
            title: "Wireless Bluetooth Headphones",
            price: 59.99,
            description: "Comfortable over-ear design with 20-hour battery life and deep bass sound.",
            category: "electronics",
            image: "https://picsum.photos/200/200"
        ),
        Product(
            id: 2,
            title: "Smart Fitness Watch",
            price: 129.49,
            description: "Track heart rate, steps, sleep quality, and more with this sleek smartwatch.",
            category: "wearables",
            image: "https://picsum.photos/200/200"
        ),
        Product(
            id: 3,
            title: "Classic Leather Wallet",
            price: 24.99,
            description: "Premium hand-stitched leather wallet with 6 card slots and RFID protection.",
            category: "fashion",
            image: "https://picsum.photos/200/200"
        ),
        Product(
            id: 4,
            title: "Portable Mini Speaker",
            price: 39.00,
            description: "Compact speaker delivering crisp audio and powerful bass with Bluetooth 5.0.",
            category: "electronics",
            image: "https://picsum.photos/200/200"
        ),
        Product(
            id: 5,
            title: "Stainless Steel Water Bottle",
            price: 14.95,
            description: "Keeps drinks cold for 12 hours and hot for 8 hours. Eco-friendly material.",
            category: "home",
            image: "https://picsum.photos/200/200"
        ),
        Product(
                id: 6,
                title: "Gaming Mechanical Keyboard",
                price: 89.99,
                description: "RGB backlit mechanical keyboard with blue switches for ultimate feedback.",
                category: "electronics",
                image: "https://picsum.photos/200/200"
            ),
            Product(
                id: 7,
                title: "Noise Cancelling Earbuds",
                price: 49.50,
                description: "Lightweight earbuds with active noise cancellation and long battery life.",
                category: "electronics",
                image: "https://picsum.photos/200/200"
            ),
            Product(
                id: 8,
                title: "Cotton Crew Neck T-Shirt",
                price: 12.99,
                description: "Premium soft cotton T-shirt available in multiple colors.",
                category: "fashion",
                image: "https://picsum.photos/200/200"
            ),
            Product(
                id: 9,
                title: "Ergonomic Office Chair",
                price: 199.99,
                description: "High-back ergonomic chair with lumbar support and breathable mesh.",
                category: "furniture",
                image: "https://picsum.photos/200/200"
            ),
            Product(
                id: 10,
                title: "USB-C Fast Charger 30W",
                price: 18.75,
                description: "Compact fast charger capable of powering phones and tablets quickly.",
                category: "electronics",
                image: "https://picsum.photos/200/200"
            ),
            Product(
                id: 11,
                title: "4K Ultra HD TV 55\"",
                price: 499.00,
                description: "Crystal-clear 4K display with HDR10+ and built-in streaming apps.",
                category: "electronics",
                image: "https://picsum.photos/200/200"
            ),
            Product(
                id: 12,
                title: "Premium Yoga Mat",
                price: 34.99,
                description: "Non-slip yoga mat with carrying strap. Ideal for workouts and stretching.",
                category: "fitness",
                image: "https://picsum.photos/200/200"
            ),
            Product(
                id: 13,
                title: "Air Purifier",
                price: 129.99,
                description: "HEPA filter air purifier ideal for bedrooms and living rooms.",
                category: "home",
                image: "https://picsum.photos/200/200"
            ),
            Product(
                id: 14,
                title: "Digital DSLR Camera",
                price: 749.00,
                description: "24MP DSLR with 1080p video capture and interchangeable lens support.",
                category: "electronics",
                image: "https://picsum.photos/200/200"
            )
    ]
}
