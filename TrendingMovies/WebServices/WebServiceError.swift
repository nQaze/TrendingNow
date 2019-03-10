//
//  WebServiceError.swift
//  TrendingMovies
//
//  Created by Nabil Kazi on 27/02/19.
//

import Foundation

import Foundation

public enum WebServiceError: Error {
    
    /// There was no network connection
    case noInternetError
    
    /// There was an NSURLError
    case networkingError(Error)
    
    /// The response returned a non-2xx status code
    case badResponse(statusCode: Int)
    
    /// The response returned a non-2xx status code, with display message from server
    case serverError(displayMessage: String)
    
    /// The response returned a 400 error
    case badRequest
    
    /// The response returned a 401 error
    case unauthorisedError
    
    /// The response returned a 403 error
    case forbidden
    
    /// The response returned a 404 error
    case notFound
    
    /// The response returned a 405 error
    case methodNotAllowed
    
    /// The response returned a 409 error
    case conflict
    
    /// There was an invalid response from the server
    case invalidResponse
    
    /// The web service request was cancelled - Normally when another request of the same type is made
    case cancelled
    
    case noData
    
    case validationError
    
    /// The response returned a 2XX status code but API error, with display message from server
    case customError(_ displayMessage: String)
    
}

extension Error {
    
    var errorDescription: String {
        if self is WebServiceError {
            switch self as! WebServiceError {
            case .noInternetError:
                return "error.webservice.no-connection".localized()
            case .networkingError:
                return "error.webservice.no-connection".localized()
            case .badResponse:
                return "error.webservice.not-found".localized()
            case .serverError:
                return "error.webservice.not-found".localized()
            case .badRequest:
                return "error.webservice.bad-request".localized()
            case .unauthorisedError:
                return "error.webservice.unauthorized".localized()
            case .forbidden:
                return "error.webservice.not-found".localized()
            case .notFound:
                return "error.webservice.not-found".localized()
            case .conflict:
                return "error.webservice.not-found".localized()
            case .invalidResponse:
                return "error.webservice.not-found".localized()
            case .cancelled:
                return "error.webservice.not-found".localized()
            case .noData:
                return "error.webservice.no-data".localized()
            case .validationError:
                return "error.webservice.validation-error".localized()
            case .methodNotAllowed:
                return "error.webservice.method-not-allowed".localized()
            case .customError(let displayMessage):
                return displayMessage.localized()
            }
        }
        
        return (self as NSError).localizedDescription
    }
}
