//
//  ViewController.swift
//  TrendingMovies
//
//  Created by Nabil Kazi on 27/02/19.
//

import UIKit
import CoreData

class MovieListVC : UITableViewController {
    
    private var movieDataManager: MovieDataManager!
    private var moviesApiController: MoviesAPIController!
    private var movieListViewModel: MovieListViewModel!
    private var dataSource: TableViewDataSource<MovieTableViewCell,MovieViewModel>!
    private var displayMessage = Constants.noMoviesMessage
    
    lazy var refresh: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(self.handleRefresh(_:)), for: .valueChanged)
        refreshControl.tintColor = Color.lightText
        return refreshControl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.movieDataManager = MovieDataManager()
        self.moviesApiController = MoviesAPIController()
        setupUI()
        setupVM()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if #available(iOS 11.0, *) {
            self.navigationController?.navigationBar.prefersLargeTitles = true
        }
    }
    
    private func setupUI(){
        self.tableView.register(UINib(nibName: Views.movieTableViewCell, bundle: nil), forCellReuseIdentifier: Cells.movie)
        self.tableView.refreshControl = refresh
    }
    
    private func setupVM() {
        self.movieListViewModel = MovieListViewModel(apiController: moviesApiController, movieDataManager: movieDataManager)
        
        self.movieListViewModel.bindToSourceViewModels = {
            self.updateDataSource()
        }
        
        self.movieListViewModel.showMessageClosure = {
            if let message = self.movieListViewModel.displayMessage {
                self.displayMessage = message
                self.updateDataSource()
            }
        }
        
        movieListViewModel.updateLoadingStatus = {
            let isLoading = self.movieListViewModel.isLoading
            if isLoading {
                self.refresh.beginRefreshing()
            }else {
                self.refresh.endRefreshing()
            }
        }
    }
    
    private func updateDataSource() {
        self.dataSource = TableViewDataSource(cellIdentifier: Cells.movie, items: self.movieListViewModel.movieViewModels, displayMessage: displayMessage) { cell, vm in
            cell.movieViewModel = vm
        }
        
        self.tableView.dataSource = self.dataSource
        self.tableView.reloadData()
    }
    
    @objc func handleRefresh(_ refreshControl: UIRefreshControl) {
        movieListViewModel.fetchMoviesFromAPI()
    }
}

extension MovieListVC {
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let height = UIScreen.main.bounds.height * 0.25
        return height
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let indexPath = self.tableView.indexPathForSelectedRow else {
            fatalError("indexPath not found")
        }
        let movie = self.movieListViewModel.movie(at: indexPath.row)
        let movieDetailsVC = MovieDetailsVC.storyboardInstance()!
        movieDetailsVC.movieViewModel = movie
        self.navigationController?.pushViewController(movieDetailsVC, animated: true)
    }
}

