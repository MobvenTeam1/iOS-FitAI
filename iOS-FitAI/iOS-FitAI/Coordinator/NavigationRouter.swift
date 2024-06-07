//
//  NavigationRouter.swift
//  iOS-FitAI
//
//  Created by Elif Tum on 23.05.2024.
//

import UIKit
import SwiftUI

public protocol NavigationRouter {
    
    associatedtype V: View

    var transition: NavigationTransitionStyle { get }
    @ViewBuilder
    func view() -> V
}
