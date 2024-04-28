//
//  ViewController.swift
//  Practice9(TableView)
//
//  Created by Yernur Adilbek on 11/4/23.
//
import SnapKit
import UIKit

class ViewController: UIViewController {
    
    let tests = ["Test Competition 1", "Test Competition 2","Test Competition 3","Test Competition 4","Test Competition 5","Test Competition 6","Test Competition 7","Test Competition 8","Test Competition 9","Test Competition 10","Test Competition 11","Test Competition 12","Test Competition 13","Test Competition 14","Test Competition 15"]
    
    let dates = ["2018-03-21 - 2018-04-17", "2018-03-21 - 2018-04-17","2018-03-21 - 2018-04-17","2018-03-21 - 2018-04-17","2018-03-21 - 2018-04-17","2018-03-21 - 2018-04-17","2018-03-21 - 2018-04-17","2018-03-21 - 2018-04-17","2018-03-21 - 2018-04-17","2018-03-21 - 2018-04-17","2018-03-21 - 2018-04-17","2018-03-21 - 2018-04-17","2018-03-21 - 2018-04-17","2018-03-21 - 2018-04-17","2018-03-21 - 2018-04-17","2018-03-21 - 2018-04-17"]
    
    let status = ["27 days left", "20 days left", "13 days left", "5 days left", "30 days left", "3 days left", "2 months left", "15 days left", "2 weeks left", "Completed", "Completed", "Completed", "Completed", "Completed", "Completed"]
    
    private lazy var tableView: UITableView = {
        let view = UITableView()
        view.register(MyTableViewCell.self, forCellReuseIdentifier: "MyTableViewCell")
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupUI()
        
        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        (view.window?.windowScene?.screen.bounds.height ?? 0) * 0.13
    }
}

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tests.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyTableViewCell", for: indexPath) as! MyTableViewCell
        cell.configure(test: tests[indexPath.row], date: dates[indexPath.row], status: status[indexPath.row])
        cell.layer.cornerRadius = 5
        cell.clipsToBounds = true
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

// MARK: - setting iui methods
private extension ViewController {
    func setupUI() {
        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        view.addSubview(tableView)
    }
    
    func setupConstraints() {
        tableView.snp.makeConstraints { make in
            make.top.bottom.equalTo(view.safeAreaLayoutGuide)
            make.leading.trailing.equalTo(view).inset(10)
        }
    }
}
