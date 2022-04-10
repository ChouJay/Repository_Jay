//
//  CustomSegmentControl.swift
//  HW Week 3
//
//  Created by Jay Chou on 2022/4/9.
//

import Foundation
import UIKit


@IBDesignable
class CustomSegmentControl: UIControl {  //UIControl是UIView的child class，需使用UIControl才能send Event(Action)
    var buttons = [UIButton]()
    var seperatorView: UIView!
    var selector: UIView!
    var selectedSegmentIndex = 0
    
    
    
    @IBInspectable
    var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable
    var borderColor: UIColor = UIColor.clear {
    didSet {
        layer.borderColor = borderColor.cgColor
    }
  }
    @IBInspectable
    var commmaSeperatedButtonTitles: String = "" {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable
    var textColor: UIColor = .lightGray {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable
    var selectorColor: UIColor = .black {
        didSet {
            updateView()
        }
    }
    @IBInspectable
    var selectorTextColor: UIColor = .white {
        didSet {
            updateView()
        }
    }
    
    func updateView() {
        buttons.removeAll()  //每次重新輸入時先清空array，不然會一直累積
        subviews.forEach { (view) in
            view.removeFromSuperview()
        }
        let buttonTitles = commmaSeperatedButtonTitles.components(separatedBy: ",")
        for buttonTitle in buttonTitles {
            let button = UIButton(type:.system)
            button.setTitle(buttonTitle, for: .normal)
            button.setTitleColor(textColor, for: .normal)
            button.addTarget(self, action: #selector(buttonTapped(button:)), for: .touchUpInside)
            
           
        
            buttons.append(button)
        }
        buttons[0].setTitleColor(selectorTextColor, for: .normal)
        
        let selectorWidth = frame.width/CGFloat(buttonTitles.count)
        selector = UIView(frame: CGRect(x: 0, y: 0, width: selectorWidth, height: frame.height))
        selector.layer.cornerRadius = 5
        selector.backgroundColor = selectorColor
        addSubview(selector)
        

        
        //arrangeSubviews的引數應該要是UIView型別，因為array中放的是UIBotton型別(繼承自UIView)，因此沒有問題
        let sv = UIStackView(arrangedSubviews: buttons)
        sv.spacing = 1
        
        sv.axis = .horizontal //決定水平stack或垂直stack
        sv.alignment = .fill //這些button會平均填滿此stack view
        sv.distribution = .fillEqually
        addSubview(sv)
        sv.translatesAutoresizingMaskIntoConstraints = false
        //要加入isAvtive為true，使constraint才會生效
        sv.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        sv.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        sv.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        sv.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        seperatorView = UIView(frame: CGRect(x: frame.width/CGFloat(buttonTitles.count)-2, y: 0, width: 2, height: frame.height))
        seperatorView.backgroundColor = .black
        sv.addSubview(seperatorView)
        
    }
    
    
    //all the border properties are on the layer => UIView.layer
    override func draw(_ rect: CGRect) {
        layer.cornerRadius = 5
    }
    @objc func buttonTapped(button: UIButton) {
        // array.enumerated可以得到陣列的index跟value
        for (buttonIndex, btn) in buttons.enumerated() {
            btn.setTitleColor(textColor, for: .normal)
            
            if btn == button {
                selectedSegmentIndex = buttonIndex
                let selectorStartPosition = frame.width/CGFloat(buttons.count) * CGFloat(buttonIndex)
                //選擇器view的移動
                UIView.animate(withDuration: 0.3, animations: {
                    //需理解其閉包如何寫的
                    self.selector.frame.origin.x = selectorStartPosition
                })
                //自製segment seperator的移動
                UIView.animate(withDuration: 0.3, animations: {
                    self.seperatorView.frame.origin.x = (self.frame.width/2 - 2) + CGFloat(buttonIndex) * 2
                })
                
                btn.setTitleColor(selectorTextColor, for: .normal)
            }
        }
        sendActions(for: .valueChanged)
    }
    
}
