//
//  DIContainer.swift
//  VannyVanny
//
//  Created by Apple Coding machine on 3/25/25.
//

import Foundation

class DIContainer: ObservableObject {
    var navigationRouter: NavigationRoutable & ObservableObjectSettable
    
    init(
        navigationRouter: NavigationRoutable & ObservableObjectSettable = NavigationRouter()
    ) {
        self.navigationRouter = navigationRouter
        self.navigationRouter.setObjectWillChange(objectWillChange)
    }
}
