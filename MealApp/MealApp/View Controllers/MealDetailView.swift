//
//  MealDetailViewController.swift
//  MealApp
//
//  Created by Chakane Shegog on 12/26/21.
//

import UIKit

class MealDetailView: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var mealDetails = [MealInfo]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    var mealID: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        loadData()
    }
    
    func loadData() {
        MealDetail.getMealsDetail(for: mealID ?? "nil") { (result) in
            DispatchQueue.main.async {
                switch result {
                case .failure(let error):
                    print("MealDetaiView: \(error)")
                    
                case .success(let data):
                    self.mealDetails = data
                }
            }
        }
    }
}

extension MealDetailView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "detailCell", for: indexPath) as? DetailCell else {
            fatalError("check identity inspeactor")
        }
        print("Theres \(mealDetails.count) items in mealDetails")
//        let meal = mealDetails[indexPath.row]
//        cell.configureCell(for: mealDetails)
        return cell
    }
}

extension MealDetailView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 700
    }
}
