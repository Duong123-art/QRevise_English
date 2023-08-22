//
//  AddNewWordViewController.swift
//  QRevise_Vocabulary
//
//  Created by quang.duong on 20/08/2023.
//

import UIKit
import SnapKit

fileprivate let fakeUrl: String = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQOApFCSVByzhZorHUAP-J851JAYyOPtI1jdg&usqp=CAU"

class AddNewWordViewController: BaseUIViewController<AddNewWordViewModel> {
    // MARK: - IBOutlets
    @IBOutlet private weak var userInfoContainer: UIView!
    @IBOutlet private weak var avatar: UIImageView!
    @IBOutlet weak var infoContainer: UIStackView!
    
    
    // MARK: - Properties
    private let sections = MockData.shared.pageData
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.defaultSetup()
        self.setupCollectionView()
    }
}

extension AddNewWordViewController {
    private func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(WordTypeCollectionViewCell.self)
        collectionView.register(header: TitleCollectionViewCell.self)
        
        collectionView.collectionViewLayout = createLayout()
    }
    
    private func createLayout() -> UICollectionViewCompositionalLayout {
        UICollectionViewCompositionalLayout { sectionIndex, layoutEnvironment in
            let section = self.sections[sectionIndex]
            switch section {
            case .wordType:
                let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .absolute(70), heightDimension: .absolute(70)), subitems: [item])
                
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .continuous
                section.interGroupSpacing = 10
                
                section.boundarySupplementaryItems = [self.supplyEmentaryHeaderItem()]
                return section
            default:
                let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.6)), subitems: [item])
                
                let section = NSCollectionLayoutSection(group: group)
                section.interGroupSpacing = 10
                section.boundarySupplementaryItems = [self.supplyEmentaryHeaderItem()]
                return section
            }
        }
    }
    
    private func supplyEmentaryHeaderItem() -> NSCollectionLayoutBoundarySupplementaryItem {
        return  .init(layoutSize: .init(widthDimension: .fractionalWidth(1),
                                        heightDimension: .absolute(70)),
                      elementKind: UICollectionView.elementKindSectionHeader,
                      alignment: .top)
    }
    
    private func defaultSetup() {
        userInfoContainer.setCornersBorder()
        avatar.loadImageFromNetWork(url: fakeUrl)
        avatar.getCircleImage()
        avatar.contentMode = .scaleAspectFill
        
        let infos: [(String, String)] = [("Total", "2000"), ("Wrong word", "500"), ("Target", "10/day")]
        
        infos.forEach { item in
            let itemView = getInfoView(title: item.0, value: item.1)
            infoContainer.addArrangedSubview(itemView)
        }
    }
    
    private func getInfoView(title: String, value: String) -> UIView {
        let containerView = UIView()
        
        let topLabel = UILabel()
        topLabel.setup(text: title, textAlign: .center)
        
        let bottomLabel = UILabel()
        bottomLabel.setup(text: value, font: .systemFont(ofSize: 14, weight: .medium), textAlign: .center)
        
        containerView.addSubview(topLabel)
        containerView.addSubview(bottomLabel)
        
        topLabel.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.bottom.equalTo(bottomLabel.snp.top)
        }
        
        bottomLabel.snp.makeConstraints { make in
            make.bottom.leading.trailing.equalToSuperview()
        }
        
        return containerView
    }
}

// MARK: - CollectionView Delegate
extension AddNewWordViewController: UICollectionViewDelegate{}

// MARK: - CollectionView DataSource
extension AddNewWordViewController: UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        sections.count
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sections[section].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let section = sections[indexPath.section]
        let item = sections[indexPath.section].items[indexPath.row]
        
        let cell = collectionView.dequeue(WordTypeCollectionViewCell.self, for: indexPath)
        cell.bind(url: item.url)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let header = collectionView.dequeue(header: TitleCollectionViewCell.self, for: indexPath)
            header.bind(title: "Word Types")
            return header
        default:
            return UICollectionReusableView()
        }
    }
}
