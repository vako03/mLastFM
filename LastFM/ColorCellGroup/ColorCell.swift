//
//  ColorCell.swift
//  LastFM
//
//  Created by valeri mekhashishvili on 14.07.23.
//

import UIKit

class ColorCell: UICollectionViewCell {
    
    
    @IBOutlet weak var labelGenre: UILabel!
    @IBOutlet weak var labelListeners: UILabel!
    
    static let identifier = "ColorCell"
    

    
    override func awakeFromNib() {
           super.awakeFromNib()
           setupCell()
       }

       override func layoutSubviews() {
           super.layoutSubviews()
           layer.cornerRadius = 15
           clipsToBounds = true
       }

       private func setupCell() {
           // Perform additional cell setup here
       }

       func configure(with tag: Tag) {
           labelGenre.text = tag.name
           labelListeners.text = "\(tag.reach)"
       }

       override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
           let attributes = super.preferredLayoutAttributesFitting(layoutAttributes)
           attributes.size = CGSize(width: 322, height: 140)
           return attributes
       }
   }
