//
//  StatsCollectionViewCell.swift
//  FootballStats
//
//  Created by Hoang Linh Nguyen on 9/10/2023.
//

import UIKit
import SDWebImage
import Reusable
import Then

final class StatsCollectionViewCell: UICollectionViewCell, NibReusable {
    @IBOutlet private weak var topView: UIView!
    @IBOutlet private weak var bottomView: UIView!
    @IBOutlet private weak var statsTitleLabel: UILabel!
    @IBOutlet private weak var valueLabel: UILabel!
    @IBOutlet private weak var playerImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configCell(thisStat: Stats, index: Int) {
        let stat = StatsType(rawValue: index)
        statsTitleLabel.text = stat?.title
        valueLabel.text = stat?.getValue(thisStat: thisStat)
        guard let colors = stat?.gradientColors else { return }
        customizeCell(colors: colors)
        playerImageView.sd_setImage(with: URL(string: thisStat.player.photo), placeholderImage: nil)
    }

    private func customizeCell(colors: [Any]) {
        topView.do {
            $0.layer.cornerRadius = CGFloat(Constants.cornerRadius)
            $0.layer.masksToBounds = true
            $0.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        }

        let gradient = CAGradientLayer().then {
            $0.colors = colors
            $0.locations = [0.0, 1.0]
            $0.startPoint = CGPoint(x: 0, y: 0.5)
            $0.endPoint = CGPoint(x: 1, y: 0.5)
            $0.frame = bottomView.bounds
        }
        
        bottomView.do {
            $0.layer.cornerRadius = CGFloat(Constants.cornerRadius)
            $0.layer.masksToBounds = true
            $0.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
            $0.layer.insertSublayer(gradient, at: 0)
            $0.clipsToBounds = true
        }
    }
}
