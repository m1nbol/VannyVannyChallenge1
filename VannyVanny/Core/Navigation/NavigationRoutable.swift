//
//  NavigationRoutable.swift
//  VannyVanny
//
//  Created by Apple Coding machine on 3/25/25.
//

import Foundation
import Combine

protocol NavigationRoutable {
    var destination: [NavigationDestination] { get set }
    
    func push(to view: NavigationDestination)
    func pop()
    func popToRootView()
}

class NavigationRouter: NavigationRoutable, ObservableObjectSettable {
    var destination: [NavigationDestination] = [] {
        didSet {
            objectWillChange?.send()
        }
    }
    
    func push(to view: NavigationDestination) {
        destination.append(view)
    }
    
    func pop() {
        _ = destination.popLast()
    }
    
    func popToRootView() {
        destination = []
    }
    
    var objectWillChange: ObservableObjectPublisher?
}

