//
//  SearchViewCell.swift
//  GradCareer
//
//  Created by Ziyi Liao on 3/16/22.
//

import UIKit

class SearchViewCell: UICollectionViewCell {
    
    var jobResult: Posting! {
        didSet {
            companyLabel.text = jobResult.companyName
            titleLabel.text = jobResult.title
            let type = jobResult.jobTypes.joined(separator: " ")
            typeLabel.text = type
            locationLabel.text = jobResult.location
        }
    }
    // This is design in Home page
    // create labels: company, title...
    let companyLabel: UILabel = {
        let label = UILabel()
        label.text = "Great Company"
        label.font = .systemFont(ofSize: 16)
        label.numberOfLines = 0 // if the lable is too long, it will change line automatically
        label.textColor = .label // don't need to specify a color
        return label
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "iOS Developer"
        label.font = .boldSystemFont(ofSize: 20)
        label.numberOfLines = 0 // if the lable is too long, it will change line automatically
        label.textColor = .label // don't need to specify a color
        return label
    }()
    
    let typeLabel: UILabel = {
        let label = UILabel()
        label.text = "Full time"
        label.font = .systemFont(ofSize: 16)
        label.numberOfLines = 0 // if the lable is too long, it will change line automatically
        label.textColor = .label // don't need to specify a color
        return label
    }()
    
    let locationLabel: UILabel = {
        let label = UILabel()
        label.text = "Atlanta, GA"
        label.font = .systemFont(ofSize: 16)
        label.numberOfLines = 0 // if the lable is too long, it will change line automatically
        label.textColor = .label // don't need to specify a color
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(named: "backgroundCell")
        let stackView = UIStackView(arrangedSubviews: [titleLabel, companyLabel, typeLabel, locationLabel])
        addSubview(stackView)
        stackView.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 20, left: 20, bottom: 0, right: 20))
        stackView.axis = .vertical
        stackView.spacing = 10
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
