//
//  Labels.swift
//  TrendingMovies
//
//  Created by Nabil Kazi on 27/02/19.
//

import UIKit

class PageTitleLabel: UILabel {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        textColor = Color.blackText
        font = Font.heavy.withSize(font.pointSize)
    }
}

class DefaultLabel: UILabel {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        textColor = Color.darkText
        font = Font.regular.withSize(font.pointSize)
    }
}

class SemiBoldLabel: UILabel {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        textColor = Color.darkText
        font = Font.bold.withSize(font.pointSize)
    }
}

class CardTitleLabel: UILabel {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        textColor = Color.veryLightText
        font = Font.bold.withSize(font.pointSize)
    }
}

class CardSubtitleLabel: UILabel {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        textColor = Color.veryLightText
        font = Font.semiBold.withSize(font.pointSize)
    }
}
