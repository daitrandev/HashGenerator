//
//  BasicHashViewController.swift
//  HashGenerator
//
//  Created by Macbook on 3/13/19.
//  Copyright © 2019 DaiTran. All rights reserved.
//

import UIKit
import GoogleMobileAds

class BasicHashViewController: BaseViewController {
    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var outputTableView: UITableView!
    @IBOutlet weak var outputTableViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var stackView: UIStackView!
    
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
        
        bannerView = createAndLoadBannerView()
        interstitial = createAndLoadInterstitial()
        
        viewModel.delegate = self
        
        inputTextField.addTarget(self, action: #selector(inputTextEditingChanged), for: .editingChanged)
        
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
        navigationItem.title = "Basic Hash"
    }
    
    @objc private func inputTextEditingChanged() {
        viewModel.inputText = inputTextField.text
    }
    
    @objc override func didTapRefresh() {
        inputTextField.text = nil
        viewModel.inputText = nil
    }
    
    override func adViewDidReceiveAd(_ bannerView: GADBannerView) {
        super.adViewDidReceiveAd(bannerView)
        
        stackView.insertArrangedSubview(bannerView, at: 0)
    }
}

extension BasicHashViewController: BasicHashViewModelDelegate {
    func reloadOutputTableView() {
        guard let cells = outputTableView.visibleCells as? [HashOutputCell] else { return }
        for index in 0..<cells.count {
            cells[index].configure(with: viewModel.cellLayoutItems[index])
        }
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
        cell.delegate = self
        return cell
    }
}

extension BasicHashViewController: HashOutputCellDelegate {
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
