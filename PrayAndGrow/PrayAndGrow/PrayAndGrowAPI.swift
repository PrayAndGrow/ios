//
//  PrayAndGrowAPI.swift
//  PrayAndGrow
//
//  Created by Kamil Badyla on 09/04/16.
//  Copyright © 2016 Hackatheon. All rights reserved.
//

import Foundation
import Alamofire

enum Environment {
    case Staging, Production
    
    func apiURL() -> NSURL {
        switch self {
        case .Staging:
            return NSURL(string: "http://127.0.0.1:8000")!
        case .Production:
            return NSURL(string: "http://api.prayandgrow.garapich.pl")!
        }
    }
}

class PrayAndGrowAPI {
    var environment = Environment.Production
    static let sharedAPI = PrayAndGrowAPI()
    
    func brainBits() -> Alamofire.Request {
        return Alamofire.request(.GET, self.environment.apiURL().URLByAppendingPathComponent("brainfood"))
    }
    
    func brainTags() -> Alamofire.Request {
        return Alamofire.request(.GET, self.environment.apiURL().URLByAppendingPathComponent("tags"))
    }
    
    func surpriseMe(surpriseMeInput: SurpriseMeInput) -> Alamofire.Request {
        let headers = [
            "Content-Type": "application/json"
        ]
        return Alamofire.request(.POST, self.environment.apiURL().URLByAppendingPathComponent("surpriseme/"), parameters: surpriseMeInput.dictionaryRepresentation(), encoding: ParameterEncoding.JSON, headers: headers)
    }
}
