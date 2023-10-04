//
//  StandingViewController.swift
//  FootballStats
//
//  Created by Hoang Linh Nguyen on 1/10/2023.
//

import UIKit
import RxSwift
import RxCocoa
import Reusable

final class StandingViewController: UIViewController, BindableType {
    @IBOutlet private weak var standingTableView: UITableView!

    var viewModel: StandingViewModel!
    private let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
    }

    private func registerCell() {
        self.standingTableView.register(cellType: StandingTableViewCell.self)
    }

    func bindViewModel() {
        let loadTrigger = Driver.just(())

        let input = StandingViewModel.Input(loadTrigger: loadTrigger)

        let output = viewModel.transform(input, disposeBag: disposeBag)

        output.standings
            .drive(standingTableView.rx.items) { tableView, index, standing in
                let indexPath = IndexPath(item: index, section: 0)
                let cell = tableView.dequeueReusableCell(for: indexPath, cellType: StandingTableViewCell.self)
                cell.configCell(thisStanding: standing)
                return cell
            }.disposed(by: disposeBag)
    }
}
