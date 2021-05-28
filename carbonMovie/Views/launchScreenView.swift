//
//  launchScreenView.swift
//  carbonMovie
//
//  Created by Tolu Alawusa on 5/26/21.
//

import UIKit

class launchScreenView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)

        setup()
     
    }
    
    func setup() {
        
        let stackV = pageTwoStackView()
        addSubview(stackV)
        backgroundColor = UIColor.white
        stackV.setAnchor(width: self.frame.width - 150, height: 200)
        stackV.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        stackV.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
       
    }
    
    let logoImage: UIImageView = {
        let imageName = UIImage(named: "logo_carbon.png")!
        let img = UIImageView(image: imageName)
        img.contentMode = .center
        img.clipsToBounds = true
     
        return img
    }()
    
    func pageTwoStackView() -> UIStackView {
        let stackV = UIStackView(arrangedSubviews: [logoImage])
        stackV.axis = .vertical
        stackV.distribution = .fillProportionally
        stackV.spacing = 20
        
        return stackV
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


}
