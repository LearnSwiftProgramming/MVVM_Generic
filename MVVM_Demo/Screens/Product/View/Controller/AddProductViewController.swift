//
//  AddProductViewController.swift
//  MVVM_Demo
//
//  Created by Rahul Ajmera on 15/09/23.
//

import UIKit




//struct ProductResponse:Decodable {
//    let id:Int
//    let title:String
//}
class AddProductViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       addProduct()
        // Do any additional setup after loading the view.
    }
    
    func addProduct(){
        // url
        guard let url = URL(string: "https://dummyjson.com/products/add") else{ return}
        // parametesr
        let parameters = AddProduct(title: "BMW Car")
        // request
        var request = URLRequest(url: url)
        // method
        request.httpMethod = "POST"
        // Model to data convert
        // body
        request.httpBody = try? JSONEncoder().encode(parameters)
        request.allHTTPHeaderFields = [
            "Content-Type": "application/json"
        ]
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data  else { return }
            do{
                // data to model convert -> jsondecoder + decodable
                let productResponse = try JSONDecoder().decode(AddProduct.self, from: data)
                print(productResponse)
            }catch{
                print(error)
            }
            
        }.resume()
    }
   

}




//JSONDecoder: Data to convert model
//JSONEncoder: Model to convert data

