//
//  JTGSearchTableViewController.swift
//  Movie.io
//
//  Created by Jason Goodney on 9/14/18.
//  Copyright © 2018 Jason Goodney. All rights reserved.
//

import UIKit

class JTGSearchTableViewController: UITableViewController {
    
    @IBOutlet weak var movieSearchBar: UISearchBar!
    
    var movies: [JTGMovie]? {
        didSet {
            loadViewIfNeeded()
            reloadTableView()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        movieSearchBar.delegate = self
    }

}

// MARK: - Update View
extension JTGSearchTableViewController {
    
    func reloadTableView() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

// MARK: - UITableViewDataSource
extension JTGSearchTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return movies?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: JTGSearchTableViewCell.cellId(), for: indexPath) as? JTGSearchTableViewCell,
        let movies = movies else { return UITableViewCell() }
        
        let movie = movies[indexPath.row]
        
        cell.movie = movie
        
        return cell
    }
}

// MARK: - UITableViewDelegate
extension JTGSearchTableViewController {
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 192
    }
}

// MARK: - UISearchBarDelegate
extension JTGSearchTableViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        JTGMovieSearchClient.searchForMovies(withSearchTerm: searchText) { (movies) in
            self.movies = movies
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        searchBar.resignFirstResponder()
    }
}

// MARK: - UIScrollViewDelegate
extension JTGSearchTableViewController {
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        movieSearchBar.resignFirstResponder()
    }
}










