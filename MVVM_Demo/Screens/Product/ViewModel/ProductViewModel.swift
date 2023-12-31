//
//  ProductViewModel.swift
//  MVVM_Demo
//
//  Created by Rahul Ajmera on 13/09/23.
//

import Foundation

final class ProductViewModel{
    
    var prodcuts:[Product] = []
    
    var eventHandler: ((_ event:Event) -> Void)? // data binding closure
    
    func fetchProducts(){
        self.eventHandler?(.loading)
        APIManager.shared.request(modelType: [Product].self, type: ProductEndPoint.products) { response in
                        self.eventHandler?(.stopLoading)
                        switch response{
                        case .success(let products):
                            print(products)
                            self.prodcuts = products
                            self.eventHandler?(.dataLoaded)
                        case .failure(let error):
                            print(error)
                            self.eventHandler?(.error(error))
                        
                        }
            
                    }
        }
    
    func addProduct(parameters:AddProduct){
        APIManager.shared.request(modelType: AddProduct.self, type: ProductEndPoint.addProduct(product: parameters)) { results in
            switch results{
            case .success(let product):
                self.eventHandler?(.newProductAdd(product: product))
            case .failure(let error):
                self.eventHandler?(.error(error))
            }
        }
        
    }
    }

        


    
//    func fetchProducts(){
//        self.eventHandler?(.loading)
//        APIManager.shared.fetchProducts { response in
//            self.eventHandler?(.stopLoading)
//            switch response{
//            case .success(let products):
//                print(products)
//                self.prodcuts = products
//                self.eventHandler?(.dataLoaded)
//            case .failure(let error):
//                print(error)
//                self.eventHandler?(.error(error))
//            }
//
//        }
//    }
    



extension ProductViewModel{
    enum Event{
        case loading
        case stopLoading
        case dataLoaded
        case error(Error?)
        case newProductAdd(product:AddProduct)
        
    }
}
