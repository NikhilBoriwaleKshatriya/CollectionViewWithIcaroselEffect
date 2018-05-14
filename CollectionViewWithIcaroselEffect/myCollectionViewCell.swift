//
//  myCollectionViewCell.swift
//  CollectionViewWithIcaroselEffect
//
//  Created by nikhil boriwale on 5/14/18.
//  Copyright © 2018 infostretch. All rights reserved.
//

import UIKit

class myCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var mainview: UIView!
    @IBOutlet weak var myimage: UIImageView!
    @IBOutlet weak var lbltitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.mainview.layer.cornerRadius = 13.0
        self.mainview.layer.shadowColor = UIColor.blue.cgColor
        self.mainview.layer.shadowOpacity = 0.5
        self.mainview.layer.shadowOffset = .zero
        self.mainview.layer.shadowPath = UIBezierPath(rect: self.mainview.bounds).cgPath
        self.mainview.layer.shouldRasterize = true
    }

}
