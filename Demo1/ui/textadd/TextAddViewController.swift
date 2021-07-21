//
//  TextAddViewController.swift
//  Demo1
//
//  Created by Hoang Anh Tuan on 21/07/2021.
//

import UIKit

class TextAddViewController: UIViewController {

    let viewModel = TextAddViewModel()
    
    
    @IBOutlet weak var etText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


    @IBAction func btnAddText(_ sender: Any) {
        viewModel.addText(text: etText.text!)
        dismiss(animated: true)
    }
    
}
