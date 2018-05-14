//
//  ViewController.swift
//  CollectionViewWithIcaroselEffect
//
//  Created by nikhil boriwale on 5/14/18.
//  Copyright © 2018 infostretch. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    struct ModelCollectionFlowLayout {
        var title:String = ""
        var image:UIImage!
    }
    @IBOutlet weak var mycollectionview: UICollectionView!
     var arrData = [ModelCollectionFlowLayout]()
    override func viewDidLoad() {
        super.viewDidLoad()
       collectData()
        //hide the line doted line
        mycollectionview.showsHorizontalScrollIndicator = false
        
        mycollectionview.register(UINib.init(nibName: "myCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "Cell")
        let floawLayout = UPCarouselFlowLayout()
        floawLayout.itemSize = CGSize(width: UIScreen.main.bounds.size.width - 60.0, height: mycollectionview.frame.size.height)
        floawLayout.scrollDirection = .horizontal
        floawLayout.sideItemScale = 0.8
        floawLayout.sideItemAlpha = 1.0
        floawLayout.spacingMode = .fixed(spacing: 5.0)
        mycollectionview.collectionViewLayout = floawLayout
    }
    func collectData(){
        arrData = [
            ModelCollectionFlowLayout(title: "Pune", image: #imageLiteral(resourceName: "astodiyaDarwaza")),
            ModelCollectionFlowLayout(title: "Nanded", image: #imageLiteral(resourceName: "dariyapurDarwaza")),
            ModelCollectionFlowLayout(title: "Delhi ", image: #imageLiteral(resourceName: "delhiDarwaza")),
            ModelCollectionFlowLayout(title: "Mumbai", image: #imageLiteral(resourceName: "jamalpurDarwaza")),
            ModelCollectionFlowLayout(title: "aurangbad", image: #imageLiteral(resourceName: "premDarwaza")),
            ModelCollectionFlowLayout(title: "surat", image: #imageLiteral(resourceName: "raipurDarwaza")),
            ModelCollectionFlowLayout(title: "jalna", image: #imageLiteral(resourceName: "teenDarwaza")),
        ]
    }
    
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let layout = self.mycollectionview.collectionViewLayout as! UPCarouselFlowLayout
        let pageSide = (layout.scrollDirection == .horizontal) ? self.pageSize.width : self.pageSize.height
        let offset = (layout.scrollDirection == .horizontal) ? scrollView.contentOffset.x : scrollView.contentOffset.y
        currentPage = Int(floor((offset - pageSide / 2) / pageSide) + 1)
    }
    fileprivate var currentPage: Int = 0 {
        didSet {
            print("page at centre = \(currentPage)")
        }
    }
    
    fileprivate var pageSize: CGSize {
let layout = self.mycollectionview.collectionViewLayout as! UPCarouselFlowLayout
        var pageSize = layout.itemSize
        if layout.scrollDirection == .horizontal {
            pageSize.width += layout.minimumLineSpacing
        } else {
            pageSize.height += layout.minimumLineSpacing
        }
        return pageSize
    }

}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! myCollectionViewCell
        cell.myimage.image = arrData[indexPath.row].image
        cell.lbltitle.text = arrData[indexPath.row].title
        return cell
}
}
