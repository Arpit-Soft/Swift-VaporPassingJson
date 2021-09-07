//
//  File.swift
//  
//
//  Created by Arpit Dixit on 07/09/21.
//

import Foundation
import Vapor

struct ApiController: RouteCollection {
    
    func boot(routes: RoutesBuilder) throws {
        let api = routes.grouped("api")
        api.get("users", use: getUsers)
    }
    
    func getUsers(req: Request) throws -> Response {
        let users = [["name": "Arpit", "age": 27], ["name": "Pranav", "age": 56]]
        let data = try JSONSerialization.data(withJSONObject: users, options: .prettyPrinted)
        return Response(status: .ok, body: Response.Body(data: data))
    }
}
