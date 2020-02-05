//
//  ContactPage.swift
//  FortisPackaging
//
//  Created by Erkan on 1/27/20.
//  Copyright © 2020 ErkanVolkan. All rights reserved.
//

import SwiftUI
import UIKit
import MessageUI

struct contactPage: View {
    
    @State var dateSelected = Date()
    @State var time = Date()
    @State var products = 1
    
    var dateFormatter: DateFormatter {
        let df = DateFormatter()
        df.dateStyle = .short
        return df
    }
    
    var timeFormatter: DateFormatter {
        let df = DateFormatter()
        df.dateStyle = .none
        df.timeStyle = .medium
        return df
    }
    
    let minDate = Calendar.current.date(byAdding: .day, value: -1, to: Date())!
    let maxDate = Calendar.current.date(byAdding: .day, value: 7, to: Date())!
    
    public var body: some View {
        
        
        VStack{
            Spacer()
            Text("FORTIS PACKAGING")
                .fontWeight(.heavy)
                .font(.headline)
                .foregroundColor(.white)
            
           List{
            Section(header: Text("Address")
                .font(.headline)
                .fontWeight(.bold)
            ){
                HStack{
                    Text("480 Main Ave.Suite 1\nWallington, NJ\n07057")
                        .font(.subheadline)
                        .fontWeight(.light)
                    Spacer()
                    Divider()
                    Button(action: {
                        UIApplication.shared.open(URL(string:"https://maps.apple.com/?address=480%20Main%20Ave,%20Unit%201,%20Wallington,%20NJ%20%2007057,%20United%20States&ll=40.859398,-74.099645&q=480%20Main%20Ave&_ext=EiYp4fIOl21tREAx7Q8C5MGGUsA5X8g085NuREBBRQkxSv+FUsBQAw%3D%3D")! as URL, options: [:], completionHandler: nil)
                    }){
                        Image(systemName:"location.circle")
                            .resizable()
                            .frame(width: 30, height: 30, alignment: .bottomTrailing)
                        
                    }
                    
                }}
            Section(header: Text("Phone")
                
            ){
                
                HStack{
                    Text("Ask for free samples\nReserve appointment")
                        .font(.subheadline)
                        .fontWeight(.light)
                    Spacer()
                    Divider()
                    Text("Inquire your orders")
                    .font(.subheadline)
                    .fontWeight(.light)
                    Spacer()
                    Divider()
                    Button(action: {
                        UIApplication.shared.open(URL(string:"tel://9733651500")! as URL, options: [:], completionHandler: nil)
                    }){
                        Image(systemName:"phone")
                            .resizable()
                            .frame(width: 30, height: 30, alignment: .bottomTrailing)
                        
                    }
                }
            }
            Section(header: Text("Email")
                
            ){
                
                HStack {
                    Text("Simply call our customer service or \nsend an e-mail and our sales representative will contact you shortly.")
                        .font(.subheadline)
                        .fontWeight(.light)
                    
                    Spacer()
                    Divider()
                    Button(action: {
                        UIApplication.shared.open(URL(string:"mailto:contact@fortispackaging.com")! as URL, options: [:], completionHandler: nil)
                        
                    }){
                        Image(systemName:"paperplane")
                            .resizable()
                            .frame(width: 30, height: 30, alignment: .bottomTrailing)
                    }
                    
                    
                    
                    
                }
            }
            Section(header: Text("Web")
            ){
               
                HStack {
                    Text("Visit our web site !")
                        .font(.subheadline)
                        .fontWeight(.light)
                  
                    Spacer()
                    Divider()
                    Button(action: {
                        UIApplication.shared.open(URL(string:"http://fortispackaging.com")! as URL, options: [:], completionHandler: nil)
                        
                    }){
                        Image(systemName:"tv")
                            .resizable()
                            .frame(width: 30, height: 30, alignment: .bottomTrailing)
                    }
                }
            }
            
//            Image("back")
//            .resizable()
//                .frame(width: 650, height: 650)
//            .cornerRadius(15)
            
            }
                Form{
                    Text("Ask an Appointment")
                        .font(.title)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                    DatePicker("Pick a date & time: ", selection: $dateSelected, in: Date()...)
                    
                }
            
    }
//                    .background(Image("back").resizable().cornerRadius(15))
    }
    
}


