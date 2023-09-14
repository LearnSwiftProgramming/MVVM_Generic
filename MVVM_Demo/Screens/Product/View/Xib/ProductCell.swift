//
//  ProductCell.swift
//  MVVM_Demo
//
//  Created by Rahul Ajmera on 14/09/23.
//

import UIKit

class ProductCell: UITableViewCell {
    

    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productBackgroundView: UIView!
    @IBOutlet weak var productTitle: UILabel!
    @IBOutlet weak var productCategory: UILabel!
    @IBOutlet weak var rateButton: UIButton!
    @IBOutlet weak var productDescription: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    var product:Product?{
        didSet{ // Property observer
            productDetailConfiguration()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        productBackgroundView.clipsToBounds = false
        productBackgroundView.layer.cornerRadius = 15
        productImageView.layer.cornerRadius = 10
        
        self.productBackgroundView.backgroundColor = .systemGray6
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func productDetailConfiguration(){
        guard let product else {return}
        productTitle.text = product.title
        productCategory.text = product.category
        productDescription.text = product.description
        priceLabel.text = "$\(product.price)"
        rateButton.setTitle("\(product.rating.rate)", for: .normal)
        productImageView.setImage(with: product.image)
    }
    
}
