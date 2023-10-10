//
//  DetailViewController.swift
//  FootballStats
//
//  Created by Hoang Linh Nguyen on 10/10/2023.
//

import UIKit
import RxSwift
import RxCocoa

final class DetailViewController: UIViewController, BindableType {
    @IBOutlet private weak var backButton: UIButton!
    @IBOutlet private weak var playerNameTitleLabel: UILabel!
    @IBOutlet private weak var playerNameLabel: UILabel!
    @IBOutlet private weak var positionLabel: UILabel!
    @IBOutlet private weak var clubImageView: UIImageView!
    @IBOutlet private weak var playerImageView: UIImageView!
    @IBOutlet private weak var nationalityLabel: UILabel!
    @IBOutlet private weak var dobLabel: UILabel!
    @IBOutlet private weak var ageLabel: UILabel!
    @IBOutlet private weak var heightLabel: UILabel!
    @IBOutlet private weak var weightLabel: UILabel!
    @IBOutlet private weak var recordCollectionView: UICollectionView!

    var viewModel: DetailViewModel!
    private let disposeBag = DisposeBag()
    private let noOfCellsInRow = Constants.noOfCellsInRow

    override func viewDidLoad() {
        super.viewDidLoad()
        recordCollectionView.delegate = self
        registerCell()
    }

    private func registerCell() {
        self.recordCollectionView.register(cellType: DetailCollectionViewCell.self)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }

    func bindViewModel() {
        let input = DetailViewModel.Input(
            loadTrigger: Driver.just(()),
            backTrigger: backButton.rx.tap.asDriver()
        )
        let output = viewModel.transform(input, disposeBag: disposeBag)

        output.stats
            .drive(statsBinding)
            .disposed(by: disposeBag)

        output.records
            .drive(recordCollectionView.rx.items) { collectionView, row, record in
                let indexPath = IndexPath(row: row, section: 0)
                let cell = collectionView.dequeueReusableCell(for: indexPath, cellType: DetailCollectionViewCell.self)
                cell.configCell(thisRecord: record, index: row)
                return cell
            }
            .disposed(by: disposeBag)

        output.indicator
            .drive(rx.isLoading)
            .disposed(by: disposeBag)
    }
}

extension DetailViewController {
    private var statsBinding: Binder<Stats> {
        return Binder(self) { viewController, stat in
            viewController.do {
                $0.playerNameTitleLabel.text = stat.player.name
                $0.playerNameLabel.text = stat.player.name
                $0.nationalityLabel.text = stat.player.nationality
                $0.playerImageView.sd_setImage(with: URL(string: stat.player.photo), completed: nil)
                $0.dobLabel.text = stat.player.birth.date
                $0.ageLabel.text = String(stat.player.age)
                $0.heightLabel.text = stat.player.height
                $0.weightLabel.text = stat.player.weight
                if let statistics = stat.statistics[safe: 0] {
                    $0.positionLabel.text = statistics.games.position
                    $0.clubImageView.sd_setImage(with: URL(string: statistics.team.logo), completed: nil)
                }
            }
        }
    }
}

extension DetailViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {

        guard let flowLayout = collectionViewLayout as? UICollectionViewFlowLayout else { return CGSize() }

        let totalSpace = flowLayout.sectionInset.left
        + flowLayout.sectionInset.right
        + (flowLayout.minimumInteritemSpacing * CGFloat(noOfCellsInRow - 1))

        let size = Int((collectionView.bounds.width - totalSpace) / CGFloat(noOfCellsInRow))
        return CGSize(width: size, height: size)
    }
}
