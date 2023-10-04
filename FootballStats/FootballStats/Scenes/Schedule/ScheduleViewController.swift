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
    }

    private func customizeView() {
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.colors = [Assets.gradient1.color.cgColor,
                           Assets.gradient2.color.cgColor,
                           Assets.gradient3.color.cgColor,
                           Assets.gradient4.color.cgColor]
        gradient.locations = [0.0, 1.0]
        gradient.startPoint = CGPoint(x: 0, y: 0.5)
        gradient.endPoint = CGPoint(x: 1, y: 0.5)
        gradient.frame = matchWeekView.bounds
        matchWeekView.layer.insertSublayer(gradient, at: 0)
        gradient.cornerRadius = CGFloat(Constants.cornerRadius)
        gradient.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        matchWeekView.layer.cornerRadius = CGFloat(Constants.cornerRadius)
        matchWeekView.clipsToBounds = true
        matchWeekView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
    }
}
