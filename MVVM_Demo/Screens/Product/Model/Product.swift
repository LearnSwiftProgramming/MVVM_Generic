//
//  Product.swift
//  MVVM_Demo
//
//  Created by Rahul Ajmera on 13/09/23.
//

import Foundation
struct Product:Decodable{
    let id: Int
    let title:String
    let price:Double
    let description:String
    let category:String
    let image:String
    let rating:Rate
}
struct Rate:Decodable {
    let rate:Double
    let count:Int
}
