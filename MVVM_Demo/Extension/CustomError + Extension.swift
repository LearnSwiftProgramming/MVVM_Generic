//
//  CustomError + Extension.swift
//  MVVM_Demo
//
//  Created by Rahul Ajmera on 13/09/23.
//

import Foundation
enum DataError:Error{
    case invalidResponse
    case invalidURL
    case invalidData
    case message(error:Error?)
}
