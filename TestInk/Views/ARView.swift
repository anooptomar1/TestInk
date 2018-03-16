//
//  ARView.swift
//  TestInk
//
//  Created by C4Q on 3/14/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit

class ARView: UIView {

    lazy var saveButton: UIButton = {
        let button = UIButton()
        button.layer.borderWidth = 0.6
        button.layer.borderColor = UIColor.black.cgColor
        button.setTitleColor(.black, for: .normal)
        button.setTitle("Save", for: .normal)
        let font = UIFont(name: "HelveticaNeue-Medium", size: 15.0)
        button.titleLabel?.font = font
        button.setImage(UIImage(named:"icons8-save-24"), for: .normal)
        return button
    }()
    lazy var dismissButton: UIButton = {
      let button = UIButton()
      button.setImage(UIImage(named: "dismissButtonIcon"), for: .normal)
      return button 
    }()
    
    //Just a regular view for now, until we figure out AR stuff
    lazy var ARView: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        return view
    }()
    
    lazy var captureButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 160, y: 100, width: 50, height: 50))
        
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 2
        
        button.setImage(UIImage(named:"icons8-camera-32"), for: .normal)
        return button
    }()
    
    lazy var segmentedControl: UISegmentedControl = {
        let items = ["AR ON", "AR Off"]
        let sc = UISegmentedControl(items: items)
        return sc
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        captureButton.layer.masksToBounds = true
        captureButton.layer.cornerRadius = captureButton.frame.width/2
    }
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        backgroundColor = .white
        setupViews()
    }
    
    private func setupViews() {
        setupSaveButton()
        setupDismissButton()
        setupARView()
        setupCaptureButton()
        setupSegmentedControl()
    }
    
    private func setupSaveButton() {
        self.addSubview(saveButton)
        saveButton.snp.makeConstraints { (make) in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(15)
            make.trailing.equalTo(safeAreaLayoutGuide.snp.trailing).offset(-8)
            make.width.equalTo(safeAreaLayoutGuide.snp.width).multipliedBy(0.3)
            make.height.equalTo(saveButton.snp.width).multipliedBy(0.35)
            
        }
    }
    
    private func setupDismissButton() {
        addSubview(dismissButton)
        dismissButton.snp.makeConstraints { (make) in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(15)
            make.leading.equalTo(safeAreaLayoutGuide.snp.leading).offset(8)
            make.width.equalTo(saveButton.snp.width).multipliedBy(0.7)
            make.height.equalTo(saveButton.snp.height)
        }
    }
    
    private func setupARView() {
        self.addSubview(ARView)
        ARView.snp.makeConstraints { (make) in
            make.top.equalTo(saveButton.snp.bottom).offset(4)
            make.leading.equalTo(safeAreaLayoutGuide.snp.leading)
            make.trailing.equalTo(safeAreaLayoutGuide.snp.trailing)
            make.height.equalTo(ARView.snp.width).multipliedBy(1.1)
        }
    }
    
    private func setupCaptureButton() {
        self.addSubview(captureButton)
        captureButton.snp.makeConstraints { (make) in
            make.top.equalTo(ARView.snp.bottom).offset(16)
            make.width.equalTo(ARView.snp.width).multipliedBy(0.19)
            make.height.equalTo(captureButton.snp.width)
            make.centerX.equalTo(safeAreaLayoutGuide.snp.centerX)
            
        }
    }
    
    private func setupSegmentedControl() {
        self.addSubview(segmentedControl)
        segmentedControl.snp.makeConstraints { (make) in
            make.top.equalTo(captureButton.snp.bottom).offset(25)
            //make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).offset(-10)
            make.width.equalTo(safeAreaLayoutGuide.snp.width)
            make.height.equalTo(safeAreaLayoutGuide.snp.height).multipliedBy(0.060)
        }
    }

}
