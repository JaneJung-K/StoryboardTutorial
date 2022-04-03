//
//  TodayADHeaderView.swift
//  StoryBoardTutorial
//
//  Created by Leah on 2022/04/02.
//

import UIKit

class TodayADHeaderView: UIView {

    private lazy var lblToday: UILabel = {
       let label = UILabel()
        label.text = "오늘의 추천 상품"
        return label
    }()
    
    private lazy var imgAD: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "")
        return image
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        addSubview(lblToday)
        lblToday.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(18)
            make.leading.equalToSuperview().inset(12)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        lblToday.sizeToFit()
    }
}
