//
//  BaseViewController.swift
//  LLOYDSTest
//
//  Created by tzh on 19/01/2023.
//

import UIKit
import PKHUD

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    func showGenericAlert(message:String, title:String = "", handler: ((UIAlertAction) -> Void)? = nil){
        //display alerts in mainthread to prevent crash if any part of the codes try to show error alert from background threads
        DispatchQueue.main.async {
            HUD.hide()
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.alignment = .center
            let messageText = NSMutableAttributedString(
                string: message,
                attributes: [
                    NSAttributedString.Key.paragraphStyle: paragraphStyle,
                    NSAttributedString.Key.font : UIFont.systemFont(ofSize: 13)
                ]
            )
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alert.setValue(messageText, forKey: "attributedMessage")
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: handler))
            self.present(alert, animated:true)
        }
    }

}
