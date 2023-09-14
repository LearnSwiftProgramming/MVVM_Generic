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
        APIManager.shared.fetchProducts { response in
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
    
}


extension ProductViewModel{
    enum Event{
        case loading
        case stopLoading
        case dataLoaded
        case error(Error?)
        
    }
}
