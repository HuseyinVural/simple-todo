//
//  IndicatorView.swift
//  Do
//
//  Created by Hüseyin Vural on 26.05.2020.
//  Copyright © 2020 Hüseyin Vural. All rights reserved.
//

import UIKit

class IndicatorView: UIView {
  private var shapeLayer = CAShapeLayer()
  
  var fillColor: UIColor = .orangeish {
    didSet {
      shapeLayer.fillColor = fillColor.cgColor
    }
  }
  
  override init(frame: CGRect = .zero) {
    super.init(frame: frame)
    configure()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    configure()
  }
  
  private func configure() {
    shapeLayer.fillColor = fillColor.cgColor
    layer.addSublayer(shapeLayer)
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    let path = UIBezierPath()
    path.move(to: CGPoint(x: bounds.width / 2, y: 0))
    path.addLine(to: CGPoint(x: 0, y: bounds.height))
    path.addLine(to: CGPoint(x: bounds.width, y: bounds.height))
    shapeLayer.path = path.cgPath
  }
}
