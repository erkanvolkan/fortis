//
//  CardView.swift
//  FortisPackaging
//
//  Created by Erkan on 1/29/20.
//  Copyright © 2020 ErkanVolkan. All rights reserved.
//

import SwiftUI

struct CardView: View {
    @State private var translation: CGSize = .zero
    @State private var swipeStatus: LikeDislike = .none
    
    private var user: User
    private var onRemove: (_ user: User) -> Void
    
    private var thresholdPercentage: CGFloat = 1 // when the user has draged 50% the width of the screen in either direction
    
    private enum LikeDislike: Int {
        case like, dislike, none
    }
    
    init(user: User, onRemove: @escaping (_ user: User) -> Void) {
        self.user = user
        self.onRemove = onRemove
    }
    
    /// What percentage of our own width have we swipped
    /// - Parameters:
    ///   - geometry: The geometry
    ///   - gesture: The current gesture translation value
    private func getGesturePercentage(_ geometry: GeometryProxy, from gesture: DragGesture.Value) -> CGFloat {
        gesture.translation.width / geometry.size.width
    }
    
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .leading) {
                 ZStack(alignment: self.swipeStatus == .like ? .topLeading : .topTrailing) {
                    Image(self.user.imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: geometry.size.width, height: geometry.size.height * 0.75)
                        .clipped()
                    
//                    if self.swipeStatus == .like {
//                        Text("LIKE")
//                            .font(.headline)
//                            .padding()
//                            .cornerRadius(10)
//                            .foregroundColor(Color.green)
//                            .overlay(
//                                RoundedRectangle(cornerRadius: 10)
//                                    .stroke(Color.green, lineWidth: 3.0)
//                        ).padding(24)
//                            .rotationEffect(Angle.degrees(-45))
//                    } else if self.swipeStatus == .dislike {
//                        Text("DISLIKE")
//                            .font(.headline)
//                            .padding()
//                            .cornerRadius(10)
//                            .foregroundColor(Color.red)
//                            .overlay(
//                                RoundedRectangle(cornerRadius: 10)
//                                    .stroke(Color.red, lineWidth: 3.0)
//                        ).padding(.top, 45)
//                            .rotationEffect(Angle.degrees(45))
//                    }
                }
                
                HStack {
                    VStack(alignment: .leading) {
                        Text("\(self.user.firstName)")
                            .font(.subheadline)
                            .bold()
                        Text(self.user.occupation)
                            .font(.subheadline)
                            .bold()
                      
                    }
                    Spacer()
                    
                }
                .padding(.horizontal)
            }
            .padding(.bottom)
            .background(Color.init(#colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)))
            .cornerRadius(10)
            .shadow(radius: 5)
            .animation(.interactiveSpring())
            .offset(x: self.translation.width, y: 0)
            .rotationEffect(.degrees(Double(self.translation.width / geometry.size.width) * 120), anchor: .bottomTrailing)
//            .rotationEffect(.degrees(Double(self.translation.width / geometry.size.width) * 180), anchor: .bottom)
            .gesture(
                DragGesture()
                    .onChanged { value in
                        self.translation = value.translation
                        
//                        if (self.getGesturePercentage(geometry, from: value)) >= self.thresholdPercentage {
//                            self.swipeStatus = .like
//                        } else if self.getGesturePercentage(geometry, from: value) <= self.thresholdPercentage {
//                            self.swipeStatus = .dislike
//                        } else {
//                            self.swipeStatus = .none
//                        }
//
                }
//                .onEnded { value in
//                    // determine snap distance > 0.5 aka half the width of the screen
//                        if abs(self.getGesturePercentage(geometry, from: value)) > self.thresholdPercentage {
//                            self.onRemove(self.user)
//                        } else {
//                            self.translation = .zero
//
//                        }
//                    }
            )
        }
    }
}
