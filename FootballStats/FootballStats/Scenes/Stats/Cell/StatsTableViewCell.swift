//
//  StatsTableViewCell.swift
//  FootballStats
//
//  Created by Hoang Linh Nguyen on 9/10/2023.
//

import UIKit
import Reusable

final class StatsTableViewCell: UITableViewCell, NibReusable {
    @IBOutlet private weak var positionLabel: UILabel!
    @IBOutlet private weak var valueLabel: UILabel!
    @IBOutlet private weak var clubImageView: UIImageView!
    @IBOutlet private weak var playerNameLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configCell(thisStat: Stats, index: Int) {
        positionLabel.text = String(index + 1)
        playerNameLabel.text = thisStat.player.name
        guard let statistic = thisStat.statistics[safe: 0] else { return }
        clubImageView.sd_setImage(with: URL(string: statistic.team.logo), placeholderImage: nil)
        valueLabel.text = String(statistic.goals.total)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
