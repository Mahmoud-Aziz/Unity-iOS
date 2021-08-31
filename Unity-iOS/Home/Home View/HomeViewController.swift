//
//  ViewController.swift
//  Unity-iOS
//
//  Created by Mahmoud Aziz on 31/08/2021.
//


import UIKit

class HomeViewController: UIViewController, UnityFrameworkDeallocator {
    
    @IBOutlet private weak var searchBar: UISearchBar!
    @IBOutlet private weak var collectionView: UICollectionView! {
        
        didSet {
            collectionView.dataSource = self
            collectionView.register(UINib(nibName: "HeaderView", bundle: nil), forSupplementaryViewOfKind: "header", withReuseIdentifier: "HeaderView")
            collectionView.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CollectionViewCell")
            collectionView.register(UINib(nibName: "SpecialEventsCell", bundle: nil), forCellWithReuseIdentifier: "SpecialEventsCell")
        }
    }
    
    var unityView: UIView?
    var titlesForSectionTwo = ["Quiz","Math Clash","2048","Soduko"]
    var titlesForSecThree = ["Hill Racing","Runner No.1","Bike Racing","Maze Up"]
    
    //MARK:- View Life Cycle
    
    override func viewDidLoad() {
        collectionView.collectionViewLayout = createCompositionalLayout()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Start Unity", style: .plain, target: self, action: #selector(buttonTapped))
        
        self.navigationItem.rightBarButtonItem?.tintColor = .black
        self.navigationController?.navigationBar.barTintColor = .white
    }
    
    //MARK:- Helpers:
    
    @objc func buttonTapped() {
        UnityFrameworkWrapper.shared.delegate = self
        self.unityView = UnityFrameworkWrapper.shared.framework.appController()!.rootView
        self.view.addSubview(self.unityView!)
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    //MARK:- Collection View Compositional Layout Methods:
    
    func  createCompositionalLayout() -> UICollectionViewCompositionalLayout {
        let layout = UICollectionViewCompositionalLayout{ [weak self] (index, enviroment) -> NSCollectionLayoutSection? in
            return self?.createSectionFor(index: index, enviroment: enviroment)
        }
        return layout
    }
    
    func createSectionFor(index: Int, enviroment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection {
        switch index {
        case 0:
            return createFirstSection()
        case 1:
            return createSecondSection()
        case 2:
            return createThirdSection()
        case 3:
            return createFourthSection()
        case 4:
            return createFifthSection()
        default:
            return createFirstSection()
        }
    }
    
    //First Section
    func createFirstSection() -> NSCollectionLayoutSection {
        let inset: CGFloat = 2.5
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: inset, leading: inset, bottom: inset, trailing: inset)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.3))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        
        return section
    }
    
    //Second Section
    func createSecondSection() -> NSCollectionLayoutSection {
        
        let inset: CGFloat = 2.5
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.4), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: inset, leading: inset, bottom: inset, trailing: inset)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.9), heightDimension: .fractionalHeight(0.5))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 2)
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(44))
        let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize,elementKind: "header",alignment: .top)
        
        section.boundarySupplementaryItems = [header]
        
        return section
    }
    
    //Third Section
    func createThirdSection() -> NSCollectionLayoutSection {
        
        let inset: CGFloat = 2.5
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.4), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: inset, leading: inset, bottom: inset, trailing: inset)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.9), heightDimension: .fractionalHeight(0.25))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 2)
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(44))
        let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize,elementKind: "header",alignment: .top)
        
        section.boundarySupplementaryItems = [header]
        
        return section
    }
    
    //Fourth Section
    func createFourthSection() -> NSCollectionLayoutSection {
        
        let inset: CGFloat = 2.5
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.4), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: inset, leading: inset, bottom: inset, trailing: inset)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.9), heightDimension: .fractionalHeight(0.25))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 2)
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(44))
        let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize,elementKind: "header",alignment: .top)
        
        section.boundarySupplementaryItems = [header]
        
        return section
    }
    
    //Fifth Section
    func createFifthSection() -> NSCollectionLayoutSection {
        
        let inset: CGFloat = 2.5
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.5))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: inset, leading: inset, bottom: inset, trailing: inset)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalHeight(0.2))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitem: item, count: 2)
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(44))
        let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize,elementKind: "header",alignment: .top)
        
        section.boundarySupplementaryItems = [header]
        
        return section
    }
    
    // MARK: - Unity Framework Deallocator:
    
    func exitUnity() {
        unityView?.removeFromSuperview()
    }
}

//MARK:- Collection View Data Source Methods:

extension HomeViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 5
        case 1:
            return 5
        case 2:
            return self.titlesForSectionTwo.count
        case 3:
            return self.titlesForSecThree.count
        case 4:
            return 6
        default:
            return 10
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = cellConfigure(indexPath: indexPath)
        cell.backgroundColor = .white
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        guard let view = collectionView.dequeueReusableSupplementaryView(ofKind: "header", withReuseIdentifier: "HeaderView", for: indexPath) as? HeaderView else {
            return UICollectionReusableView()
        }
        view.title = {
            switch indexPath.section {
            case 1:
                return "Special Events"
            case 2:
                return "Quiz & Brain Games"
            case 3:
                return "Running Games"
            case 4:
                return "All Games Categories"
            default:
                return "No Value"
            }
        }()
        return view
    }
    
    func cellConfigure(indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SpecialEventsCell", for: indexPath) as! SpecialEventsCell
            return cell
        } else if indexPath.section == 2 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CustomCollectionViewCell
            cell.title = self.titlesForSectionTwo[indexPath.item]
            return cell
        } else if indexPath.section == 3 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CustomCollectionViewCell
            cell.title = self.titlesForSecThree[indexPath.item]
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CustomCollectionViewCell
            cell.title = ""
            return cell
        }
    }
}
