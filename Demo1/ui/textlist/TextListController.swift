//
//  TextListController.swift
//  Demo1
//
//  Created by Hoang Anh Tuan on 05/07/2021.
//

import UIKit
import RxSwift

class TextListController: UIViewController {

    let viewModel = TextListViewModel()

    var dataSource: TextDataSource?
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpListView()

        observeData()
    }

    @IBAction func onBtnAddClicked(_ sender: Any) {
        let textAddViewController = TextAddViewController()
        present(textAddViewController, animated: true)
    }
    
    private func setUpListView() {
        dataSource = TextDataSource()
        dataSource?.listener = self
        dataSource?.setRecyclerView(rec: collectionView)
    }

    private func observeData() {
        viewModel.textList.subscribe(on: MainScheduler.instance).subscribe { items in
            self.dataSource?.submit(rec: self.collectionView, data: items)
        }
    }
}

extension TextListController: OnItemClickListener {
    func onItemClick(item: TextViewItem) {
        let textDetailController = TextDetailController()

        textDetailController.name = item.textStr

        present(textDetailController, animated: true)
    }
}
