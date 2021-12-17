//
//  ViewController.swift
//  HostingControllerTest
//
//  Created by keith Alperin on 12/17/21.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {

open override var preferredScreenEdgesDeferringSystemGestures: UIRectEdge{
        return [.top];
    }

    override var modalPresentationStyle: UIModalPresentationStyle {
        get {
            .fullScreen
        }
        set {
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func dismissView() {
        let presentingViewController = self.presentingViewController
        self.dismiss(animated: true) {
            presentingViewController?.setNeedsUpdateOfScreenEdgesDeferringSystemGestures()
            print("dismissed")
        }
    }

}




