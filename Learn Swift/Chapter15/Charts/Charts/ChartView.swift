//
//  ChartView.swift
//  Charts
//
//  Created by Waqar A. Malik on 11/30/14.
//  Copyright (c) 2014 Apress, Inc. All rights reserved.
//

import UIKit

protocol ChartViewDataSource {
    func numberOfDataPoints() -> Int
    func valueOfPointAtIndex(index : Int) -> Double
}

class ChartView: UIView {
    var dataSource : ChartViewDataSource? = nil
    
    override func drawRect(rect: CGRect) {
        let dataCount = self.dataSource?.numberOfDataPoints()
        if(dataCount > 0)
        {
            let step : CGFloat = CGRectGetWidth(self.frame) / CGFloat(dataCount!)
            for index 0..dataCount! {
                
            }
        }
    }
}
