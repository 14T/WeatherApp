//
//  Loader.swift
//  Weather
//
//  Created by Anand, Chetan [GCB-OT NE] on 21/8/19.
//  Copyright © 2019 World. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    var isShowingLoader : Bool {
        guard let window = UIApplication.shared.keyWindow else {
            return false
        }
        if let loaderView = window.subviews.first(where: { $0 is LoaderView })  as? LoaderView {
            return true
        }
        return false
    }
    
    func showLoader() {
        DispatchQueue.main.async {
            
            guard let window = UIApplication.shared.keyWindow else {
                return
            }
            let loaderView = LoaderView(frame: window.frame)
            window.addSubview(loaderView)
        }
    }
    
    func hideLoader() {
        DispatchQueue.main.async {
            guard let window = UIApplication.shared.keyWindow else {
                return
            }
            if let loaderView = window.subviews.first(where: { $0 is LoaderView })  as? LoaderView {
//                loaderView.removeFromSuperview()
                loaderView.removeLoaderView()
            }
        }
    }
    
}

class LoaderView: UIView {
    
    var blurEffectView: UIVisualEffectView?
    var width : CGFloat = 80
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        self.backgroundColor = .clear
        let blurEffect = UIBlurEffect(style: .dark)
        
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.layer.cornerRadius = 10
        blurEffectView.clipsToBounds = true
        blurEffectView.backgroundColor = .clear
        blurEffectView.frame = CGRect(x: 0, y: 0 , width: width, height: width)
        blurEffectView.center = self.center
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.blurEffectView = blurEffectView
        self.alpha = 0.0
        addSubview(blurEffectView)
        
        UIViewPropertyAnimator(duration: 0.2, curve: .easeInOut, animations: {
            self.alpha = 1.0
        }).startAnimation()
        
        
        addLoader()
    }
    
    func removeLoaderView(){
        let fadeinAnimation =   UIViewPropertyAnimator.init(duration: 0.2, curve: UIView.AnimationCurve.easeInOut) {
            self.alpha = 0.0
        }
        fadeinAnimation.startAnimation()
        
        fadeinAnimation.addCompletion { [unowned self] _ in
            self.removeFromSuperview()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addLoader() {
        guard let blurEffectView = blurEffectView else { return }
        let activityIndicator = UIActivityIndicatorView(style: .white)
        activityIndicator.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        blurEffectView.contentView.addSubview(activityIndicator)
        activityIndicator.center = blurEffectView.contentView.center
        activityIndicator.startAnimating()
    }
}
