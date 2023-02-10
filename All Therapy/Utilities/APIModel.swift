//
//  DataModel.swift
//  All Therapy
//
//  Created by Muskan Jindal on 10/02/23.
//

import Foundation

struct APIModel<T: Codable>: Codable {
    let status: Int?
    let success: Bool?
    let message: String?
    let token: String?
    let data: T?
}
