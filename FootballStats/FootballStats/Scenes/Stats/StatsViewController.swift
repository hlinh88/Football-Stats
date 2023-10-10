//
//  StatsViewController.swift
//  FootballStats
//
//  Created by Hoang Linh Nguyen on 1/10/2023.
//

import UIKit
import RxSwift
import RxCocoa
import Reusable

final class StatsViewController: UIViewController, BindableType {
    @IBOutlet private weak var statsTableView: UITableView!
    @IBOutlet private weak var statsCollectionView: UICollectionView!
    
    var viewModel: StatsViewModel!
    private let disposeBag = DisposeBag()
    private let noOfCellsInRow = Constants.noOfCellsInRow

    override func viewDidLoad() {
        super.viewDidLoad()
        statsCollectionView.delegate = self
        registerCell()
    }

    private func registerCell() {
        self.statsTableView.register(cellType: StatsTableViewCell.self)
        self.statsCollectionView.register(cellType: StatsCollectionViewCell.self)
    }

    func bindViewModel() {
        let input = StatsViewModel.Input(
            loadTrigger: Driver.just(()),
            selectTrigger: statsTableView.rx.itemSelected.asDriver()
        )

        let output = viewModel.transform(input, disposeBag: disposeBag)

        output.topscorers
            .drive(statsTableView.rx.items) { tableView, index, stat in
                let indexPath = IndexPath(item: index, section: 0)
                let cell = tableView.dequeueReusableCell(for: indexPath, cellType: StatsTableViewCell.self)
                cell.configCell(thisStat: stat, index: index)
                return cell
            }
            .disposed(by: disposeBag)

        output.topFour
            .asDriver()
            .drive(statsCollectionView.rx.items) { collectionView, row, stat in
                let indexPath = IndexPath(row: row, section: 0)
                let cell = collectionView.dequeueReusableCell(for: indexPath, cellType: StatsCollectionViewCell.self)
                cell.configCell(thisStat: stat, index: row)
                return cell
            }
            .disposed(by: disposeBag)

        output.indicator
            .drive(rx.isLoading)
            .disposed(by: disposeBag)
    }
}

extension StatsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, 
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {

        guard let flowLayout = collectionViewLayout as? UICollectionViewFlowLayout else { return CGSize() }

        let totalSpace = flowLayout.sectionInset.left
        + flowLayout.sectionInset.right
        + (flowLayout.minimumInteritemSpacing * CGFloat(noOfCellsInRow - 1))

        let size = Int((collectionView.bounds.width - totalSpace) / CGFloat(noOfCellsInRow))
        return CGSize(width: size, height: Constants.statsCellHeight)
    }
}
