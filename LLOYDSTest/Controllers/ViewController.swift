//
//  ViewController.swift
//  LLOYDSTest
//
//  Created by tzh on 19/01/2023.
//

import UIKit
import PKHUD
import RxSwift

class ViewController: BaseViewController {
    @IBOutlet weak var roadView: RoadView!
    private var viewModel = RoadViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func loadRoad(){
        
        guard let roadID =  self.roadView.getRoadID(), !roadID.isEmpty else {
            self.showGenericAlert(message: Constants.ROAD_EMPTY_MSG)
            return
        }
        
        self.viewModel.getRoad(roadId: roadID)
            .observeOn(MainScheduler.instance)
            .subscribe { event in
                HUD.hide()

                if self.viewModel.roadObj == nil {
                    self.showGenericAlert(message: Constants.ROAD_404ERROR_MSG + roadID)
                    return

                }
                self.roadView.loadRoadData(road: self.viewModel.roadObj)
                
        }
        
    }
     
}

extension ViewController : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        HUD.show(.progress)
        self.loadRoad()
        return true
    }
}
