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
    @IBOutlet weak var taglineLabel: UILabel!
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var homepageLabel: UILabel!
    
    var movie: JTGMovie? {
        didSet {
            loadViewIfNeeded()
              updateView()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateView()
    }

    func updateView() {
        guard let movie = movie else { return }
        DispatchQueue.main.async {
            self.titleLabel.text = movie.title
            self.overviewLabel.text = movie.overview
            self.ratingLabel.text = "Rating: \(movie.rating)"
            self.taglineLabel.text = movie.tagline
            self.homepageLabel.text = movie.homepage
        }
    }

}

// MARK: - Actions
extension JTGMovieDetailViewController {
    
    @IBAction func youtubeTrailerButtonTapped(_ sender: UIButton) {
        guard let movie = movie else { return }
        self.playTrailer(forId: movie.movieTrailer.youtubeTrailerVideoId)
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
