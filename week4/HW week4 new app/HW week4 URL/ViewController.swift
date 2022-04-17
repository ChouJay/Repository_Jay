//
//  ViewController.swift
//  HW week4 URL
//
//  Created by Jay Chou on 2022/4/15.
//

import UIKit
struct Desktop: Codable {
    let stationAddress: String
    let stationID: String
    let stationName: String
}


class ViewController: UIViewController {

//    let configuration = URLSessionConfiguration.default//start first by getting our configuration.
//    lazy var session = URLSession(configuration: configuration)//Create session from the default configuration
    
    @IBOutlet weak var stationIdLabel: UILabel!
    @IBOutlet weak var stationNameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        guard let url = URL(string: "https://stations-98a59.firebaseio.com/practice.json") else {
            fatalError()
        }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            //The data is an actual data object being retrieved from the server
            //The respone is a URL response, but if you make a HTTP request, the reutrn object is an HTTP response.
            //receive an error object to see what's happened.
            
//            guard let httpRespponse = response as? HTTPURLResponse,
//                  //status code in 兩百的範圍內(200 range), which means everything is fine. (像404就是 page not found)
//                  (200..<300).contains(httpRespponse.statusCode) else {
//                      return
//                  }
            guard let data = data else {
                return
            }
            do {
//JSONDecoder()的method: decode()是一個拋出函式，因此呼叫時要用try
//decode()的第一個引數放metatype，to access a metatype, you just use dot self after the name of a type. What that represents is a type itsel f
                let webSiteDescription = try JSONDecoder().decode(Desktop.self, from: data)
//用main thread進行UI的更新，不能用background thread
                DispatchQueue.main.async {
                    self.stationIdLabel.text = webSiteDescription.stationID
                    self.stationNameLabel.text = webSiteDescription.stationName
                    self.addressLabel.text = webSiteDescription.stationAddress
                    }
            } catch {
                print("Errot")
            }
        }
        .resume()
        

    }



}


