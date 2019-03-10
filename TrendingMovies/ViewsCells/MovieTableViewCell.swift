//
//  MovieTableViewCell.swift
//  TrendingMovies
//
//  Created by Nabil Kazi on 27/02/19.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var shadowView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var moviePosterIV: UIImageView!

    var movieViewModel: MovieViewModel! {
        didSet {
            nameLabel.text = movieViewModel.title
            ratingLabel.text = movieViewModel.rating
             moviePosterIV.loadImageUsingCache(withUrl: "\(Constants.apiImageUrl)\(movieViewModel.posterPath)", defaultImage: nil)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    func setupView(){
        shadowView.setNeedsLayout()
        shadowView.layoutIfNeeded()
        cardView.roundWithRadius(4.0)
        shadowView.roundWithRadius(4.0)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        shadowView.layer.sublayers = nil
        moviePosterIV.image = nil
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.dropShadow(color: Color.separator, radius: 4.0)
    }
    
}
