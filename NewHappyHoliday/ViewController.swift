//
//  ViewController.swift
//  NewHappyHoliday
//
//  Created by 王文博 on 15/12/8.
//  Copyright © 2015年 王文博. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
  
  let tableView = UITableView()
  var data:[HappyModel]? {
    didSet {
      self.tableView.reloadData()
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.title = "好玩"
    
    weak var weakSelf = self
    DataEngine.getHappyHolidayData { (modelArray) in
      weakSelf?.data = modelArray
    }
    tableView.frame = view.bounds
//    tableView.contentInset = UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0)
    tableView.dataSource = self
    tableView.delegate = self
    tableView.rowHeight = 44
    view.addSubview(tableView)
  }
  
  //MARK: - tableViewDataSource
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let model = data?[indexPath.row]
    var cell = tableView.dequeueReusableCellWithIdentifier("cell")
    if cell == nil {
      cell = UITableViewCell(style: .Subtitle, reuseIdentifier: "cell")
    }
    cell?.textLabel?.text = model!.name
    cell?.detailTextLabel?.text = model!.address
    return cell!
  }
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return data?.count ?? 0
  }
  
  func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    tableView.deselectRowAtIndexPath(indexPath, animated: true)
    
    let model:HappyModel = data![indexPath.row]
    let goodViewController = GoodDetailViewController()
    goodViewController.model = model
    navigationController?.pushViewController(goodViewController, animated: true)
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

