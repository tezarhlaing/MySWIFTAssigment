//
//  RoadView.swift
//  LLOYDSTest
//
//  Created by tzh on 19/01/2023.
//

import UIKit

class RoadView: UIView {

    @IBOutlet weak var txtRoad: UITextField!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var lblRoadName: UILabel!
    @IBOutlet weak var lblStatus: UILabel!
    
    
    func loadRoadData(road: Road?) {
        guard let road = road else {
            return
        }
        lblDescription.text = road.statusSeverityDescription
        lblRoadName.text = road.displayName
        lblStatus.text = road.statusSeverity
    }
    func getRoadID() -> String? {
        return self.txtRoad.text
    }

}
