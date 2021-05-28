//
//  MovieDetailViewController.swift
//  carbonMovie
//
//  Created by Tolu Alawusa on 5/27/21.
//

import UIKit

class MovieDetailViewController: UIViewController {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    var MovieDetailView: movieDetailView!
    var favVC =  FavouritesViewController()

    let preferences1 = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        setupView()
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

    }
    
    func fetch(title: String, year: String, image: String){
        let newFavMovie = FavMovies(context: context)
        newFavMovie.title = preferences1.string(forKey: "movieTitle")
        newFavMovie.year = preferences1.string(forKey: "movieYear")
        newFavMovie.image = preferences1.string(forKey: "movieImage")!
        
        do {
            try context.save()
            favVC.getSavedMovies()
        } catch {
            
        }
    }
    
    func setupView(){
        let movieView = movieDetailView(frame: self.view.frame)
        self.MovieDetailView = movieView
        
        self.MovieDetailView.favAction = favIconPressed
        
        self.MovieDetailView.TitleLabel.text = preferences1.string(forKey: "movieTitle")
        self.MovieDetailView.YearLabel.text = preferences1.string(forKey: "movieYear")
//        self.MovieDetailView.DirectorLabel.text = preferences1.string(forKey: "movieID")
        
        let url = preferences1.string(forKey: "movieImage")!
        if let data = try? Data(contentsOf: URL(string: url)!) {
            self.MovieDetailView.transImage1.image = UIImage(data: data)
        }
        
        self.view.addSubview(MovieDetailView)
        
        MovieDetailView.setAnchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingRight: 0, paddingBottom: 0)
        
    }
    
    func favIconPressed(){
        print("awa de")
        fetch(title: preferences1.string(forKey: "movieTitle")!, year: preferences1.string(forKey: "movieYear")!, image: preferences1.string(forKey: "movieImage")!)
        
        let alertController = UIAlertController(title: "", message:
            "Saved to Favourites", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: .default))
        self.present(alertController, animated: true, completion: nil)
     
    }

}
