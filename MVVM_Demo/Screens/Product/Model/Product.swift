//
//  Product.swift
//  MVVM_Demo
//
//  Created by Rahul Ajmera on 13/09/23.
//

import Foundation
struct Product:Codable{
    let id: Int
    let title:String
    let price:Double
    let description:String
    let category:String
    let image:String
    let rating:Rate
}
struct Rate:Codable {
    let rate:Double
    let count:Int
}
