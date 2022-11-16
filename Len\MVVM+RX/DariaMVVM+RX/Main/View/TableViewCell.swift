//
//  TableViewCell.swift
//  DariaMVVM+RX
//

import UIKit

class TableViewCell: UITableViewCell {

    // MARK: - Properties
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!

    // MARK: - Configure
    func configure(with user: User) {
        downloadImage(urlString: user.avatarURL)
        nameLabel.text = user.login
    }

    // MARK: - Download Image
    func downloadImage(urlString: String) {
        guard let url = URL(string: urlString) else { return }
        guard let data = try? Data(contentsOf: url) else { return }
        DispatchQueue.main.async { [weak self] in
            self?.photoImageView.image = UIImage(data: data)
        }
    }
}
