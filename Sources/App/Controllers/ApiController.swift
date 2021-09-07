//
//  File.swift
//  
//
//  Created by Arpit Dixit on 07/09/21.
//

import Foundation
import Vapor

struct User: Content {
    let name: String
    let age: Int
    let address: Address? //Optional if not required
}

struct Address: Content {
    let houseno: String
    let street: String
    let city: String
    let state: String
    let zipcode: String
}

struct ApiController: RouteCollection {
    
    func boot(routes: RoutesBuilder) throws {
        let api = routes.grouped("api")
        api.get("users", use: getUsers)
        api.post("users", use: createUser)
    }
    
    func getUsers(req: Request) throws -> [User] {
        
        let address = Address(houseno: "H-40", street: "Bhavani Vihar", city: "Lucknow", state: "Uttar Pradesh", zipcode: "302030")
        let user = User(name: "Arpit Dixit", age: 27, address: address)
        return [user]
//        let users = [["name": "Arpit", "age": 27], ["name": "Pranav", "age": 56]]
//        let data = try JSONSerialization.data(withJSONObject: users, options: .prettyPrinted)
//        return Response(status: .ok, body: Response.Body(data: data))
    }
    
    func createUser(req: Request) throws -> User {
        let user = try req.content.decode(User.self)
        print(user)
        return user
    }
}
