//
//  MovieDetailsVC.swift
//  TrendingMovies
//
//  Created by Nabil Kazi on 28/02/19.
//

import UIKit

class MovieDetailsVC: UIViewController {

    static func storyboardInstance() -> MovieDetailsVC? {
        let storyboard = UIStoryboard(name: Storyboard.main ,bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: "MovieDetailsVC") as? MovieDetailsVC
    }
    
    @IBOutlet weak var moviePosterIV: UIImageView!
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var movieOverviewLabel: UILabel!
    @IBOutlet weak var movieReleaseDateLabel: UILabel!
    
    var movieViewModel : MovieViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayDataForMovie(movieViewModel)
    }
    
    func displayDataForMovie(_ movie : MovieViewModel){
        movieTitleLabel.text = movie.title
        movieOverviewLabel.text = movie.overview
        movieReleaseDateLabel.text = movie.releaseDate
        moviePosterIV.loadImageUsingCache(withUrl: "\(Constants.apiImageUrl)\(movie.posterPath)", defaultImage: nil)
    }
}
