//
//  ViewController.swift
//  Today
//
//  Created by Viranaiken Jessy on 25/12/25.
//

import UIKit

class ReminderListViewController: UICollectionViewController {
    // Alias for UICollectionViewDiffableDataSource<Int, String>
    typealias DataSource = UICollectionViewDiffableDataSource<Int, String>
    // Alias for NSDiffableDataSourceSnapshort<Int, String>
    typealias SnapShot = NSDiffableDataSourceSnapshot<Int, String>
    
    var dataSource: DataSource?

    override func viewDidLoad() {
        super.viewDidLoad()
        /// Apply the configured layout
        let listLayout = self.listLayout()
        collectionView.collectionViewLayout = listLayout
        /// Define how cells have to be displayed
        let cellRegistration = UICollectionView.CellRegistration {
            (cell: UICollectionViewListCell, indexPath: IndexPath, itemIdentifier: String) in
            let reminder = Reminder.sampleData[indexPath.item]
            var contentConfiguration = cell.defaultContentConfiguration()
            contentConfiguration.text = reminder.title
            cell.contentConfiguration = contentConfiguration
        }
        /// Apply previous cell registration to the data source
        self.dataSource = DataSource(collectionView: collectionView) { (collectionView: UICollectionView, indexPath: IndexPath, itemIdentifier: String) in
            return collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: itemIdentifier)
        }
        /// SnapShot of the collection
        var snapshot = SnapShot()
        snapshot.appendSections([0])
        snapshot.appendItems(Reminder.sampleData.map { $0.title })
        dataSource?.apply(snapshot)
        collectionView.dataSource = dataSource
    }
    // Define the style of the list
    private func listLayout() -> UICollectionViewCompositionalLayout {
        /// Appearance
        var listConfiguration = UICollectionLayoutListConfiguration(appearance: .grouped)
        /// Separators
        listConfiguration.showsSeparators = false
        /// Background color
        listConfiguration.backgroundColor = .clear
        /// Return the object
        return UICollectionViewCompositionalLayout.list(using: listConfiguration)
    }
}

