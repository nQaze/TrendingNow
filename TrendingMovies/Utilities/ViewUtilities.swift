//
//  ViewUtilities.swift
//  TrendingMovies
//
//  Created by Nabil Kazi on 27/02/19.
//

import UIKit

extension UIView{
    
    func roundWithRadius(_ radius: Double){
        layer.cornerRadius = CGFloat(radius)
        clipsToBounds = true
    }
    
    func dropShadow(color: UIColor, radius: CGFloat) {
        layer.masksToBounds = false
        layer.shadowOffset = CGSize(width: 0, height: 3)
        layer.shadowColor = color.cgColor
        layer.shadowRadius = radius
        layer.shadowOpacity = 0.5
    }
}
