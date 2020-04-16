//
//  PhotoGridController.swift
//  FB2019
//
//  Created by Bárbara Barone - BBA on 15/04/20.
//  Copyright © 2020 Bárbara Barone - BBA. All rights reserved.
//

import UIKit
import SwiftUI
import LBTATools

class PhotoGridCell: LBTAListCell<String> {
    
    override var item: String! {
        didSet {
            imageView.image = UIImage(named: item)
        }
    }
    
    let imageView = UIImageView(image: UIImage(named: "WhatsApp Image 2020-02-06 at 20.55.51"), contentMode: .scaleAspectFill)
    override func setupViews() {
        backgroundColor = .yellow
        
//        addSubview(imageView)
//        imageView.fillSuperview()
        stack(imageView)
    }
}

 class PhotosGridController: LBTAListController<PhotoGridCell, String>, UICollectionViewDelegateFlowLayout {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .lightGray
        
        self.items = ["WhatsApp Image 2020-02-06 at 20.55.51", "WhatsApp Image 2020-02-21 at 10.12.35", "WhatsApp Image 2020-04-15 at 22.32.25", "WhatsApp Image 2020-02-06 at 20.55.51", "WhatsApp Image 2020-02-06 at 20.55.51"]
    }
    
    let cellSpacing: CGFloat = 4
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if self.items.count == 4 {
            // do 4 grid cell layout
        }
        
        if indexPath.item == 0 || indexPath.item == 1 {
            let width = (view.frame.width - 3 * cellSpacing) / 2
            
            return .init(width: width, height: width)
        }
        let width = (view.frame.width - 4.1 * cellSpacing) / 3
    
        return .init(width: width, height: width)
       
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return cellSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 0, left: cellSpacing, bottom: 0, right: cellSpacing)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return cellSpacing
    }
}

struct PhotoGridPreview: PreviewProvider {
    
    
    static var previews: some View {
        ContainerView()
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<PhotoGridPreview.ContainerView>) ->  UIViewController {
            return PhotosGridController()
        }
        
        func updateUIViewController(_ uiViewController: PhotoGridPreview.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<PhotoGridPreview.ContainerView>) {
            
        }
    }
}
