//
//  V1Collection.swift
//  App
//
//  Created by Johnny Nguyen on 2017-11-30.
//

import Vapor
import HTTP

public final class V1Collection: RouteCollection {
  private let view: ViewRenderer
  
  public init(_ view: ViewRenderer) {
    self.view = view
  }
  
  public func build(_ builder: RouteBuilder) throws {
    // this sets us up for our collection of routes to start building
    let api = builder.grouped("api", "v1")
    
    // MARK: - UserController
    let userController = UserController()
    api.resource("users", userController)
  
    // MARK: - HomeController
    let homeController = HomeController(view)
    builder.get("/", handler: homeController.index)
  }
}
