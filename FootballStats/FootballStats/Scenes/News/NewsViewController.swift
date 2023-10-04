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

final class NewsViewController: UIViewController {

    @IBOutlet private weak var logoImageView: UIImageView!
    @IBOutlet private weak var newsCollectionView: UICollectionView!

    private let newsViewModel = NewsViewModel()
    private let newsRepository = NewsRepositoryImpl()
    private let disposeBag = DisposeBag()
    private let noOfCellsInRow = 2

    override func viewDidLoad() {
        super.viewDidLoad()
        getNews()
        logoImageView.image = ImageAssets.leagueLogo.image
        newsCollectionView.delegate = self
        registerCell()
        bindingCollectionView()
    }

    func getNews() {
        newsRepository.requestNews(completion: { (news: [News]?, error: Error?) in
            if error != nil {
                guard let errorMessage = error?.localizedDescription else { return }
                print(errorMessage)
            } else {
                guard let news else { return }
                self.newsViewModel.news.accept(self.newsViewModel.news.value + news)
            }
        })
    }

    private func registerCell() {
        let nib = UINib(nibName: String(describing: NewsCollectionViewCell.self), bundle: nil)
        self.newsCollectionView.register(nib, forCellWithReuseIdentifier: NewsCollectionViewCell.identifier)
    }

    private func bindingCollectionView() {
        newsViewModel.news.asDriver()
            .drive(newsCollectionView.rx.items) { collectionView, row, new in
                let indexPath = IndexPath(row: row, section: 0)
                guard let cell =
                        collectionView.dequeueReusableCell(withReuseIdentifier: NewsCollectionViewCell.identifier, for: indexPath) as? NewsCollectionViewCell
                else { return UICollectionViewCell() }
                cell.configCell(thisNew: new)
                return cell
            }
            .disposed(by: disposeBag)
    }
}

extension NewsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
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
