//
//  CalculatorHomeViewController.swift
//  Calculator
//
//  Created by Gustavo De Sousa on 18/04/21.
//  Copyright © 2021 Gustavo De Sousa. All rights reserved.
//

import UIKit

class CalculatorHomeViewController: UIViewController {
    private unowned var screenView: CalculatorHomeView { return self.view as! CalculatorHomeView }

    var viewModel: CalculatorHomeViewModelProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    override func loadView() {
        view = CalculatorHomeView()
    }
    
    // MARK: - Setup
    private func setup() {
        viewModel = CalculatorHomeViewModel()
        setupCollectionView()
    }
    
    private func setupCollectionView() {
        screenView.buttonsCollectionView.delegate = self
        screenView.buttonsCollectionView.dataSource = self
    }
}

extension CalculatorHomeViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.getListCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: String(describing: ButtonsCalculatorCollectionViewCell.self), for: indexPath) as? ButtonsCalculatorCollectionViewCell else {
            return UICollectionViewCell()
        }

        cell.setup(buttonInfos: viewModel.getList()[indexPath.row])
        return cell
    }
    
    
}
