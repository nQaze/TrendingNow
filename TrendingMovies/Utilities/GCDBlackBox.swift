//
//  GCDBlackBox.swift
//  TrendingMovies
//
//  Created by Nabil Kazi on 27/02/19.
//

import Foundation

func performUIUpdatesOnMain(_ updates: @escaping () -> Void) {
    DispatchQueue.main.async {
        updates()
    }
}
