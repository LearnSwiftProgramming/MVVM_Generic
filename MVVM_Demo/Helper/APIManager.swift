//
//  APIManager.swift
//  MVVM_Demo
//
//  Created by Rahul Ajmera on 13/09/23.
//

import Foundation
import UIKit



typealias Handler<T> = (Result<T,DataError>) -> Void

// Singleton design pattern
final class APIManager{
    static let shared = APIManager()
    private init(){
        
    }
    
    func request<T:Decodable>(modelType:T.Type,type:EndPointType,handler:@escaping Handler<T>){
        
                // get url
        guard let url = type.url else {
                    handler(.failure(.invalidURL))
                    return
                }
                // Networking calling
                URLSession.shared.dataTask(with: url) { data, resposne, error in
                    // check data
                    guard let data, error == nil else {
                        handler(.failure(.invalidData))
                        return
        
                    }
                        // check response
        
                    guard let response = resposne as? HTTPURLResponse,
                          200 ... 299 ~= response.statusCode else{
                        handler(.failure(.invalidResponse))
                        return
                    }
                    do{
                        // json Decoder convert data to model
                        let products = try  JSONDecoder().decode(modelType, from: data)
                        handler(.success(products))
                    }catch{
                        // error
                        print(error)
                        handler(.failure(.message(error: error)))
                    }
        
                }.resume()
        
    }
    
    
//    func fetchProducts(handler: @escaping Handler){
//        // get url
//        guard let url = URL(string: Constant.API.productURL)else {
//            handler(.failure(.invalidURL))
//            return
//        }
//        // Networking calling
//        URLSession.shared.dataTask(with: url) { data, resposne, error in
//            // check data
//            guard let data, error == nil else {
//                handler(.failure(.invalidData))
//                return
//
//            }
//                // check response
//
//            guard let response = resposne as? HTTPURLResponse,
//                  200 ... 299 ~= response.statusCode else{
//                handler(.failure(.invalidResponse))
//                return
//            }
//            do{
//                // json Decoder convert data to model
//                let products = try  JSONDecoder().decode([Product].self, from: data)
//                handler(.success(products))
//            }catch{
//                // error
//                print(error)
//                handler(.failure(.message(error: error)))
//            }
//
//        }.resume()
//    }
    
}
//class A:APIManager{
//    override func temp(){
//
//    }
////    func configuration(){
////
////        let manager = APIManager()
////        manager.temp()
////        APIManager.shared.temp()
////    }
//}
