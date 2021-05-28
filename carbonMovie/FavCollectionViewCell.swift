//
//  FavCollectionViewCell.swift
//  carbonMovie
//
//  Created by Tolu Alawusa on 5/28/21.
//

import UIKit

class FavCollectionViewCell: UICollectionViewCell {
    static let identifier = "FavCollectionViewCell"
    
    let transImage1: UIImageView = {
        let img = UIImageView()
        img.contentMode = .center
        img.clipsToBounds = true
        img.setAnchor(width: 40, height: 100)
        return img
    }()

    let TitleLabel: UILabel = {
        let bilb = UILabel()
        bilb.text = ""
        bilb.numberOfLines = 0
        bilb.textAlignment = .center
        bilb.textColor =  UIColor(red:9.0/255.0, green:32.0/255.0, blue:88.0/255.0, alpha:1.0)

        bilb.font = UIFont(name: "Helvetica-Bold", size: 14.0)!
        bilb.setAnchor(width: 66, height: 14)
        return bilb
    }()

     let YearLabel: UILabel = {
        let bilb = UILabel()
        bilb.text = ""
        bilb.numberOfLines = 0
        bilb.textAlignment = .center
        bilb.textColor =  UIColor(red:9.0/255.0, green:32.0/255.0, blue:88.0/255.0, alpha:1.0)

        bilb.font = UIFont(name: "Helvetica-Bold", size: 12.0)!
        bilb.setAnchor(width: 66, height: 14)
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
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        transImage1.setAnchor(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 20, paddingLeft: 10, paddingRight: -5, paddingBottom: 0)

        TitleLabel.setAnchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 40, paddingLeft: 0, paddingRight: 0, paddingBottom: 20)

        YearLabel.setAnchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 70, paddingLeft: 0, paddingRight: 0, paddingBottom: 30)

    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    
        transImage1.image = nil
        TitleLabel.text = nil
        YearLabel.text = nil
    }
    
    func configure(with model: FavMovies) {
        self.TitleLabel.text = model.title
        self.YearLabel.text = model.year
        let url = model.image!
        if let data = try? Data(contentsOf: URL(string: url)!) {
            self.transImage1.image = UIImage(data: data)
        }
    }

}
