//
//  BasicHashViewController.swift
//  HashGenerator
//
//  Created by Macbook on 3/13/19.
//  Copyright © 2019 DaiTran. All rights reserved.
//

import UIKit

class BasicHashViewController: UIViewController {
    @IBOutlet weak var outputTableView: UITableView!
    @IBOutlet weak var outputTableViewHeightConstraint: NSLayoutConstraint!
    
    private var contentSizeObserver: NSKeyValueObservation?
    private let cellId = "cellId"
    private var viewModel: BasicHashViewModelType
    
    init() {
        viewModel = BasicHashViewModel()
        super.init(nibName: String(describing: BasicHashViewController.self), bundle: .main)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        contentSizeObserver?.invalidate()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        outputTableView.register(
            UINib(
                nibName: String(describing: HashOutputCell.self),
                bundle: .main
            ),
            forCellReuseIdentifier: cellId
        )
        outputTableView.dataSource = self
        
        contentSizeObserver = outputTableView
            .observe(\.contentSize) { [weak self] (tableView, change) in
                self?.outputTableViewHeightConstraint.constant = tableView.contentSize.height
            }
        
        navigationController?.navigationBar.titleTextAttributes = [
            .font: UIFont(name: "Roboto-Medium", size: 18)!
        ]
        navigationItem.title = "Basic Hash"
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: UIImage(named: "refresh"),
            style: .plain,
            target: self,
            action: #selector(didTapRefresh)
        )
        navigationController?.navigationBar.tintColor = UIColor.pinkCoral
        tabBarController?.tabBar.tintColor = UIColor.pinkCoral
    }
    
    @objc private func didTapRefresh() {
        
    }
}

extension BasicHashViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return viewModel.cellLayoutItems.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView
            .dequeueReusableCell(
                withIdentifier: cellId,
                for: indexPath
            ) as? HashOutputCell else { return UITableViewCell() }
        cell.configure(with: viewModel.cellLayoutItems[indexPath.row])
        return cell
    }
}
