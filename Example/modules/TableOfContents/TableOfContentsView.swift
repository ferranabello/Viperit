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
        navigationItem.title = "Viperit Table Module"
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.showHome()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "Go to home module"
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
