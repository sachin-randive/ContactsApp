//
//  ProductsViewModeltests.swift
//  InterviewPrepTutorialTests
//
//  Created by Sachin Randive on 23/12/25.
//

import Testing
@testable import InterviewPrepTutorial

struct ProductsViewModeltests {

    // fetch Product success
    @Test func testFetchProductsSuccess()  async {
        let service = MocProductService()
        let viewModel = ProductViewModel(service: service)
        await viewModel.fetchProducts()
        #expect(viewModel.products == Product.mockProducts)
        #expect(viewModel.loadingState == .completed)
    }
    
    // fetch Products empty state
    
    @Test func testFetchProductsEmptyState()  async {
        var service = MocProductService()
        service.mockProducts = []
        let viewModel = ProductViewModel(service: service)
        await viewModel.fetchProducts()
        #expect(viewModel.products.isEmpty)
        #expect(viewModel.loadingState == .empty)
    }
    
    // fetch products failure
    @Test func testFetchProductsFailure()  async {
        var service = MocProductService()
        let error = APIError.invalidData
        service.erroThrows = error
        let viewModel = ProductViewModel(service: service)
        await viewModel.fetchProducts()
        
        #expect(viewModel.products.isEmpty)
        #expect(viewModel.loadingState == .error(error: error))
    }
    
    //refresh product success
    @Test func testRefreshProductsSuccess()  async {
        let service = MocProductService()
        let viewModel = ProductViewModel(service: service)
        await viewModel.refreshProducts()
        #expect(viewModel.products == Product.mockProducts)
        #expect(viewModel.loadingState == .completed)
    }
    // refresh products failure
    @Test func testRefreshProductsFailure()  async {
        var service = MocProductService()
        let error = APIError.invalidData
        service.erroThrows = error
        let viewModel = ProductViewModel(service: service)
        await viewModel.refreshProducts()
        
        #expect(viewModel.products.isEmpty)
        #expect(viewModel.loadingState == .error(error: error))
    }

}
