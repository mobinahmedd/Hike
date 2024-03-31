//
//  CustomListRowView.swift
//  Hike
//
//  Created by Apptycoons on 30/03/2024.
//

import SwiftUI

struct CustomListRowView: View {
    // MARK: -PROPERTIES
    
    @State var rowLabel: String
    @State var rowIcon: String
    @State var rowContent: String? = nil
    @State var rowTintColor: Color
    @State var rowLinkLabel: String? = nil
    @State var rowLinkDestination: String? = nil
    
    var body: some View {
        LabeledContent(
            content: {
                if rowContent != nil {
                    Text(rowContent!)
                } else if rowLinkLabel != nil && rowLinkDestination != nil {
                    Link(rowLinkLabel!,destination : URL(string: rowLinkDestination!)!)
                        .foregroundColor(.pink)
                        .underline()
                }
            },
            label: {
                HStack{
                    ZStack {
                        RoundedRectangle(cornerRadius: 8)
                            .foregroundColor(rowTintColor)
                            .frame(width: 30,height: 30)
                        
                        Image(systemName : rowIcon)
                            .foregroundColor(.white)
                        
                    }
                    .frame(width: 40)
                    Text(rowLabel)
                }
            }
        )
    }
}

#Preview {
    List {
        CustomListRowView(
            rowLabel: "Website",
            rowIcon: "globe",
            rowContent: nil,
            rowTintColor: .pink,
            rowLinkLabel: "Website Link",
            rowLinkDestination : "http://credo.academy"
        )
    }
}
