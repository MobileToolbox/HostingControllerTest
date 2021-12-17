//
//  ContentView.swift
//  SystemGestureTest
//
//  Created by Shannon Young on 12/7/21.
//

import SwiftUI

struct ContentView: View {
    
    weak var presenter: Presenter?
    
    init(presenter: Presenter? = nil) {
        self.presenter = presenter
    }
    
    var body: some View {
        VStack {
            Text("This is a SwiftUI View")
            Button("Show UIViewController", action: { self.presenter!.presentViewController()
                
            })
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(presenter: nil)
    }
}
