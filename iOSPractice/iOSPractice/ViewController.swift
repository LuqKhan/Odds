//
//  ViewController.swift
//  iOSPractice
//
//  Created by Luqmaan Khan on 10/13/20.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate {

    
    private var collectionView: UICollectionView!
    
    let matchupOddsController = MatchupOddsController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionViewLayout()
    }
    
    private func createLayout() -> UICollectionViewLayout {
        //item
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                              heightDimension: .fractionalHeight(1.0))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        item.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8)
        
        //group
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                               heightDimension: .absolute(75))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        //section
        let section = NSCollectionLayoutSection(group: group)
        
        //layout
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
    
    private func configureCollectionViewLayout() {
        collectionView  = UICollectionView(frame: view.bounds, collectionViewLayout: createLayout())
        collectionView.delegate = self
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.backgroundColor = .systemBlue
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        view.addSubview(collectionView)
    }


}
