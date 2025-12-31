//
//  ReminderListViewController+DataSource.swift
//  Today
//
//  Created by Viranaiken Jessy on 31/12/25.
//

import UIKit

extension ReminderListViewController {
    // Alias for UICollectionViewDiffableDataSource<Int, String>
    typealias DataSource = UICollectionViewDiffableDataSource<Int, String>
    // Alias for NSDiffableDataSourceSnapshort<Int, String>
    typealias SnapShot = NSDiffableDataSourceSnapshot<Int, String>
    // Handler for cellRegistration that will provide what to do
    func cellRegistrationHandler(cell: UICollectionViewListCell, indexPath: IndexPath, id: String) {
        /// Sample
        let reminder = Reminder.sampleData[indexPath.item]
        /// Default configuration
        var contentConfiguration = cell.defaultContentConfiguration()
        /// Title
        contentConfiguration.text = reminder.title
        /// Secondary text
        contentConfiguration.secondaryText = reminder.dueDate.dateAndTimeText
        /// Secondary text properties
        contentConfiguration.secondaryTextProperties.font = UIFont.preferredFont(forTextStyle: .caption1)
        /// Furnish the contenConfiguration
        cell.contentConfiguration = contentConfiguration
        /// Background configuration
        var backgroundConfiguration = UIBackgroundConfiguration.listCell()
        
    }
}
