//
//  GalleryViewController.swift
//  SOCIAL
//
//  Created by Quyen Trinh on 5/9/18.
//  Copyright © 2018 Quyen Trinh. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class GalleryViewController: BaseViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var viewModel : GalleryViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.rx
            .setDelegate(self)
            .disposed(by: bag)

    }

    //MARK: - Setup
    
    override func bindUI() {
        super.bindUI()
        viewModel
            .photoList
            .asObservable()
            .bind(to: collectionView.rx.items) { [weak self] (collectionView, row, element) in
                let indexPath = IndexPath(row: row, section: 0)
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GalleryCell", for: indexPath) as! GalleryCell
                cell.photo = self?.viewModel.photoList.value[row]
                return cell
            }
            .disposed(by: bag)
    }
    
}

extension GalleryViewController : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenWidth = self.view.bounds.size.width
        
        return CGSize(width: screenWidth/3 - 1, height: screenWidth/3 - 1)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0.5, left: 0, bottom: 0.5, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
}
