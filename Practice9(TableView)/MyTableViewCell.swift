//
//  MyTableViewCell.swift
//  Practice9(TableView)
//
//  Created by Yernur Adilbek on 11/4/23.
//

import UIKit

class MyTableViewCell: UITableViewCell {

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .systemGray
        return label
    }()
    
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 13)
        label.textColor = .systemGray
        return label
    }()
    
    private lazy var dateIcon: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "clock"))
        imageView.tintColor = .black
        return imageView
    }()
    
    private lazy var statusIcon: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "exclamationmark.circle.fill"))
        return imageView
    }()
    
    private lazy var statusLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13)
        return label
    }()
    
    private lazy var detailIcon: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "arrow.right.to.line.square.fill"))
        imageView.tintColor = .systemOrange
        return imageView
    }()
    
    private lazy var detailLabel: UILabel = {
        let label = UILabel()
        label.text = "Detail"
        label.font = UIFont.systemFont(ofSize: 13)
        return label
    }()
    
    private lazy var statusBack: UIView = {
        let view = UIView()
//        view.clipsToBounds = true
//        view.layer.cornerRadius = 15
        return view
    }()
    
    private lazy var grayBack: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray6
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(test: String, date: String, status: String){
        titleLabel.text = test
        dateLabel.text = date
        statusLabel.text = status
        
        if status == "Completed"{
            statusBack.backgroundColor = .systemBlue
            statusIcon.tintColor = .systemBlue
        }else{
            statusBack.backgroundColor = .systemRed
            statusIcon.tintColor = .systemRed
        }
    }
}

// MARK: - setting iui methods
private extension MyTableViewCell {
    func setupUI() {
        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        addSubview(statusBack)
        addSubview(titleLabel)
        addSubview(dateIcon)
        addSubview(dateLabel)
        
        addSubview(grayBack)
        grayBack.addSubview(statusIcon)
        grayBack.addSubview(statusLabel)
        grayBack.addSubview(detailIcon)
        grayBack.addSubview(detailLabel)
    }
    
    func setupConstraints() {
        statusBack.snp.makeConstraints { make in
            make.leading.top.bottom.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.03)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.leading.equalTo(statusBack.snp.trailing).offset(10)
            make.top.equalToSuperview().offset(10)
        }
        
        dateIcon.snp.makeConstraints { make in
            make.leading.equalTo(statusBack.snp.trailing).offset(10)
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
        }
        
        dateLabel.snp.makeConstraints { make in
            make.leading.equalTo(dateIcon.snp.trailing).offset(5)
            make.centerY.equalTo(dateIcon)
        }
        
        grayBack.snp.makeConstraints { make in
            make.leading.equalTo(statusBack.snp.trailing).offset(10)
            make.top.equalTo(dateIcon.snp.bottom).offset(5)
            make.width.equalTo(contentView.snp.width).multipliedBy(0.9)
            make.height.equalTo(contentView.snp.height).multipliedBy(0.25)
        }
        
        statusIcon.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(5)
            make.centerY.equalToSuperview()
        }
        
        statusLabel.snp.makeConstraints { make in
            make.leading.equalTo(statusIcon.snp.trailing).offset(5)
            make.centerY.equalToSuperview()
        }
        
        detailIcon.snp.makeConstraints { make in
            make.leading.equalTo(grayBack.snp.centerX)
            make.centerY.equalToSuperview()
        }
        
        detailLabel.snp.makeConstraints { make in
            make.leading.equalTo(detailIcon.snp.trailing)
            make.centerY.equalToSuperview()
        }
    }
}
