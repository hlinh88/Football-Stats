//
//  FavouriteTableViewCell.swift
//  FootballStats
//
//  Created by Hoang Linh Nguyen on 12/10/2023.
//

import UIKit
import Reusable
import Then

protocol FavouriteTableViewCellDelegate: AnyObject {
    func handleRemoveButton(sender: UIButton, id: Int)
    func handleFavouriteView(sender: UITapGestureRecognizer, id: Int)
}

class FavouriteTableViewCell: UITableViewCell, NibReusable {
    @IBOutlet private weak var favouriteView: UIView!
    @IBOutlet private weak var clubNameLabel: UILabel!
    @IBOutlet private weak var clubLogoImageView: UIImageView!
    @IBOutlet private weak var playerImageView: UIImageView!
    @IBOutlet private weak var playerNameLabel: UILabel!
    @IBOutlet private weak var removeButton: UIButton!

    private var id: Int?

    weak var delegate: FavouriteTableViewCellDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func configCell(thisFavourite: FavouritePlayer) {
        self.do {
            $0.id = thisFavourite.id
            $0.favouriteView.layer.cornerRadius = CGFloat(Constants.cornerRadius)
            $0.playerNameLabel.text = thisFavourite.playerName
            $0.playerImageView.sd_setImage(with: URL(string: thisFavourite.playerImage), placeholderImage: nil)
            $0.clubNameLabel.text = thisFavourite.clubName
            $0.clubLogoImageView.sd_setImage(with: URL(string: thisFavourite.clubLogo), placeholderImage: nil)
            let gesture = UITapGestureRecognizer(target: self, action: #selector (self.handleFavouriteView (_:)))
            $0.favouriteView.addGestureRecognizer(gesture)
        }
    }

    @IBAction private func handleRemoveButton(_ sender: UIButton) {
        guard let id = self.id else { return }
        delegate?.handleRemoveButton(sender: sender, id: id)
    }

    @objc private func handleFavouriteView(_ sender: UITapGestureRecognizer) {
        guard let id = self.id else { return }
        delegate?.handleFavouriteView(sender: sender, id: id)
    }
}
