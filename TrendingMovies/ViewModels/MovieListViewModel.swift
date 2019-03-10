//
//  MovieListViewModel.swift
//  TrendingMovies
//
//  Created by Nabil Kazi on 04/03/19.
//

import Foundation

class MovieListViewModel : NSObject {
    
    @objc dynamic private(set) var movieViewModels :[MovieViewModel] = [MovieViewModel]()
    private var token :NSKeyValueObservation?
    private var apiController : MoviesAPIController
    private var movieDataManager : MovieDataManager
    
    var bindToSourceViewModels: (() -> ()) = {  }
    var showMessageClosure: (() -> ()) = {}
    var updateLoadingStatus: (() -> ()) = {}
    
    init(apiController: MoviesAPIController, movieDataManager : MovieDataManager) {
        self.apiController = apiController
        self.movieDataManager = movieDataManager
        super.init()
        
        token = self.observe(\.movieViewModels) { _,_ in
            self.bindToSourceViewModels()
        }
        populateMovies()
    }
    
    var displayMessage: String? {
        didSet {
            self.showMessageClosure()
        }
    }
    
    var isLoading: Bool = false {
        didSet {
            self.updateLoadingStatus()
        }
    }
    
    func invalidateObservers() {
        self.token?.invalidate()
    }
    
    func populateMovies() {
        fetchStoredMovieFromDatabase()
        fetchMoviesFromAPI()
    }
    
    func fetchStoredMovieFromDatabase(){
        let dbMovies = movieDataManager.fetchAllMovies()
        self.movieViewModels = dbMovies.compactMap(MovieViewModel.init)
    }
    
    func fetchMoviesFromAPI(){
        isLoading = true
        self.apiController.getTrending(media: MediaType.movie, forDuration: TimeWindow.day) { [unowned self] (movies, error) in
            self.isLoading = false
            if let movies = movies{
                let insertedMovies = self.movieDataManager.getMoviesFromResult(movies)
                if insertedMovies.count > 0{
                    self.movieViewModels = insertedMovies.compactMap(MovieViewModel.init)
                }else{
                    self.displayMessage = Constants.noMoviesMessage
                }
            }else{
                self.displayMessage = error?.errorDescription
            }
        }
    }
    
    func movie(at index:Int) -> MovieViewModel {
        return self.movieViewModels[index]
    }
}
