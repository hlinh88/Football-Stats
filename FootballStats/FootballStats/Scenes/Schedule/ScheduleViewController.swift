//
//  ScheduleViewController.swift
//  FootballStats
//
//  Created by Hoang Linh Nguyen on 3/10/2023.
//

import UIKit
import RxSwift
import RxCocoa
import Reusable
import Then

final class ScheduleViewController: UIViewController, BindableType {
    @IBOutlet private weak var matchWeekView: UIView!
    @IBOutlet private weak var scheduleTableView: UITableView!
    @IBOutlet private weak var matchWeekLabel: UILabel!

    var viewModel: ScheduleViewModel!
    private let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        customizeView()
        registerCell()
    }

    private func registerCell() {
        self.scheduleTableView.register(cellType: ScheduleTableViewCell.self)
    }

    func bindViewModel() {
        let loadTrigger = Driver.just(())

        let input = ScheduleViewModel.Input(loadTrigger: loadTrigger)

        let output = viewModel.transform(input, disposeBag: disposeBag)

        output.schedules
            .drive(scheduleTableView.rx.items) { tableView, index, schedule in
                let indexPath = IndexPath(item: index, section: 0)
                let cell = tableView.dequeueReusableCell(for: indexPath, cellType: ScheduleTableViewCell.self)
                cell.configCell(thisSchedule: schedule)
                return cell
            }.disposed(by: disposeBag)

        output.indicator
            .drive(rx.isLoading)
            .disposed(by: disposeBag)
    }

    private func customizeView() {
        let gradient = CAGradientLayer().then {
            $0.colors = [Assets.gradientBlue1.color.cgColor,
                         Assets.gradientBlue2.color.cgColor,
                         Assets.gradientBlue3.color.cgColor,
                         Assets.gradientBlue4.color.cgColor]
            $0.locations = [0.0, 1.0]
            $0.startPoint = CGPoint(x: 0, y: 0.5)
            $0.endPoint = CGPoint(x: 1, y: 0.5)
            $0.frame = matchWeekView.bounds
            $0.cornerRadius = CGFloat(Constants.cornerRadius)
            $0.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        }

        matchWeekView.do {
            $0.layer.insertSublayer(gradient, at: 0)
            $0.layer.cornerRadius = CGFloat(Constants.cornerRadius)
            $0.clipsToBounds = true
            $0.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        }
    }
}
