//
//  ViewController.swift
//  Demo1
//
//  Created by Hoang Anh Tuan on 04/07/2021.
//

import UIKit

class ViewController: UIViewController , UICollectionViewDataSource{
    
    private var list : Array<String> =  [String]()
    
    @IBOutlet weak var etInput: UITextField!
    
    @IBOutlet weak var tvShow: UILabel!
    
    @IBOutlet weak var btnGetData: UIButton!
    
    @IBOutlet weak var recList: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let screenWidth = UIScreen.main.bounds.width - 10
     
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
//        layout.sectionInset = UIEdgeInsets(top: 20, left: 0, bottom: 10, right: 0)
        layout.itemSize = CGSize(width: screenWidth, height: screenWidth/3)
//        layout.minimumInteritemSpacing = 5
//        layout.minimumLineSpacing = 5

        recList!.collectionViewLayout = layout
        
        let nib = UINib(nibName: "ProductCell", bundle: .main)
        recList.register(nib, forCellWithReuseIdentifier: "cell")
        
        recList.dataSource = self
    }

    
    @IBAction func onChange(_ sender: Any) {
        tvShow.text = etInput.text
    }
    
    @IBAction func onBtnGetDataClicked(_ sender: Any) {
        let item: String = etInput!.text!
        
        if(item.isEmpty == false){
            list.append(item)
        }
        
        recList.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ProductCell
                
        let item = list[indexPath.row]
        cell.tvItem.text = item
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        list.count
    }
}

