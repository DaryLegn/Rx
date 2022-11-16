//
//  ViewController.swift
//  DariaMVVM+RX
//

import UIKit
import RxSwift
import RxCocoa

final class ViewController: UIViewController {

    // MARK: - Properties
    @IBOutlet weak var tableView: UITableView!
    private let viewModel = ViewModel()
    private let disposeBag = DisposeBag()

    // MARK: - View Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 80

        viewModel.getUserRequest()
        setupBinding()
    }

    // MARK: - Bindings
    private func setupBinding(){
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")

        self.viewModel.users.asObservable()
            .bind(to: self.tableView.rx.items(cellIdentifier: "TableViewCell", cellType: TableViewCell.self)) { (row, user, cell) in
                cell.configure(with: user)
            }.disposed(by: self.disposeBag)
    }
}
