# TrendingNow

TrendingNow is a sample iOS app  depicting the use of MVVM, UI Testing, Unit Testing and Mocking Database & API Controller. The app uses TMDB APIs to fetch the list of trending movies & saves them in local database using CoreData.

### MVVM 
The project uses **MVVM** to avoid the problem of Massive View Controller and also facilitate Unit Testing via dependency injection.

### Unit Tests 
The project uses **XCTest** framework to implement unit testing & ensure the features of app are always working and avoid bugs and errors introduced at later stages of development. **Mock Database** and **Mock API Controllers** are being used to test the Models and functionalities.

### UI Tests 
The project uses **XCUITest** framework to implement UI testing & ensure the flow of apps UI works as intended.

## Project directory structure 

```
├── AppDelegate.swift
├── Constants.swift
├── Database
    ├── MovieDataManager.swift
    └── TrendingMovies.xcdatamodel
├── WebServices
    ├── WebServiceConfiguration.swift
    └── WebServiceError.swift
    └── APIConfigurations
	    └── GetTrendingMoviesConfiguration.swift
    └── APIController
	    └── MoviesAPIController.swift
├── ViewControllers
    ├── MovieListVC.swift
    └── MovieDetailsVC.swift
├── ViewModels
    ├── MovieListViewModel.swift
    └── MovieViewModel.swift
├── ViewCells
    ├── MovieTableViewCell.swift
    └── MovieTableViewCell.xib
├── Utilities
    ├── Color.swift
    ├── Labels.swift
    ├── Configuration.swift
    ├── Alerts.swift
    ├── Font.swift
    ├── Dates.swift
    ├── TableViewDataSource.swift
    ├── TableViewUtilities.swift
    ├── ImageViewUtilities.swift
    ├── StringUtilities.swift
    └── ViewUtilities.swift
├── Storyboards
	├── Main.storyboard
    └── LaunchScreen.storyboard
├── Resources
	├── Fonts
    ├── Assets.xcassets
    └── Localizable.strings
└── SupportingFiles
	└── Info.plist
```

