//
//  Extensions.swift
//  TrendingMovies
//
//  Created by Nabil Kazi on 27/02/19.
//

import UIKit

extension UITableView {
    
    func setEmptyMessage(_ message: String) {
        let messageLabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.bounds.size.width, height: self.bounds.size.height))
        messageLabel.text = message
        messageLabel.textColor = Color.darkText
        messageLabel.numberOfLines = 0
        messageLabel.textAlignment = .center
        messageLabel.font = Font.bold.withSize(15.0)
        messageLabel.sizeToFit()
        
        self.backgroundView = messageLabel
    }
    
    func removeEmptyMessage() {
        self.backgroundView = nil
    }
}
