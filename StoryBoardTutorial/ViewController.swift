//
//  ViewController.swift
//  StoryBoardTutorial
//
//  Created by Leah on 2022/04/02.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var customView1: UIView!
    @IBOutlet weak var customViewHeight: NSLayoutConstraint!
    
    private var todayADView = TodayADView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        todayADView.delegate = self
        customView1.addSubview(todayADView)
        todayADView.snp.remakeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            // 여기서 지정해주는 높이와 상관없이 delegate 함수에서 customView1의 높이가 결정됨
            make.height.equalTo(400)
        }
    }
}

extension ViewController: TodayADViewDelegate {
    func todayADViewDelegate(size: CGFloat) {
        customViewHeight.constant = size
    }
    
    
}

