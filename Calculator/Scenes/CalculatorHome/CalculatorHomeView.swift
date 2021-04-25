//
//  CalculatorHomeView.swift
//  Calculator
//
//  Created by Gustavo De Sousa on 18/04/21.
//  Copyright © 2021 Gustavo De Sousa. All rights reserved.
//

import UIKit
import SnapKit

public final class CalculatorHomeView: UIView {
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
        addConstraints()
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Variable and Constants
    private lazy var contentView = makeContentView()
    private lazy var screenInputView = makeScreenInputView()
    lazy var buttonsCollectionView = makeCollectionView()

    // MARK: - Functions Views
    private func makeContentView() -> UIView {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }
    
    private func makeScreenInputView() -> UIView {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }
    
    private func makeCollectionView() -> UICollectionView {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: 60, height: 60)
        
        let collection = UICollectionView(frame: self.frame, collectionViewLayout: layout)
        collection.register(ButtonsCalculatorCollectionViewCell.self, forCellWithReuseIdentifier: String(describing: ButtonsCalculatorCollectionViewCell.self))

        return collection
    }
    
    // MARK: - Layout Views
    private func addViews() {
        addSubview(contentView)
        contentView.addSubview(screenInputView)
        contentView.addSubview(buttonsCollectionView)
    }
    
    private func addConstraints() {
        contentView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        screenInputView.snp.makeConstraints { (make) in
            make.top.greaterThanOrEqualTo(contentView).offset(DSSetings.Margin.xxBig)
            make.leading.trailing.equalTo(contentView).inset(DSSetings.Margin.medium)
            make.height.equalTo(DSSetings.Height.big)
        }
        
        buttonsCollectionView.snp.makeConstraints { (make) in
            make.top.equalTo(screenInputView.snp.bottom).offset(DSSetings.Margin.small)
            make.leading.trailing.bottom.equalTo(contentView).inset(DSSetings.Margin.medium)
            make.height.equalTo(UIScreen.main.bounds.height * 0.6)
        }
    }
}
