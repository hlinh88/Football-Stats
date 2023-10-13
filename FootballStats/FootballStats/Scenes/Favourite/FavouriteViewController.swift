//
//  FavouriteViewController.swift
//  FootballStats
//
//  Created by Hoang Linh Nguyen on 1/10/2023.
//

import UIKit
import Reusable
import RxSwift
import RxCocoa

final class FavouriteViewController: UIViewController, BindableType {
    @IBOutlet private weak var favouriteTableView: UITableView!

    var viewModel: FavouriteViewModel!
    private let disposeBag = DisposeBag()
    private let loadTrigger = PublishSubject<Void>()
    private let deleteTrigger = PublishSubject<Int>()
    private let selectTrigger = PublishSubject<Int>()

    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadTrigger.onNext(())
    }

    private func registerCell() {
        favouriteTableView.do {
            $0.register(cellType: FavouriteTableViewCell.self)
        }
    }

    func bindViewModel() {
        let input = FavouriteViewModel.Input(
            loadTrigger: loadTrigger.asDriver(onErrorJustReturn: ()),
            deleteTrigger: deleteTrigger.asDriver(onErrorDriveWith: .empty()),
            selectTrigger: selectTrigger.asDriver(onErrorDriveWith: .empty())
        )
        let output = viewModel.transform(input, disposeBag: disposeBag)

        output.favouritePlayers
            .drive(favouriteTableView.rx.items) { tableView, index, favourite in
                let indexPath = IndexPath(item: index, section: 0)
                let cell = tableView.dequeueReusableCell(for: indexPath, cellType: FavouriteTableViewCell.self).then {
                    $0.configCell(thisFavourite: favourite)
                    $0.delegate = self
                }
                return cell
            }
            .disposed(by: disposeBag)

        output.deleteFavourite
            .drive()
            .disposed(by: disposeBag)

        output.indicator
            .drive(rx.isLoading)
            .disposed(by: disposeBag)
    }
}

extension FavouriteViewController: FavouriteTableViewCellDelegate {
    func handleRemoveButton(sender: UIButton, id: Int) {
        deleteTrigger.onNext(id)
        loadTrigger.onNext(())
    }

    func handleFavouriteView(sender: UITapGestureRecognizer, id: Int) {
        selectTrigger.onNext(id)
    }
}
