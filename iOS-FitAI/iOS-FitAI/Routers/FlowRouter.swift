//
//  FlowRouter.swift
//  iOS-FitAI
//
//  Created by Elif Tum on 23.05.2024.
//

import Foundation
import SwiftUI
import UIKit

public enum FlowRouter: NavigationRouter {

    case splash
    case personalInfos
    
    public var transition: NavigationTransitionStyle {
        switch self {
        default:
            return .push
        }
    }
    
    @ViewBuilder
    public func view() -> some View {
        switch self {
        case .splash:
            SplashView()
        case .personalInfos:
            PersonalInfos()
        default:
            Text(verbatim: "There is nothing")
                .foregroundStyle(.blue)
        }
    }
}
