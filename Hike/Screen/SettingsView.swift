    //
    //  SettingsView.swift
    //  Hike
    //
    //  Created by Apptycoons on 30/03/2024.
    //

import SwiftUI

struct SettingsView: View {
        // MARK: - PROPERTIES
    private let alternateAppIcons: [String] = [
        "AppIcon-MagnifyingGlass",
        "AppIcon-Map",
        "AppIcon-Mushroom",
        "AppIcon-Camera",
        "AppIcon-Backpack",
        "AppIcon-Campfire"
    ]
    
    var body: some View {
        
        List{
                // MARK: - SECTION: HEADER
            
            Section{
                HStack {
                    Spacer()
                    
                    Image(systemName: "laurel.leading")
                    
                        .font(.system(size: 80,weight: .black))
                    VStack(spacing:-10) {
                        Text("Hike")
                            .font(.system(size: 66,weight: .black))
                        
                        Text("Editors' Choice")
                            .fontWeight(.medium)
                    }
                    
                    Image(systemName: "laurel.trailing")
                        .font(.system(size: 80,weight: .black))
                    
                    Spacer()
                }
                .foregroundStyle(LinearGradient(colors: [.customGreenLight,.customGreenMedium,.customGreenDark], startPoint: .top, endPoint: .bottom))
                
                VStack(spacing:8) {
                    Text("Where can you find perfect tracks?")
                        .font( .title2)
                        .fontWeight(.heavy)
                    
                    Text("The Hike whick looks gorgeous in photos but is even better once you are actually there. The hike that you hope to do again someday. \n Find the best day hikes in the app")
                        .font(.footnote)
                        .italic()
                    
                    Text("Dust off the Boots! It's time for a walk.")
                        .fontWeight(.heavy)
                        .foregroundColor(.customGreenMedium)
                    
                }.multilineTextAlignment(.center)
                    .padding(.bottom,16)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
            }//: HEADER
            .listRowSeparator(.hidden)
            
            
            
                // MARK: - SECTION: ICONS
            
            Section(header: Text("Alternate Icons")){
                
                ScrollView(.horizontal,showsIndicators: false){
                    
                    HStack(spacing:12) {
                        ForEach(alternateAppIcons.indices, id: \.self) { item in
                            
                            Button(action: {
                                
                                UIApplication.shared.setAlternateIconName(alternateAppIcons[item]){ error in
                                    if error != nil {
                                        print("Failed to update the app's icon: \(String(describing: error?.localizedDescription))")
                                    }else{
                                        print("Success! You have changed the app's icon to \(alternateAppIcons[item])")
                                    }
                                }
                                
                                print("\(alternateAppIcons[item]) pressed")
                            }, label: {
                                Image("\(alternateAppIcons[item])-Preview")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80,height: 80)
                                    .cornerRadius(16)
                            }
                            )
                            .buttonStyle(.borderless)
                            
                        }
                    }
                    
                } //: SCROLLVIEW
                .padding(.top,12)
                
                Text("Choose your favourite app icon from the collection above.")
                    .multilineTextAlignment(.center)
                    .font(.footnote)
                    .foregroundColor(.secondary)
                    .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/,maxWidth: .infinity)
                    .padding(.bottom,12)
                
            }
            .listRowSeparator(.hidden)
            
                // MARK: - SECTION: ABOUT
            Section(
                header: Text("ABOUT THE APP"),
                footer: HStack{
                    Spacer()
                    Text("Copyright © All right reserved")
                    Spacer()
                }
                    .padding(.vertical,8)
            ){
                    // 1. BASIC LABELED CONTENT
                    //                LabeledContent("Application", value: "Hike")
                
                    // 2. ADVANCED LABELLED CONTENT
                CustomListRowView(rowLabel: "Application", rowIcon: "apps.iphone", rowContent: "Hike", rowTintColor: .blue)
                
                CustomListRowView(rowLabel: "Compatibility", rowIcon: "apps.iphone", rowContent: "iOS,IPadOS", rowTintColor: .red)
                
                CustomListRowView(rowLabel: "Technology", rowIcon: "swift", rowContent: "Swift", rowTintColor: .orange)
                
                CustomListRowView(rowLabel: "Version", rowIcon: "gear", rowContent: "1.0.0", rowTintColor: .purple)
                
                CustomListRowView(rowLabel: "Deveoloper", rowIcon: "ellipsis.curlybraces", rowContent: "Mobin Ahmed", rowTintColor: .mint)
                
                CustomListRowView(rowLabel: "Designer", rowIcon: "paintpalette", rowContent: "John Doe", rowTintColor: .pink)
                
                CustomListRowView(rowLabel: "Credo Academy", rowIcon: "globe", rowTintColor: .indigo, rowLinkLabel:"Credo Academy", rowLinkDestination: "https://credo.academy")
            }
        }
    }
}

#Preview {
    SettingsView()
}
