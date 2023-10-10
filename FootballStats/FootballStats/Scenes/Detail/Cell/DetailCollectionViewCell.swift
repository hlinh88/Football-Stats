//
//  DetailCollectionViewCell.swift
//  FootballStats
//
//  Created by Hoang Linh Nguyen on 11/10/2023.
//

import UIKit
import Reusable

final class DetailCollectionViewCell: UICollectionViewCell, NibReusable {
    @IBOutlet private weak var detailView: UIView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var valueLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        customizeCell()
    }

    private func customizeCell() {
        detailView.layer.cornerRadius = CGFloat(Constants.cornerRadius)
    }

    func configCell(thisRecord: String, index: Int) {
        let record = RecordsType(rawValue: index)
        titleLabel.text = record?.title
        valueLabel.text = thisRecord
    }
}
