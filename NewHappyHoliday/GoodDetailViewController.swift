//
//  GoodDetailViewController.swift
//  NewHappyHoliday
//
//  Created by 王文博 on 15/12/9.
//  Copyright © 2015年 王文博. All rights reserved.
//

import UIKit

class GoodDetailViewController: UIViewController {

  var model:HappyModel!
  let webView = UIWebView()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.automaticallyAdjustsScrollViewInsets = false
    webView.frame = self.view.bounds
    webView.loadHTMLString(model.content, baseURL: nil)
    view.addSubview(webView)
  }
  
  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    navigationController?.view.sendSubviewToBack((navigationController?.navigationBar)!)
  }
  
  override func viewWillDisappear(animated: Bool) {
    super.viewWillDisappear(animated)
    navigationController?.view.bringSubviewToFront((navigationController?.navigationBar)!)
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  

  /*
  // MARK: - Navigation

  // In a storyboard-based application, you will often want to do a little preparation before navigation
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
      // Get the new view controller using segue.destinationViewController.
      // Pass the selected object to the new view controller.
  }
  */

}
