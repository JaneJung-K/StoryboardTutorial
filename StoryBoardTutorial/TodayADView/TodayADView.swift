//
//  TodayADView.swift
//  StoryBoardTutorial
//
//  Created by Leah on 2022/04/02.
//

import UIKit

class TodayADView: UIView {
    private lazy var todayTable:UITableView = {
       let table = UITableView()
        
        return table
    }()

    override init(frame: CGRect) {
        super.init(frame: .zero)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
