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
        /// Done button
        var doneButtonConfiguration = doneButtonConfiguration(for: reminder)
        /// Change the color of the button
        doneButtonConfiguration.tintColor = .todayListCellDoneButtonTint
        /// Add the button accessories to the cell
        cell.accessories = [.customView(configuration: doneButtonConfiguration), .disclosureIndicator(displayed: .always)]
        /// Background configuration
        var backgroundConfiguration = UIBackgroundConfiguration.listCell()
        /// Apply a custom color to the background configuration
        backgroundConfiguration.backgroundColor = .todayListCellBackground
        /// Apply the background configuration to the cell configuration
        cell.backgroundConfiguration = backgroundConfiguration
    }
    // Done button configuration
    private func doneButtonConfiguration(for reminder: Reminder) -> UICellAccessory.CustomViewConfiguration {
        /// Define the symbol
        let symbolName = reminder.isComplete ? "circle.fill" : "circle"
        /// Define the UI configuration
        let symbolConfiguration = UIImage.SymbolConfiguration(textStyle: .title1)
        /// Create the image object
        let image = UIImage(systemName: symbolName, withConfiguration: symbolConfiguration)
        /// Create the button object
        let button = UIButton()
        button.setImage(image, for: .normal)
        /// Return
        return UICellAccessory.CustomViewConfiguration(customView: button, placement: .leading(displayed: .always))
    }
}
