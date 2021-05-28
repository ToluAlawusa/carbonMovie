//
//  movieDetailView.swift
//  carbonMovie
//
//  Created by Tolu Alawusa on 5/27/21.
//

import UIKit

class movieDetailView: UIView {

    var favAction: (() -> Void)?
   
   override init(frame: CGRect) {
       super.init(frame: frame)
       setup()
   }
    
   func setup() {
       
       let stackV = pageTwoStackView()
       
       addSubview(stackV)
   
       backgroundColor = UIColor(red:249.0/255.0, green:249.0/255.0, blue:249.0/255.0, alpha:1.0)
       stackV.setAnchor(width: self.frame.width - 40, height: 400)
       stackV.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
       stackV.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    
        let tapp = UITapGestureRecognizer(target: self, action: #selector(goToFav(_:)))
        favImage.isUserInteractionEnabled = true
        favImage.addGestureRecognizer(tapp)
      
   }
   
  
    let transImage1: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleToFill
        img.clipsToBounds = true
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
//        bilb.backgroundColor = .yellow
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

    
    lazy var favImage: UIImageView = {
     let imageName = UIImage(systemName: "heart")!
        let img = UIImageView(image: imageName)
        img.contentMode = .center
        img.clipsToBounds = true
        img.setAnchor(width: 29, height: 60)
     
        return img
    }()
    
    @objc func goToFav(_ sender:UITapGestureRecognizer){
        favAction?()
    }
    

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   
   
   func pageTwoStackView() -> UIStackView {
    let stackV = UIStackView(arrangedSubviews: [transImage1, TitleLabel, YearLabel, favImage])
       
    stackV.axis = .vertical
    stackV.distribution = .fillProportionally
    stackV.spacing = 10
    
    stackV.layoutMargins = UIEdgeInsets(top: 30, left: 0, bottom: 0, right: 0)
    stackV.isLayoutMarginsRelativeArrangement = true
    
    stackV.setCustomSpacing(0.0, after: YearLabel)
 
    return stackV
   }
    
}
