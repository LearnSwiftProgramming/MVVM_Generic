//
//  ProductListViewController.swift
//  MVVM_Demo
//
//  Created by Rahul Ajmera on 13/09/23.
//

import UIKit

class ProductListViewController: UIViewController {
    @IBOutlet weak var productTableView :UITableView!
    
    private var viewModel = ProductViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        configuration()

       
        // Do any additional setup after loading the view.
    }
    

}

extension ProductListViewController{
    
    func configuration(){
        productTableView.register(UINib(nibName: "ProductCell", bundle: nil), forCellReuseIdentifier: "ProductCell")
        initViewModel()
        observeEvent()
    }
    func initViewModel(){
        viewModel.fetchProducts()
    }
    // Data Binding event observe karega-> communication
    func observeEvent(){
        viewModel.eventHandler = { [weak self] event in
            guard let self else {
                return
                
            }
            
            switch event{
            case .loading:
                print("Product Loading......")
            case .stopLoading:
                print("Stop Loading......")
            case .dataLoaded:
                print("Data Loaded......")
                print(self.viewModel.prodcuts)
                DispatchQueue.main.async {
                    self.productTableView.reloadData()
                }
                case .error(let error):
                print(error)
            }
            
        }
        
    }
}


extension ProductListViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.prodcuts.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCell") as? ProductCell else{
            return UITableViewCell()
        }
        let product  = viewModel.prodcuts[indexPath.row]
        cell.product = product
        
        
        
        
        
     return cell
    }
}
