//
//  ComparisionViewController.swift
//  HashGenerator
//
//  Created by DaiTran on 8/14/20.
//  Copyright © 2020 DaiTran. All rights reserved.
//

import UIKit
import GoogleMobileAds

class ComparisionViewController: BaseViewController {
    @IBOutlet weak var firstInputTextField: UITextField!
    @IBOutlet weak var secondInputTextField: UITextField!
    @IBOutlet weak var outputLabel: UILabel!
    @IBOutlet weak var stackView: UIStackView!
    
    private var viewModel: ComparisionViewModelType
    
    init() {
        viewModel = ComparisionViewModel()
        super.init(
            nibName: String(describing: ComparisionViewController.self),
            bundle: .main
        )
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bannerView = createAndLoadBannerView()
        
        viewModel.delegate = self
        
        [firstInputTextField, secondInputTextField].forEach {
            $0.addTarget(self, action: #selector(textFieldEditingChanged), for: .editingChanged)
        }
        
        viewModel.firstInputText = nil
        viewModel.secondInputText = nil
        
        navigationItem.title = "Comparision"
    }
    
    @objc private func textFieldEditingChanged(_ sender: UITextField) {
        if sender == firstInputTextField {
            viewModel.firstInputText = firstInputTextField.text
        } else {
            viewModel.secondInputText = secondInputTextField.text
        }
    }
    
    override func didTapRefresh() {
        firstInputTextField.text = nil
        viewModel.firstInputText = nil
        
        secondInputTextField.text = nil
        viewModel.secondInputText = nil
    }
    
    override func adViewDidReceiveAd(_ bannerView: GADBannerView) {
        super.adViewDidReceiveAd(bannerView)
        
        stackView.insertArrangedSubview(bannerView, at: 0)
    }
}

extension ComparisionViewController: ComparisionViewModelDelegate {
    func renderOutput(isSame: Bool) {
        if isSame {
            outputLabel.text = "Both input text are same"
            return
        }
        outputLabel.text = "Both input text aren't same"
    }
}
