//
//  NetworkService.swift
//  NetworkInterchangable
//
//  Created by yekta on 29.02.2024.
//

import Foundation


protocol NetworkService{
    func download(_ resource:String) async throws -> [User]
    
    var type:String{get}
}
