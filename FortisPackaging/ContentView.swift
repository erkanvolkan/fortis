//
//  ContentView.swift
//  FortisPackaging
//
//  Created by Erkan on 1/27/20.
//  Copyright © 2020 ErkanVolkan. All rights reserved.
//

import SwiftUI



struct ContentView: View {
    
    init(){
        UITabBar.appearance().backgroundColor = UIColor.lightGray
    }
    
    @State var selected = 2
    
    var body: some View {
        TabView(selection: $selected) {
            mainPage().tabItem {
                Image(systemName: "house")
                Text("About Us")
                
            }.tag(0)
            
            galleryView().tabItem {
                Image(systemName: "purchased.circle")
                Text("Products")
                
            }.tag(1)
            
            contactPage().tabItem {
                Image(systemName: "map")
                Text("Contact Us")
                
            }.tag(2)
        }.background(Color.black)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
