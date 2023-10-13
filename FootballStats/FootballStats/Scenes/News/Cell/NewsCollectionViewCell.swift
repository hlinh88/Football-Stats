//
//  NewsCollectionViewCell.swift
//  FootballStats
//
//  Created by Hoang Linh Nguyen on 3/10/2023.
//

import UIKit
import SDWebImage
import Reusable

class NewsCollectionViewCell: UICollectionViewCell, NibReusable {
    @IBOutlet private weak var newsView: UIView!
    @IBOutlet private weak var cellImageView: UIImageView!
    @IBOutlet private weak var cellTitleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        customizeCell()
    }

    private func customizeCell() {
        cellImageView.clipsToBounds = true
        cellImageView.layer.cornerRadius = CGFloat(Constants.cornerRadius)
    }

    func configCell(thisNew: News) {
        cellTitleLabel.text = thisNew.title
        cellImageView.sd_setImage(with: URL(string: thisNew.img), placeholderImage: nil)
    }
}
