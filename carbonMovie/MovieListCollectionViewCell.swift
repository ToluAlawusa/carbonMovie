//
//  MovieListCollectionViewCell.swift
//  carbonMovie
//
//  Created by Tolu Alawusa on 5/27/21.
//

import UIKit

class MovieListCollectionViewCell: UICollectionViewCell {
    static let identifier = "MovieListCollectionViewCell"
    
    private let imageView: UIImageView = {
       let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let transImage1: UIImageView = {
        let img = UIImageView()
        img.contentMode = .center
        img.clipsToBounds = true
        img.setAnchor(width: 40, height: 100)
        return img
    }()

    private let TitleLabel: UILabel = {
        let bilb = UILabel()
        bilb.text = ""
        bilb.numberOfLines = 0
        bilb.textAlignment = .center
        bilb.textColor =  UIColor(red:9.0/255.0, green:32.0/255.0, blue:88.0/255.0, alpha:1.0)

        bilb.font = UIFont(name: "Helvetica-Bold", size: 14.0)!
        bilb.setAnchor(width: 66, height: 14)
        return bilb
    }()

    private let YearLabel: UILabel = {
        let bilb = UILabel()
        bilb.text = ""
        bilb.numberOfLines = 0
        bilb.textAlignment = .center
        bilb.textColor =  UIColor(red:9.0/255.0, green:32.0/255.0, blue:88.0/255.0, alpha:1.0)

        bilb.font = UIFont(name: "Helvetica-Bold", size: 12.0)!
        bilb.setAnchor(width: 66, height: 14)
        return bilb
    }()

    private let DirectorLabel: UILabel = {
        let bilb = UILabel()
        bilb.text = ""
        bilb.numberOfLines = 0
        bilb.textAlignment = .center
        bilb.textColor =  UIColor(red:9.0/255.0, green:32.0/255.0, blue:88.0/255.0, alpha:1.0)

        bilb.font = UIFont(name: "Helvetica-Bold", size: 12.0)!
        return bilb
    }()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        layer.masksToBounds = true
        layer.borderColor = UIColor(red:93.0/255.0, green:46.0/255.0, blue:206.0/255.0, alpha:1.0).cgColor
        layer.borderWidth = 3.0
        
        contentView.addSubview(transImage1)
        contentView.addSubview(TitleLabel)
        contentView.addSubview(YearLabel)
        contentView.addSubview(DirectorLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        transImage1.setAnchor(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 20, paddingLeft: 10, paddingRight: -5, paddingBottom: 0)

        TitleLabel.setAnchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 40, paddingLeft: 0, paddingRight: 0, paddingBottom: 20)

        YearLabel.setAnchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 70, paddingLeft: 0, paddingRight: 0, paddingBottom: 30)

        DirectorLabel.setAnchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 110, paddingLeft: 0, paddingRight: 0, paddingBottom: 30)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()

        transImage1.image = nil
        TitleLabel.text = nil
        YearLabel.text = nil
        DirectorLabel.text = nil
    }
    
    func configure(with model: Movies) {
        self.TitleLabel.text = model.Title
        self.YearLabel.text = model.Year
        self.DirectorLabel.text = model.imdbID
            let url = model.Poster
        if let data = try? Data(contentsOf: URL(string: url)!) {
            self.transImage1.image = UIImage(data: data)
        }
    }
    
}
