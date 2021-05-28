//
//  MovieListViewController.swift
//  carbonMovie
//
//  Created by Tolu Alawusa on 5/27/21.
//

import UIKit

class MovieListViewController: UIViewController, UICollectionViewDataSource, UISearchBarDelegate, UICollectionViewDelegate {
   
    
    let preferences1 = UserDefaults.standard
    private var collectionView: UICollectionView?
    
    var Search: [Movies] = []
    
    let searchField = UISearchBar()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(searchField)
        searchField.delegate = self
        searchField.tintColor = UIColor(red:93.0/255.0, green:46.0/255.0, blue:206.0/255.0, alpha:1.0)
        searchField.placeholder = "search movie here"
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        layout.itemSize = CGSize(width: (view.frame.width / 1) - 20, height: 300)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionView.register(MovieListCollectionViewCell.self, forCellWithReuseIdentifier: MovieListCollectionViewCell.identifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        
        view.addSubview(collectionView)
        collectionView.backgroundColor = .systemBackground
        self.collectionView = collectionView
        
        //view.backgroundColor = .red
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        searchField.frame = CGRect(x: 0, y: view.safeAreaInsets.top, width: view.frame.size.width, height: 50)
        collectionView?.frame = CGRect(x: 0, y: view.safeAreaInsets.top+45, width: view.frame.size.width, height: view.frame.size.height-55)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchField.resignFirstResponder()
        if let searchText = searchField.text {
            Search = []
            collectionView?.reloadData()
            fetchMovies(query: searchText)
        }
    }
    
    
    func fetchMovies(query: String) {
        
        let urlString = "https://www.omdbapi.com/?apikey=3aea79ac&s=\(query)&type=movie"
        
        guard let url = URL(string: urlString) else {
            return
        }
        
        // weak self was used here to prevent memory leak
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            
            guard let data = data, error == nil else{
                return
            }
            
            do{
                let jsonResult = try JSONDecoder().decode(MovieResults.self, from: data)
                
                DispatchQueue.main.async {
                    self?.Search = jsonResult.Search
                    self?.collectionView?.reloadData()
                }
                
                print(jsonResult.Search.count)
            }
            catch {
                print(error)
            }
        }
        
        task.resume()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Search.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //let imageString = Search[indexPath.row]
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieListCollectionViewCell.identifier, for: indexPath) as? MovieListCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.configure(with: Search[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        
        preferences1.set(Search[indexPath.item].imdbID, forKey: "movieID")
        preferences1.set(Search[indexPath.item].Title, forKey: "movieTitle")
        preferences1.set(Search[indexPath.item].Year, forKey: "movieYear")
        preferences1.set(Search[indexPath.item].Poster, forKey: "movieImage")
        
        let cfController = MovieDetailViewController()
        self.navigationController?.pushViewController(cfController, animated: true)
    }
    
    @objc func tap(_ sender: UITapGestureRecognizer) {

       let location = sender.location(in: self.collectionView)
        let indexPath = self.collectionView!.indexPathForItem(at: location)
        
    
        //let tt = sender.accessibilityIdentifier ?? "kk"
        if let index = indexPath {
            print("Got clicked on index: \(index)!")
            
       }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.navigationController?.setStatusBar(backgroundColor: UIColor(red:93.0/255.0, green:46.0/255.0, blue:206.0/255.0, alpha:1.0))
        self.navigationController?.navigationBar.setNeedsLayout()
    }
    

}



