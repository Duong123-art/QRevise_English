//
//  UICollectionView.swift
//  QRevise_Vocabulary
//
//  Created by quang.duong on 22/08/2023.
//

import UIKit

extension UICollectionView {
    func register<T: UICollectionViewCell>(_ aclass: T.Type) {
        let name = String(describing: aclass)
        let bundle = Bundle.main
        
        if bundle.path(forResource: name, ofType: "nib") != nil {
            let nib = UINib(nibName: name, bundle: bundle)
            self.register(nib, forCellWithReuseIdentifier: name)
        } else {
            self.register(aclass, forCellWithReuseIdentifier: name)
        }
    }
    
    func register<T: UICollectionReusableView>(header aclass: T.Type) {
        let name = String(describing: aclass)
        let bundle = Bundle.main
        let kind = UICollectionView.elementKindSectionHeader
        
        if bundle.path(forResource: name, ofType: "nib") != nil {
            let nib = UINib(nibName: name, bundle: bundle)
            self.register(nib, forSupplementaryViewOfKind: kind, withReuseIdentifier: name)
        } else {
            self.register(aclass, forSupplementaryViewOfKind: kind, withReuseIdentifier: name)
        }
    }
    
    func register<T: UICollectionReusableView>(footer aclass: T.Type) {
        let name = String(describing: aclass)
        let bundle = Bundle.main
        let kind = UICollectionView.elementKindSectionFooter
        
        if bundle.path(forResource: name, ofType: "nib") != nil {
            let nib = UINib(nibName: name, bundle: bundle)
            self.register(nib, forSupplementaryViewOfKind: kind, withReuseIdentifier: name)
        } else {
            self.register(aclass, forSupplementaryViewOfKind: kind, withReuseIdentifier: name)
        }
    }

    
    func dequeue<T: UICollectionViewCell>(_ aclass: T.Type, for indexPath: IndexPath) -> T {
        let name = String(describing: aclass)
        guard let cell = dequeueReusableCell(withReuseIdentifier: name, for: indexPath) as? T else {
            fatalError("Cannot dequeue collection cell: \(name)")
        }
        
        return cell
    }
    
    func dequeue<T: UICollectionReusableView>(header aclass: T.Type, for indexPath: IndexPath) -> T {
        let name = String(describing: aclass)
        let kind = UICollectionView.elementKindSectionHeader
        guard let cell = dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: name, for: indexPath) as? T else {
            fatalError("Cannot dequeue collection header: \(name)")
        }
        
        return cell
    }
    
    func dequeue<T: UICollectionReusableView>(footer aclass: T.Type, for indexPath: IndexPath) -> T {
        let name = String(describing: aclass)
        let kind = UICollectionView.elementKindSectionFooter
        guard let cell = dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: name, for: indexPath) as? T else {
            fatalError("Cannot dequeue collection footer: \(name)")
        }
        
        return cell
    }
}
