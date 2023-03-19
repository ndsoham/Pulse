//
//  EventsViewController.swift
//  Pulse
//
//  Created by Soham Nagawanshi on 3/16/23.
//

import Foundation
import UIKit

class EventsViewController: UIViewController {
    // attributes
    private var safeMargins: UILayoutGuide?
    private var layout: UICollectionViewCompositionalLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5),
                                              heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                               heightDimension: .fractionalWidth(0.2))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                       subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
    private var collectionView: UICollectionView?

    // life cycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
    }
    // layout subviews
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        // set up the collection view
        safeMargins = self.view.safeAreaLayoutGuide
        if let safeMargins{
            setupCollectionView(safeMargins: safeMargins)
        }
    }
}
//MARK: - Set Up the UI
extension EventsViewController {
    func setupCollectionView(safeMargins: UILayoutGuide) {
        collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width - Constants.padding, height: self.view.frame.height - Constants.padding), collectionViewLayout: layout)
        if let collectionView {
            collectionView.backgroundColor = .systemBackground
            collectionView.allowsSelection = true
            collectionView.allowsMultipleSelection = false
            collectionView.register(EventsCollectionViewCell.self, forCellWithReuseIdentifier: Constants.eventsCell)
            collectionView.delegate = self
            collectionView.dataSource = self
            collectionView.translatesAutoresizingMaskIntoConstraints = false
            self.view.addSubview(collectionView)
           
        
        }
    }
    
    func setupNavBar() {
        if let navigationController {
            navigationController.navigationBar.prefersLargeTitles = true
            navigationController.navigationBar.shadowImage = nil
            navigationController.navigationBar.sizeToFit()
            self.navigationItem.largeTitleDisplayMode = .always
            self.navigationItem.title = "Events"
            navigationController.navigationBar.tintColor = .black
        }
    }
}
//MARK: - Manage user interactions
extension EventsViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // FIXME: implement detail view
    }
}
//MARK: - Manage appearance
extension EventsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let possibleWidths = [75, 100, 125, 100]
        return CGSize(width: 100, height: 100)
    }
}
//MARK: - Manage data source
extension EventsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.eventsCell, for: indexPath) as! EventsCollectionViewCell
        if cell.organizerImage == nil {
                cell.organizerImage = UIImage(systemName: "person")
                cell.backgroundColor = Constants.colors[Int.random(in: 0...1)]
            }
            return cell

    }
    
}
