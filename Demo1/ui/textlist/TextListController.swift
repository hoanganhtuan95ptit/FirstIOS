//
//  TextListController.swift
//  Demo1
//
//  Created by Hoang Anh Tuan on 05/07/2021.
//

import UIKit
import RxSwift

class HomeController: UIViewController {

    let viewModel = HomeViewModel()

    var dataSource: TextDataSource?

    @IBOutlet weak var etText: UITextField!
    @IBOutlet weak var recyclerView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpListView()

        observeData()
    }

    @IBAction func onAddDataClick(_ sender: Any) {
        let textAddViewController = TextAddViewController()
        
        present(textAddViewController, animated: true)
    }

    private func setUpListView() {
        dataSource = TextDataSource()
        dataSource?.listener = self
        dataSource?.setRecyclerView(rec: recyclerView)
    }

    private func observeData() {
        viewModel.textList.subscribe(on: MainScheduler.instance).subscribe { items in
            self.dataSource?.submit(rec: self.recyclerView, data: items)
        }
    }
}

extension HomeController: OnItemClickListener {
    func onItemClick(item: TextViewItem) {
        let textDetailController = TextDetailController()

        textDetailController.name = item.textStr

        present(textDetailController, animated: true)
    }
}
