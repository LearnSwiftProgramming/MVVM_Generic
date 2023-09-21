//
//  ProductEndPoint.swift
//  MVVM_Demo
//
//  Created by Rahul Ajmera on 21/09/23.
//

import Foundation

enum ProductEndPoint{
    case products
    case addProduct(product:AddProduct)
}
extension ProductEndPoint:EndPointType{
    var body: Encodable? {
        switch self{
        case .products:
            return nil
        case .addProduct(let product):
            return product
        }
    }
    
    // common Headers
    var headers: [String : String]? {
        return  APIManager.commonHeaders
    }
    
    var path: String {
        switch self{
        case .products:
            return "products"
        case .addProduct:
            return "products/add"
        }
    }
    
    var baseURL: String {
        switch self{
        case.products:
            return "https://fakestoreapi.com/"
        case .addProduct:
            return "https://dummyjson.com/"
        }
        }
       
    
    var url: URL? {
        return URL(string: "\(baseURL)\(path)")
    }
    
    var method: HTTPMethods {
        switch self{
        case .products:
            return .get
        case .addProduct:
            return .post
            
        }
         
    }
    
    
}
