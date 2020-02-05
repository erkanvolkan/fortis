//
//  GalleryView.swift
//  FortisPackaging
//
//  Created by Erkan on 1/27/20.
//  Copyright © 2020 ErkanVolkan. All rights reserved.
//

import SwiftUI
struct User: Hashable, CustomStringConvertible {
    var id: Int
    
    let firstName: String
    let age: Int
    let mutualFriends: Int
    let imageName: String
    let occupation: String
    
    var description: String {
        return "\(firstName), id: \(id)"
    }
}


struct galleryView: View {
    
    @State var users: [User] = [
        User(id: 0, firstName: "Bubble Wrap Machine", age: 23, mutualFriends: 1, imageName: "machine", occupation: "Full Automated"),
        User(id: 1, firstName: ("Laminated Rolls\n" + "Kraft, Metalized & Poly"), age: 27, mutualFriends: 0, imageName: "luminated2", occupation: "Tell us how you need your bubble roll in what size."),
        User(id: 2, firstName: ("Laminated Rolls\n" + "Kraft, Metalized & Poly"), age: 20, mutualFriends: 1, imageName: "luminated1", occupation: "Only tell us how you need your bubble roll in what size."),
        User(id: 3, firstName: ("Bubble Pouches\n" + "Available in all sizes"), age: 19, mutualFriends: 4, imageName: "pouches3", occupation: "Available Pink Anti-Static"),
        User(id: 4, firstName: ("Bubble Pouches\n" + "Available in all sizes"), age: 22, mutualFriends:18, imageName: "pouches2", occupation: "Available Pink Anti-Static"),
        User(id: 5, firstName: ("Bubble Pouches\n" + "Available in all sizes"), age: 24, mutualFriends: 3, imageName: "pouches", occupation: "Available Pink Anti-Static"),
        User(id: 6, firstName: ("Bubble Cushions\n" + "3/16 " + "5/16 " + "1/2 inc" + " Bubble Size"), age: 25, mutualFriends: 16, imageName: "bubbleC3", occupation: ("125ft, 250 ft, 500 ft, 750 ft long rolls" + "\nPerforated & Non-perforated")),
        User(id: 7, firstName: ("Bubble Cushions\n" + "3/16 " + "5/16 " + "1/2 inc" + " Bubble Size"), age: 29, mutualFriends: 9, imageName: "bubbleC4", occupation: ("125ft, 250 ft, 500 ft, 750 ft long rolls" + "\nPerforated & Non-perforated")),
        User(id: 8, firstName: ("Bubble Cushions\n" + "3/16 " + "5/16 " + "1/2 inc" + " Bubble Size"), age: 23, mutualFriends: 5, imageName: "bubbleC", occupation: ("125ft, 250 ft, 500 ft, 750 ft long rolls" + "\nPerforated & Non-perforated")),
        User(id: 9, firstName: ("Bubble Cushions\n" + "3/16 " + "5/16 " + "1/2 inc" + " Bubble Size"), age: 28, mutualFriends: 13, imageName: "bubbleC2", occupation: ("125ft, 250 ft, 500 ft, 750 ft long rolls" + "\nPerforated & Non-perforated"))
    ]
    
    /// Return the CardViews width for the given offset in the array
    /// - Parameters:
    ///   - geometry: The geometry proxy of the parent
    ///   - id: The ID of the current user
    private func getCardWidth(_ geometry: GeometryProxy, id: Int) -> CGFloat {
        let offset: CGFloat = CGFloat(users.count - 1 - id) * 9
//        let offset: CGFloat = CGFloat(users.count - 1 - id) * 10
        return geometry.size.width - offset
    }
    
    /// Return the CardViews frame offset for the given offset in the array
    /// - Parameters:
    ///   - geometry: The geometry proxy of the parent
    ///   - id: The ID of the current user
    private func getCardOffset(_ geometry: GeometryProxy, id: Int) -> CGFloat {
        return  CGFloat(users.count - 1 - id) * 2
    
    }
    
    private var maxID: Int {
        return self.users.map { $0.id }.max() ?? 0
    }
    
    public var body: some View {
        VStack {
                    GeometryReader { geometry in
                        LinearGradient(gradient: Gradient(colors: [Color.init(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)), Color.init(#colorLiteral(red: 1, green: 0.9882352941, blue: 0.862745098, alpha: 1))]), startPoint: .bottom, endPoint: .top)
                            .frame(width: geometry.size.width * 1.5, height: geometry.size.height)
                            .background(Color.blue)
                            .clipShape(Circle())
                            .offset(x: -geometry.size.width / 4, y: -geometry.size.height / 2)
                        
                        VStack(spacing: 12) {
                            HeadView()
                            ZStack {
                                ForEach(self.users, id: \.self) { user in
                                    Group {
                                        // Range Operator
                                        if (self.maxID - 10)...self.maxID ~= user.id {
                                            CardView(user: user, onRemove: { removedUser in
                                                // Remove that user from our array
                                                self.users.removeAll { $0.id == removedUser.id }
                                            })
                                                .animation(.spring())
                                                .frame(width: self.getCardWidth(geometry, id: user.id), height: 400)
                                                .offset(x: 0, y: self.getCardOffset(geometry, id: user.id))
                                        }
                                    }
                                }
                            }
                            Spacer()
                        }
                    }
                }.padding()
            }
        }

        struct HeadView: View {
            var body: some View {
                VStack {
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Product Tour")
                                .font(.headline)
                                .bold()
                            Divider()
                            Text("2019 - 2020")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                        Spacer()
                    }.padding()
                }
                .background(Color.init(#colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)))
                .cornerRadius(10)
                .shadow(radius: 25)
            }
        }

    

