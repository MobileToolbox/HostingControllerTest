//
//  HostingController.swift
//  HostingControllerTest
//
//  Created by keith Alperin on 12/17/21.
//

import Foundation
import UIKit
import SwiftUI

class HostingController<Content: View>: UIHostingController<Content>, Presenter {
    
    open override var preferredScreenEdgesDeferringSystemGestures: UIRectEdge{
        return self.presentedViewController?.preferredScreenEdgesDeferringSystemGestures ?? []
    }
    
    
    public func presentViewController() {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController()! as! ViewController
        self.present(vc, animated: true) {
            print("presented")
        }
    }
}
