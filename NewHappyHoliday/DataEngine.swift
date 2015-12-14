//
//  DataEngine.swift
//  NewHappyHoliday
//
//  Created by 王文博 on 15/12/8.
//  Copyright © 2015年 王文博. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

let downloadURL = "http://act.myzaker.com/?c=activity_list&p=0&size=10&category=10000&_appid=iphone&_bsize=640_1136&_dev=iPhone&_idfa=C2A10BAC-1B45-4751-9D57-E80B1D4FA12C&_mac=&_udid=EFA277C4-6C2F-4952-8373-432B9886AEA4&_v=2.0&_version=2.0&city=%E5%8C%97%E4%BA%AC&lat=39.98067858632652&lng=116.49069224495113"

class DataEngine {
  
  class func getHappyHolidayData(completeHandler:([HappyModel]) -> Void) {
    Alamofire.request(.GET, downloadURL, parameters: nil, encoding: .JSON, headers: nil)
      .responseJSON { (response) -> Void in
        if let value = response.result.value {
          let json = JSON(value)
          let activityArray = json["data"]["activities"].object as! [AnyObject]
          var modelArray:[HappyModel] = [HappyModel]()
          for dict in activityArray {
            let model = HappyModel()
            model.name = dict["price"] as! String
            model.address = dict["address"] as! String
            model.content = dict["content"] as! String
            modelArray.append(model)
          }
          completeHandler(modelArray)
        }
    }
  }
}
