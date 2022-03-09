//
//  ViewController.swift
//  Today
//
//  Created by Семен Колесников on 08.03.2022.
//

import UIKit

class ReminderListViewController: UICollectionViewController {
    
    var dataSource: DataSource!
    var reminders: [Reminder] = Reminder.sampleData
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let listLayout = listLayout()
        collectionView.collectionViewLayout = listLayout
        
        let cellRegistration = UICollectionView.CellRegistration(handler: cellRegistrationHandler)
        dataSource = DataSource(collectionView: collectionView) { (collectionView: UICollectionView,
                                                                   indexPath: IndexPath, itemIdentifier: Reminder.ID) in
            return collectionView.dequeueConfiguredReusableCell(using: cellRegistration,
                                                                for: indexPath, item: itemIdentifier)
        }
        
        var snapshot = Snapshot()
        snapshot.appendSections([0])
        snapshot.appendItems(reminders.map({$0.id}))
        dataSource.apply(snapshot)
        
        updateSnapshot()
        
        collectionView.dataSource = dataSource
        
    }
    
    private func  listLayout() -> UICollectionViewCompositionalLayout  {
        var listConfiguration = UICollectionLayoutListConfiguration(appearance: .grouped)
        listConfiguration.showsSeparators = false
        listConfiguration.backgroundColor = .clear
        return UICollectionViewCompositionalLayout.list(using: listConfiguration)
    }
    
}

