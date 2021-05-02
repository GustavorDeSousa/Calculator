//
//  ButtonsCalculatorCollectionViewCell.swift
//  Calculator
//
//  Created by Gustavo De Sousa on 18/04/21.
//  Copyright © 2021 Gustavo De Sousa. All rights reserved.
//

import UIKit

class ButtonsCalculatorCollectionViewCell: UICollectionViewCell {
    lazy var circleButtonView: UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var textButtonLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        circleButtonView.layer.cornerRadius = circleButtonView.frame.height/2
    }
    
    // MARK: - Setup
    func setup(buttonInfos: ButtonsCalculatorStruct) {
        addViews()
        addConstraints()
        setupConfigureCell()
        setupInput(buttonInfos: buttonInfos)
    }
    
    private func setupConfigureCell() {
        isUserInteractionEnabled = true
    }
    
    private func setupInput(buttonInfos: ButtonsCalculatorStruct) {
        circleButtonView.backgroundColor = buttonInfos.colorButton
        textButtonLabel.text = buttonInfos.textButton
    }
    
    // MARK: - Add Views
    private func addViews() {
        addSubview(circleButtonView)
        circleButtonView.addSubview(textButtonLabel)
    }
    
    // MARK: - Add Constraints
    private func addConstraints() {
        circleButtonView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        textButtonLabel.snp.makeConstraints { make in
            make.edges.equalTo(circleButtonView)
        }
    }
}
