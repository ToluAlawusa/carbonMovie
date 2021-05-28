//
//  FavouritesViewController.swift
//  carbonMovie
//
//  Created by Tolu Alawusa on 5/26/21.
//

import UIKit

class FavouritesViewController: UIViewController, UICollectionViewDataSource {
    
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    let preferences1 = UserDefaults.standard
    private var collectionView: UICollectionView?
    
    private var models = [FavMovies]()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        title = "Favourite Movies"
       
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        layout.itemSize = CGSize(width: (view.frame.width / 1) - 20, height: 300)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionView.register(FavCollectionViewCell.self, forCellWithReuseIdentifier: FavCollectionViewCell.identifier)
        collectionView.dataSource = self
        
        view.addSubview(collectionView)
        collectionView.backgroundColor = .systemBackground
        self.collectionView = collectionView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        getSavedMovies()
    }
    
    func getSavedMovies(){
        
        do {
            models = try context.fetch(FavMovies.fetchRequest())
            
            DispatchQueue.main.async {
                self.collectionView?.reloadData()
            }
            
        }
        catch {
            // error
        }
        
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView?.frame = CGRect(x: 0, y: view.safeAreaInsets.top+45, width: view.frame.size.width, height: view.frame.size.height-55)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return models.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let movieModel = models[indexPath.row]
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FavCollectionViewCell.identifier, for: indexPath) as? FavCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.TitleLabel.text = movieModel.title
        cell.YearLabel.text = movieModel.title
        
        let url = movieModel.image
        
        if let data = try? Data(contentsOf: URL(string: url!)!) {
                cell.transImage1.image = UIImage(data: data)
        }
        
        return cell
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.navigationController?.setStatusBar(backgroundColor: UIColor(red:93.0/255.0, green:46.0/255.0, blue:206.0/255.0, alpha:1.0))
        self.navigationController?.navigationBar.setNeedsLayout()
    }

}


