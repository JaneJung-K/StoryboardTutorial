//
//  TodayADView.swift
//  StoryBoardTutorial
//
//  Created by Leah on 2022/04/02.
//

import UIKit
import SnapKit
/*
 0일 때 0
 1일 때 141
 2일 때 253
 */

protocol TodayADViewDelegate: AnyObject {
    func todayADViewDelegate(size: CGFloat)
}

class TodayADView: UIView {
    weak var delegate: TodayADViewDelegate?
    
    lazy var todayHeaderView = TodayADHeaderView()
    
    let colors:[UIColor] = []
//    let colors:[UIColor] = [.cyan, .orange]
//    let colors:[UIColor] = [.cyan]
    
    var todayADViewHeight: CGFloat = 0
    
    private lazy var todayTable:UITableView = {
       let table = UITableView()
        
        table.register(TodayADTableViewCell.self, forCellReuseIdentifier: TodayADTableViewCell.identifier)
        table.separatorStyle = .none
        table.rowHeight = 80

        table.delegate = self
        table.dataSource = self
        
        return table
    }()

    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        addSubview(todayHeaderView)
        addSubview(todayTable)
        todayHeaderView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(18)
            make.leading.equalToSuperview().inset(12)
            make.trailing.equalToSuperview().offset(2)
            make.height.equalTo(61)
        }
        todayTable.snp.makeConstraints { make in
            make.top.equalTo(todayHeaderView.snp.bottom).offset(0)
            make.leading.equalToSuperview().inset(12)
            make.trailing.equalToSuperview().inset(16)
            make.bottom.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if colors.count == 0 {
            todayHeaderView.isHidden = true
        }
    }
}

extension TodayADView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch colors.count {
        case 0:
            todayADViewHeight = 0
        case 1:
            todayADViewHeight = 157
        case 2:
            todayADViewHeight = 237
        default:
            break
        }
        
        self.delegate?.todayADViewDelegate(size: todayADViewHeight)
        
        let cell = tableView.dequeueReusableCell(withIdentifier: TodayADTableViewCell.identifier, for: indexPath) as! TodayADTableViewCell
        cell.contentView.backgroundColor = colors[indexPath.row]
        // 선택시 아무반응도 없음
        cell.selectionStyle = .none
        
        // 마지막 셀일 경우 하단에 하얀색 보더추가
        if tableView.isLast(for: indexPath) {
            DispatchQueue.main.async {
                cell.addAboveTheBottomBorderWithColor(color: .white)
            }
        }
        
        return cell
    }
    
}

public extension UIView {
    func addBottomBorderWithColor(color: UIColor) {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height, width: self.frame.size.width, height: 1)
        self.layer.addSublayer(border)
    }

    func addAboveTheBottomBorderWithColor(color: UIColor) {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height - 1, width: self.frame.size.width, height: 1)
        self.layer.addSublayer(border)
    }
}
