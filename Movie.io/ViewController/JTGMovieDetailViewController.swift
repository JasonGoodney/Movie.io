//
//  JTGMovieDetailViewController.swift
//  Movie.io
//
//  Created by Jason Goodney on 9/14/18.
//  Copyright © 2018 Jason Goodney. All rights reserved.
//

import UIKit
import SafariServices

class JTGMovieDetailViewController: UIViewController, SFSafariViewControllerDelegate {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!    
    @IBOutlet weak var ratingLabel: UILabel!
    
    var movie: JTGMovie? {
        didSet {
            loadViewIfNeeded()
            updateView()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()


    }

    func updateView() {
        guard let movie = movie else { return }
        titleLabel.text = movie.title
        overviewLabel.text = movie.overview
        ratingLabel.text = "Rating: \(movie.rating!)"
    }
   
}

// MARK: - Actions
extension JTGMovieDetailViewController {
    
    @IBAction func youtubeTrailerButtonTapped(_ sender: UIButton) {
        guard let movie = movie else { return }
        JTGMovieSearchClient.fetchYoutubeTrailer(forMovieId: movie.identifier) { (movieTrailer) in
            guard let movieTrailer = movieTrailer else { return }
            movie.movieTrailer = movieTrailer
            
            self.playTrailer(forId: movie.movieTrailer.youtubeTrailerVideoId)
        }
        
    }
    
    func playTrailer(forId videoId: String) {
        
        let youtubeHook = "youtube://watch?v=\(videoId)"
        guard let youtubeAppURL = URL(string: youtubeHook) else { return }
        
        DispatchQueue.main.async {
            if UIApplication.shared.canOpenURL(youtubeAppURL)
            {
                UIApplication.shared.open(youtubeAppURL, options: [:], completionHandler: nil)
                
            } else {
                guard let youtubeURL = URL(string: "https://youtube.com/watch?v=\(videoId)") else { return }
                print("Youtube not on device opening Safari")
                let sfv = SFSafariViewController(url: youtubeURL)
                sfv.delegate = self
                self.present(sfv, animated: true, completion: nil)
            }
        }
    }
}
