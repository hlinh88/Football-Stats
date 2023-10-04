//
//  ScheduleTableViewCell.swift
//  FootballStats
//
//  Created by Hoang Linh Nguyen on 4/10/2023.
//

import UIKit
import Reusable

final class ScheduleTableViewCell: UITableViewCell, NibReusable {
    @IBOutlet private weak var scoreView: UIView!
    @IBOutlet private weak var homeGoalLabel: UILabel!
    @IBOutlet private weak var awayGoalLabel: UILabel!
    @IBOutlet private weak var homeImageView: UIImageView!
    @IBOutlet private weak var homeNameLabel: UILabel!
    @IBOutlet private weak var awayImageView: UIImageView!
    @IBOutlet private weak var awayNameLabel: UILabel!
    @IBOutlet private weak var stadiumLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        customizeCell()
    }

    private func customizeCell() {
        scoreView.layer.cornerRadius = CGFloat(Constants.cornerRadius)
    }

    func configCell(thisSchedule: Schedule) {
        homeGoalLabel.text = String(thisSchedule.goals.home)
        awayGoalLabel.text = String(thisSchedule.goals.away)
        homeImageView.sd_setImage(with: URL(string: thisSchedule.teams.home.logo), placeholderImage: nil)
        awayImageView.sd_setImage(with: URL(string: thisSchedule.teams.away.logo), placeholderImage: nil)
        homeNameLabel.text = String(thisSchedule.teams.home.name)
        awayNameLabel.text = String(thisSchedule.teams.away.name)
        stadiumLabel.text = String(thisSchedule.fixture.venue.name)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
