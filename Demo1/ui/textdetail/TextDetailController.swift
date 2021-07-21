//
//  TextDetailController.swift
//  Demo1
//
//  Created by Hoang Anh Tuan on 21/07/2021.
//

import UIKit

class TextDetailController: UIViewController {

    var name: String = ""

    @IBOutlet weak var tvName: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        tvName.text = name
    }


}
