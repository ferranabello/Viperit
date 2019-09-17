//
//  TableOfContentsView.swift
//  Viperit
//
//  Created by Ferran on 01/04/2019.
//Copyright © 2019 Ferran Abelló. All rights reserved.
//

import UIKit
import Viperit

//MARK: TableOfContentsView Class
final class TableOfContentsView: TableUserInterface {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Viperit App"
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0: presenter.showHome()
        case 1: presenter.showCool()
        case 2: presenter.showSimple()
        default: break
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        switch indexPath.row {
        case 0:
            cell.textLabel?.text = "Storyboard module"
        case 1:
            cell.textLabel?.text = "Swift UI module"
        case 2:
            cell.textLabel?.text = "Code-generated module"
        default: break
        }
        return cell
    }
    
}

//MARK: - TableOfContentsView API
extension TableOfContentsView: TableOfContentsViewApi {
}

// MARK: - TableOfContentsView Viper Components API
private extension TableOfContentsView {
    var presenter: TableOfContentsPresenterApi {
        return _presenter as! TableOfContentsPresenterApi
    }
    var displayData: TableOfContentsDisplayData {
        return _displayData as! TableOfContentsDisplayData
    }
}
