//
//  StoryboardInstantiable.swift
//  Weather
//
//  Created by Anand, Chetan [GCB-OT NE] on 19/8/19.
//  Copyright © 2019 World. All rights reserved.
//

import Foundation
import UIKit

protocol StoryboardInstantiable {
    static var storyboardName: String { get }
    static var storyboardBundle: Bundle? { get }
    static var storyboardIdentifier: String? { get }
}

extension StoryboardInstantiable {
    static var storyboardIdentifier: String? { return String(describing: Self.self) }
    static var storyboardBundle: Bundle? {
        if let bundleClass  = Self.self as? AnyClass {
            return Bundle(for: bundleClass)
        }
        else {
            return nil
        }
    }
    
    static func instantiate() -> Self? {
        let storyboard = UIStoryboard(name: storyboardName, bundle: storyboardBundle)
        
        if let storyboardIdentifier = storyboardIdentifier {
            return storyboard.instantiateViewController(withIdentifier: storyboardIdentifier) as? Self
        } else {
            return storyboard.instantiateInitialViewController() as? Self
        }
    }
}
