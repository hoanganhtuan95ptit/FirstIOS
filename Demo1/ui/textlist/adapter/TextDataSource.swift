//
//  ProductDataSource.swift
//  Demo1
//
//  Created by Hoang Anh Tuan on 05/07/2021.
//

import UIKit

protocol OnItemClickListener: AnyObject {
    func onItemClick(item: TextViewItem)
}

class TextDataSource: NSObject, UICollectionViewDataSource {

    var list: Array<TextViewItem> = Array()

    weak var listener: OnItemClickListener?

    func submit(rec: UICollectionView, data: Array<TextViewItem>) {
        list = data

        rec.reloadData()
    }

    func setRecyclerView(rec: UICollectionView) {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: rec.bounds.width, height: rec.bounds.height / 3)
        rec.collectionViewLayout = layout

        let nib = UINib(nibName: "TextCollectionViewCell", bundle: .main)
        rec.register(nib, forCellWithReuseIdentifier: "cell")

        rec.delegate = self
        rec.dataSource = self
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        list.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! TextCollectionViewCell
        let item = list[indexPath.row]

        cell.item = item

        cell.tvItem.text = item.textStr

        return cell
    }

}

extension TextDataSource:  UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        listener?.onItemClick(item: list[indexPath.row])
    }
}
