//
//  HMACViewController.swift
//  HashGenerator
//
//  Created by Macbook on 3/23/19.
//  Copyright © 2019 DaiTran. All rights reserved.
//

import UIKit

class HMACViewController: BaseViewController {
    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var inputKeyTextField: UITextField!
    @IBOutlet weak var outputTableView: UITableView!
    @IBOutlet weak var outputTableViewHeightConstraint: NSLayoutConstraint!
    
    private var contentSizeObserver: NSKeyValueObservation?
    private let cellId = "cellId"
    private var viewModel: HMACViewModelType
    
    init() {
        viewModel = HMACViewModel()
        super.init(nibName: String(describing: HMACViewController.self), bundle: .main)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        contentSizeObserver?.invalidate()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.delegate = self
        [inputTextField, inputKeyTextField].forEach {
            $0.addTarget(self, action: #selector(textFieldEditingChanged), for: .editingChanged)
        }
        
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
        
        navigationItem.title = "HMAC"
    }
    
    @objc private func textFieldEditingChanged(_ sender: UITextField) {
        if sender == inputTextField {
            viewModel.inputText = inputTextField.text
        } else {
            viewModel.inputKey = inputKeyTextField.text
        }
    }
}

extension HMACViewController: HMACViewModelDelegate {
    func reloadOutputTableView() {
        guard let cells = outputTableView.visibleCells as? [HashOutputCell] else { return }
        for index in 0..<cells.count {
            cells[index].configure(with: viewModel.cellLayoutItems[index])
        }
    }
}

extension HMACViewController: UITableViewDataSource {
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
        cell.delegate = self
        return cell
    }
}

extension HMACViewController: HashOutputCellDelegate {
    func didTapCopy(string: String) {
        UIPasteboard.general.string = string
        showMessageDialog(
            title: "Success",
            message: "Copied",
            actionName: "Close",
            action: nil
        )
    }
}
