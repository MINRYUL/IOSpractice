//
//  ViewController.swift
//  DiffableExample
//
//  Created by 김민창 on 2022/01/05.
//

import UIKit
    
class ViewController: UIViewController {
    enum DiffableSection: Int, CaseIterable {
        case main
    }
    
    typealias DiffableDataSource = UICollectionViewDiffableDataSource<DiffableSection, AnyHashable>
    typealias DiffableSnapshot = NSDiffableDataSourceSnapshot<DiffableSection, AnyHashable>
    
    private var dataSource: DiffableDataSource?
    
    private let collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .init(x: 0, y: 0, width: 0, height: 0), collectionViewLayout: flowLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureCollectionView()
        self.configuareDataSource()
        self.configureBinding()
        self.configureView()
        self.configureHeader()
    }
    
    private func bindSnapShotApply(section: DiffableSection, item: [AnyHashable]) {
        DispatchQueue.main.async { [weak self] in
            var snapshot = DiffableSnapshot()
            snapshot.appendSections([.main])
            item.forEach {
                snapshot.appendItems([$0], toSection: section)
            }
            self?.dataSource?.apply(snapshot, animatingDifferences: true)
        }
    }
    
    private func configureBinding() {
        let data = [1, 2, 3, 4, 5, 6, 7]
        self.bindSnapShotApply(section: .main, item: data)
    }
    
    private func configureCollectionView() {
        self.collectionView.delegate = self
        self.collectionView.collectionViewLayout = configureCompositionalLayout()
        self.collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewCell.identifier)
        self.collectionView.register(CollectionReusableView.self,
                                     forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                     withReuseIdentifier: CollectionReusableView.identifier)
    }
    
    private func configureView() {
        self.view.addSubview(self.collectionView)
        NSLayoutConstraint.activate([
            self.collectionView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            self.collectionView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            self.collectionView.rightAnchor.constraint(equalTo: self.view.rightAnchor)
        ])
    }
    
    private func configureCompositionalLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { (_, _) -> NSCollectionLayoutSection? in
            let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalHeight(1.0)))
            item.contentInsets = .init(top: 3, leading: 3, bottom: 3, trailing: 3)
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(0.5)), subitems: [item])
            let section = NSCollectionLayoutSection(group: group)
            section.orthogonalScrollingBehavior = .none
            section.contentInsets = .init(top: 0, leading: 0, bottom: 0, trailing: 0)
            
            let headerSize = NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .fractionalWidth(1/3))
            let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
                layoutSize: headerSize,
                elementKind: UICollectionView.elementKindSectionHeader,
                alignment: .top)
            
            section.boundarySupplementaryItems = [sectionHeader]
            return section
        }
    }
    
    private func configureHeader() {
        self.dataSource?.supplementaryViewProvider = { (
            collectionView: UICollectionView,
            _: String,
            indexPath: IndexPath) -> UICollectionReusableView? in
            guard let header: CollectionReusableView = self.collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: CollectionReusableView.identifier, for: indexPath) as? CollectionReusableView else { return CollectionReusableView() }

            return header
        }
    }
    
    private func configuareDataSource() {
        let datasource = DiffableDataSource(collectionView: self.collectionView, cellProvider: { (collectionView, indexPath, item) -> UICollectionViewCell in
            
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifier, for: indexPath) as? CollectionViewCell else {
                return UICollectionViewCell() }
            guard let item = item as? CollectionViewCell else { return cell }
            print(item)
            return cell
        })
        
        self.dataSource = datasource
        self.collectionView.dataSource = dataSource
    }
}

extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath)
    }
}


