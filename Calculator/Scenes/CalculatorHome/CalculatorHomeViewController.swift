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

    // MARK: - Variable and Constants
    var viewModel: CalculatorHomeViewModelProtocol!

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    // MARK: - Load View
    override func loadView() {
        view = CalculatorHomeView()
    }
    
    // MARK: - Setup
    private func setup() {
        NotificationCenter.default.addObserver(self, selector:  #selector(notificationUpdateValues(_:)), name: .updateInfo, object: nil)
        NotificationCenter.default.addObserver(self, selector:  #selector(notificationShowResult(_:)), name: .showResult, object: nil)
        viewModel = CalculatorHomeViewModel()
        setupCollectionView()
    }
    
    private func setupCollectionView() {
        screenView.buttonsCollectionView.delegate = self
        screenView.buttonsCollectionView.dataSource = self
    }
    
    // MARK: - Notification
    @objc func notificationUpdateValues(_ notification: Notification) {
        let myInfo = notification.object as? [String]
        var newValueInput = ""
        myInfo?.forEach({ (value) in
            if value == "*" {
                newValueInput = newValueInput + " " + "x"
            } else {
                newValueInput = newValueInput + " " + value
            }
        })
        screenView.inputValueLabel.text = newValueInput.replacingOccurrences(of: ".", with: ",")
    }
    
    @objc func notificationShowResult(_ notification: Notification) {
        let valueString = String(describing: notification.object ?? "")
        let valueDouble = Double(valueString)
        if valueString.contains(".") {
            screenView.inputValueLabel.text = String(format: "%.2f", valueDouble ?? 0.0).replacingOccurrences(of: ".", with: ",")
        } else {
            screenView.inputValueLabel.text = String(Int(valueDouble ?? 0.0)).replacingOccurrences(of: ".", with: ",")
        }
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        let myList = viewModel.getList()
        viewModel.insertInfoCalculator(inputCalculator: myList[indexPath.row].textButton)
    }
}


extension CalculatorHomeViewController : UICollectionViewDelegateFlowLayout{

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let sizeCell = (collectionView.bounds.width / 4) - 10
        return CGSize(width: sizeCell, height: sizeCell)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
}


extension Notification.Name {
    static let updateInfo = Notification.Name("updateInfo")
    static let showResult = Notification.Name("showResult")
}
