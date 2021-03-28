//
//  HTTPURLResponse+StatusCode.swift
//  EssentialFeed2Tests
//
//  Created by Ricardo Herrera Petit on 1/31/21.
//

import Foundation

extension HTTPURLResponse {
    private static var OK_200: Int { return 200 }
    
    var isOK: Bool {
        return statusCode == HTTPURLResponse.OK_200
    }
}
