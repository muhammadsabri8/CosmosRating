//
//  ViewController.swift
//  CosmosRating
//
//  Created by Mohamed Sabri on 16/04/1440 AH.
//  Copyright © 1440 Mohamed Sabri. All rights reserved.
//

import UIKit
import Cosmos


class ViewController: UIViewController {

    private let startRating:Float = 3.7
    @IBOutlet weak var sliderRating: UISlider!
    @IBOutlet weak var ratingNum: UILabel!
    @IBOutlet weak var cosmosView: CosmosView!
    override func viewDidLoad() {
        super.viewDidLoad()

        cosmosView.didTouchCosmos = didTouchCosmos
        cosmosView.didFinishTouchingCosmos = didFinishTouchingCosmos
        
        sliderRating.value = startRating
        updateRating()
    }

    private func didTouchCosmos(_ rating: Double) {
        sliderRating.value = Float(rating)
        ratingNum.text = ViewController.formatValue(rating)
       // ratingNum.textColor = UIColor(red: 133/255, green: 116/255, blue: 154/255, alpha: 1)
    }
    
    private func didFinishTouchingCosmos(_ rating: Double) {
        sliderRating.value = Float(rating)
        self.ratingNum.text = ViewController.formatValue(rating)
        //ratingNum.textColor = UIColor(red: 183/255, green: 186/255, blue: 204/255, alpha: 1)
    }
    private func updateRating() {
        let value = Double(sliderRating.value)
        cosmosView.rating = value
        self.ratingNum.text = ViewController.formatValue(value)
    }
    
    private class func formatValue(_ value: Double) -> String {
        return String(format: "%.2f", value)
    }
    
    
    @IBAction func sliderRatingChange(_ sender: UISlider) {
        updateRating()
    }
}

