//
//  SharedViewController.swift
//  NewsNytimes
//
//  Created by user on 08.09.2021.
//

import UIKit

class SharedViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.registerCell(type: SharedTableViewCell.self)
            tableView.backgroundColor = .clear
            tableView.rowHeight = 60
            tableView.delegate = self
            tableView.dataSource = self
        }
    }
    
    var viewModel: SharedViewModelProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .systemBlue
    }

}

extension SharedViewController: SharedViewModelDelegate {
    func didFetchData() {
        self.tableView.reloadData()
    }
}

extension SharedViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.countEmails
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueCell(withType: SharedTableViewCell.self, for: indexPath) as? SharedTableViewCell else { return UITableViewCell() }
        
        let model = self.viewModel.itemForTable(index: indexPath.row)
        cell.configure(model: model)
        
        return cell
    }
    
    
}

extension SharedViewController: UITableViewDelegate {
    
}
