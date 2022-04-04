//
//  ViewController.swift
//  HW Section 5
//
//  Created by Jay Chou on 2022/4/1.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var textView: UITextView!
    
    @IBAction func randomeColorText() {
        textView.text = text.randomElement()
        view.backgroundColor = color.randomElement()
//        ------------------------------------------------------
//    法二: 與法一相同，隨機的顏色對隨機的文字
//        textView.text = dict?.keys.randomElement()          //隨機取dict內的key
//        view.backgroundColor = dict?.values.randomElement() //隨機取dict內的value，與key對不到
//        ------------------------------------------------------
//    法三: 隨機的顏色跟文字的配對(文字跟顏色的組合是固定的)
//        let dictRandomElement = dict?.randomElement()     //將randomelement先放到一個常數儲存
//        textView.text = dictRandomElement?.key            //如此對相同的random element存取
//        view.backgroundColor = dictRandomElement?.value   //key及value，因此兩者可對應
        
    }
//    搭配法二、法三用的dict
//    var dict: [String: UIColor]? = ["Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas tempus.": .purple, "Contrary to popular belief, Lorem Ipsum is not simply random text.": .orange, "Richard McClintock, a Latin professor at Hampden-Sydney College in ": .red]
    let text = ["Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas tempus.", "Contrary to popular belief, Lorem Ipsum is not simply random text.", "Richard McClintock, a Latin professor at Hampden-Sydney College in ", "looked up one of the more obscure Latin words, consectetur",
    "from a Lorem Ipsum passage, and going through the cities of the word", "This book is a treatise on the theory of ethics, very popular during the.", "The first line of Lorem Ipsum, Lorem ipsum dolor sit amet..",
    ]

    let color: [UIColor] = [.blue, .brown, .gray, .green, .red, .orange, .purple]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

