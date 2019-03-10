//
//  TableViewDataSource.swift
//  TrendingMovies
//
//  Created by Nabil Kazi on 04/03/19.
//

import Foundation
import UIKit

class TableViewDataSource<Cell :UITableViewCell,ViewModel> : NSObject, UITableViewDataSource {
    
    private var cellIdentifier: String!
    private var items: [ViewModel]!
    var configureCell: (Cell,ViewModel) -> ()
    var displayMessage: String?
    
    init(cellIdentifier: String, items: [ViewModel], displayMessage: String, configureCell: @escaping (Cell,ViewModel) -> ()) {
        
        self.cellIdentifier = cellIdentifier
        self.items = items
        self.configureCell = configureCell
        self.displayMessage = displayMessage
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.items.count == 0{
            tableView.setEmptyMessage(displayMessage ?? "")
        } else {
            tableView.removeEmptyMessage()
        }
        return self.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath) as! Cell
        let item = self.items[indexPath.row]
        self.configureCell(cell,item)
        return cell
    }
    
}
