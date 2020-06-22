//
//  ViewController.swift
//  ComparisonShopper
//
//  Created by Jay Strawn on 6/15/20.
//  Copyright © 2020 Jay Strawn. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // Left
    @IBOutlet weak var titleLabelLeft: UILabel!
    @IBOutlet weak var imageViewLeft: UIImageView!
    @IBOutlet weak var priceLabelLeft: UILabel!
    @IBOutlet weak var roomLabelLeft: UILabel!

    // Right
    @IBOutlet weak var titleLabelRight: UILabel!
    @IBOutlet weak var imageViewRight: UIImageView!
    @IBOutlet weak var priceLabelRight: UILabel!
    @IBOutlet weak var roomLabelRight: UILabel!

    var house1: House?
    var house2: House?
  
    override func viewDidLoad() {
        super.viewDidLoad()
      house1 = House(address: nil, price: "$12,000", bedrooms: "3 bedrooms")
      setUpRightSideUI()
      setUpLeftSideUI()


    }

    func setUpLeftSideUI() {
      var alpha: CGFloat
      if house1 == nil {
        alpha = 0
      } else {
        alpha = 1
        titleLabelLeft.text = house1?.address ?? "No address"
        priceLabelLeft.text = house1?.price ?? "No price"
        roomLabelLeft.text = house1?.bedrooms ?? "No bedrooms"
      }
      titleLabelLeft.alpha = alpha
      imageViewLeft.alpha = alpha
      priceLabelLeft.alpha = alpha
      roomLabelLeft.alpha = alpha
    }

    func setUpRightSideUI() {
      var alpha: CGFloat
        if house2 == nil {
          alpha = 0
        } else {
          alpha = 1
          titleLabelRight.text! = house2?.address ?? "No address"
          priceLabelRight.text! = house2?.price ?? "No price"
          roomLabelRight.text! = house2?.bedrooms ?? "No bedrooms"
        }
      titleLabelRight.alpha = alpha
      imageViewRight.alpha = alpha
      priceLabelRight.alpha = alpha
      roomLabelRight.alpha = alpha
    }

    @IBAction func didPressAddRightHouseButton(_ sender: Any) {
        openAlertView()
    }

    func openAlertView() {
        let alert = UIAlertController(title: "Alert Title", message: "Alert Message", preferredStyle: UIAlertController.Style.alert)

        alert.addTextField { (textField) in
            textField.placeholder = "address"
        }

        alert.addTextField { (textField) in
            textField.placeholder = "price"
        }

        alert.addTextField { (textField) in
            textField.placeholder = "bedrooms"
        }

        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler:nil))

        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler:{ (UIAlertAction) in
            var house = House()
            house.address = alert.textFields?[0].text
            house.price = alert.textFields?[1].text
            house.bedrooms = alert.textFields?[2].text
            self.house2 = house
            self.setUpRightSideUI()
        }))

        self.present(alert, animated: true, completion: nil)
    }

}

struct House {
    var address: String?
    var price: String?
    var bedrooms: String?
}

