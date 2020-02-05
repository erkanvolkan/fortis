//
//  MainPage.swift
//  FortisPackaging
//
//  Created by Erkan on 1/27/20.
//  Copyright © 2020 ErkanVolkan. All rights reserved.
//

import SwiftUI

struct mainPage: View {
    
    public var body: some View {
        
        
        VStack{
            Spacer()
            Text("FORTIS PACKAGING")
            .fontWeight(.heavy)
            .font(.headline)
            
            
            ScrollView(.vertical,showsIndicators: false){
                    //   Image("back").resizable().cornerRadius(10)
                    
                    Text("Fortis Packaging exists to help shippers protect their products from damages during shipments and deliver their product safely to their buyers.")
                        .padding()
                        .font(.system(size: 20))
                        .foregroundColor(.white)
                        .animation(.easeIn)
                Divider()
                    Text("Protect your breakable items or mails with our bubble wraps.It provides safe protection for your major appliance and furnitures especially in home moving situations.\n\nGet reservation to visit us and see products on site or ask portfolio samples.")
                        .padding()
                        .font(.system(size: 20))
                        .foregroundColor(.white)
                        .animation(.easeInOut)
                Divider()
                    Text("At Fortis Packaging, we proudly manufacture top quality bubble cushion rolls in all sizes and specializing on one product category,\nFortis Packaging easily meets all types of demands related to bubble rolls, thanks to the quality and the capacity of the machinery owned.")
                        .padding()
                        .font(.system(size: 20))
                        .foregroundColor(.white)
                        .animation(.easeOut)
                    
                
            } .background(Image("back").resizable().cornerRadius(15))
        }
        
        
        
        
    }
}
