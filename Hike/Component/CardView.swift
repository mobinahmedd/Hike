//
//  CardView.swift
//  Hike
//
//  Created by Apptycoons on 30/03/2024.
//

import SwiftUI

struct CardView: View {
    
    // MARK: - PROPERTIES
    
    @State private var imageNumber: Int = 1
    @State private var randomNumber: Int = 1
    @State private var isShowingSettingsSheet: Bool = false
    
    // MARK: - FUNCTIONS
    
    func randomImage() {
        repeat{
            randomNumber = Int.random(in: 1...5)
        }while randomNumber == imageNumber
        
        imageNumber = randomNumber
    }
    
    var body: some View {
        ZStack {
            CustomBackgroundView()
            VStack {
                
                // MARK: HEADER
                
                VStack(alignment: .leading) {
                    HStack() {
                        Text("Hiking")
                            .fontWeight(.black)
                            .font(.system(size: 52))
                            .foregroundStyle(
                                LinearGradient(colors: [
                                    .customGrayLight,
                                    .customGrayMedium
                                ],
                                               startPoint: .top,
                                               endPoint: .bottom
                                )
                            )
                        
                        Spacer()
                        
                        Button(action: {
                            // Show a Sheet
                            isShowingSettingsSheet.toggle()
                        }, label: {
                            CustomButtonView()
                        }
                        ).sheet(isPresented: $isShowingSettingsSheet, content: {
                            SettingsView()
                                .presentationDragIndicator(.visible)
                                .presentationDetents([
                                    .medium,.large]
                                )
                        })
                    }
                    
                    Text("Fun and enjoyable outdoor activity for friends and families")
                        .multilineTextAlignment(.leading)
                        .foregroundColor(.customGrayMedium)
                        .italic()
                } //: HEADER
                .padding(.horizontal,30 )
                
                // MARK: - MAIN CONTENT
                
                ZStack {
                 CustomCircleView()
                    Image("image-\(imageNumber)")
                        .resizable()
                        .scaledToFit()
//                        .animation(/*@START_MENU_TOKEN@*/.easeIn/*@END_MENU_TOKEN@*/ (duration: 1), value: imageNumber)
                        .animation(.default, value: imageNumber)
                }
                
                // MARK: FOOTER
                
                Button(action: {
                    // ACTION : Generate a random number
                    randomImage()
                }, label: {
                    Text("Explore More")
                        .font(.title2)
                        .fontWeight(.heavy)
                        .foregroundStyle(
                            LinearGradient(
                                colors: [
                                    .customGreenLight,
                                    .customGreenMedium
                                ],
                                startPoint: .top,
                                endPoint: .bottom
                            )
                        )
                        .shadow(
                            color: .black.opacity(0.25) ,
                            radius: 10.25,
                            x:1,
                            y:2
                        )
                }
                )// : BUTTON
                .buttonStyle(GradientButton())
                
                
            }
        }//: CARD
        .frame(width: 320, height: 590)
    }
}

#Preview {
    CardView()
}
