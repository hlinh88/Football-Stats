//
//  NewsViewController.swift
//  FootballStats
//
//  Created by Hoang Linh Nguyen on 1/10/2023.
//

import UIKit
import Alamofire
import RxSwift
import RxCocoa
import Reusable

final class NewsViewController: UIViewController, BindableType {
    @IBOutlet private weak var logoImageView: UIImageView!
    @IBOutlet private weak var newsCollectionView: UICollectionView!

    var viewModel: NewsViewModel!
    private let disposeBag = DisposeBag()
    private let noOfCellsInRow = Constants.noOfCellsInRow

    override func viewDidLoad() {
        super.viewDidLoad()
        logoImageView.image = Assets.leagueLogo.image
        newsCollectionView.delegate = self
        registerCell()
    }

    private func registerCell() {
        self.newsCollectionView.register(cellType: NewsCollectionViewCell.self)
    }

    func bindViewModel() {
        let loadTrigger = Driver.just(())

        let input = NewsViewModel.Input(loadTrigger: loadTrigger)
    
        let output = viewModel.transform(input, disposeBag: disposeBag)

        output.news
            .drive(newsCollectionView.rx.items) { collectionView, row, new in
                let indexPath = IndexPath(row: row, section: 0)
                let cell = collectionView.dequeueReusableCell(for: indexPath, cellType: NewsCollectionViewCell.self)
                cell.configCell(thisNew: new)
                return cell
            }
            .disposed(by: disposeBag)

        output.indicator
            .drive(rx.isLoading)
            .disposed(by: disposeBag)
    }
}

extension NewsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, 
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {

        guard let flowLayout = collectionViewLayout as? UICollectionViewFlowLayout else { return CGSize() }

        let totalSpace = flowLayout.sectionInset.left
        + flowLayout.sectionInset.right
        + (flowLayout.minimumInteritemSpacing * CGFloat(noOfCellsInRow - 1))

        let size = Int((collectionView.bounds.width - totalSpace) / CGFloat(noOfCellsInRow))
        if indexPath.row == 0 {
            return CGSize(width: size * 2,
                          height: Constants.newsCellHeight + Constants.newsCellExtraHeight)
        }
        return CGSize(width: size, height: Constants.newsCellHeight)
    }
}
