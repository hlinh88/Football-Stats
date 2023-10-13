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
    @IBOutlet private weak var followButton: UIButton!
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
    var isFollow = false
    private var id: Int?
    private var thisStat: Stats?
    private let saveFavouriteTrigger = PublishSubject<Stats>()
    private let deleteFavouriteTrigger = PublishSubject<Int>()

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
            backTrigger: backButton.rx.tap.asDriver(),
            saveFavouriteTrigger: saveFavouriteTrigger.asDriver(onErrorDriveWith: .empty()),
            deleteFavouriteTrigger: deleteFavouriteTrigger.asDriver(onErrorDriveWith: .empty())
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

        output.isFollow
            .drive(followButtonBinding)
            .disposed(by: disposeBag)

        output.saveFavourite
            .drive()
            .disposed(by: disposeBag)

        output.deleteFavourite
            .drive()
            .disposed(by: disposeBag)

        output.indicator
            .drive(rx.isLoading)
            .disposed(by: disposeBag)
    }

    @IBAction func handleFollowButton(_ sender: UIButton) {
        guard let id = self.id,
              let thisStat = self.thisStat else { return }
        isFollow ? deleteFavouriteTrigger.onNext(id) : saveFavouriteTrigger.onNext(thisStat)
        isFollow.toggle()
        self.configFollowButton()
    }
}

extension DetailViewController {
    private var statsBinding: Binder<Stats> {
        return Binder(self) { viewController, stat in
            viewController.do {
                $0.id = stat.player.id
                $0.thisStat = stat
                $0.followButton.layer.cornerRadius = CGFloat(Constants.cornerRadius)
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

    private var followButtonBinding: Binder<Bool> {
        return Binder(self) { viewController, isFollow in
            viewController.do {
                $0.isFollow = isFollow
                $0.configFollowButton()
            }
        }
    }

    private func configFollowButton() {
        self.do {
            $0.followButton.backgroundColor = isFollow ? UIColor.lightGray : Assets.mainColor.color
            $0.followButton.setTitle(isFollow ? "Following" : "Follow", for: .normal)
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
