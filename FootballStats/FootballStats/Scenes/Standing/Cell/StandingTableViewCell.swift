//
//  StandingTableViewCell.swift
//  FootballStats
//
//  Created by Hoang Linh Nguyen on 4/10/2023.
//

import UIKit
import SDWebImage
import Reusable

final class StandingTableViewCell: UITableViewCell, NibReusable {
    @IBOutlet private weak var rankLabel: UILabel!
    @IBOutlet private weak var teamImageView: UIImageView!
    @IBOutlet private weak var teamNameLabel: UILabel!
    @IBOutlet private weak var playLabel: UILabel!
    @IBOutlet private weak var winLabel: UILabel!
    @IBOutlet private weak var drawLabel: UILabel!
    @IBOutlet private weak var loseLabel: UILabel!
    @IBOutlet private weak var goalDiffLabel: UILabel!
    @IBOutlet private weak var pointsLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configCell(thisStanding: Standing) {
        rankLabel.text = String(thisStanding.rank)
        teamImageView.sd_setImage(with: URL(string: thisStanding.team.logo), placeholderImage: nil)
        teamNameLabel.text = String(thisStanding.team.name)
        playLabel.text = String(thisStanding.all.played)
        winLabel.text = String(thisStanding.all.win)
        drawLabel.text = String(thisStanding.all.draw)
        loseLabel.text = String(thisStanding.all.lose)
        goalDiffLabel.text = String(thisStanding.goalsDiff)
        pointsLabel.text = String(thisStanding.points)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
