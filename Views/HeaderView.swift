//
//  HeaderView.swift
//  ToDoList
//
//  Created by Hy Nguyen on 12/21/23.
//

import SwiftUI

struct HeaderView: View {
    let title: String
    let subtitle: String
    let angle: Double
    let background: Color
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(background)
                .rotationEffect(Angle(degrees: -angle))

            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(background)
                .rotationEffect(Angle(degrees: angle))
                
            VStack{
                Text(title)
                    .font(.system(size: 50))
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .frame(maxWidth: UIScreen.main.bounds.width - 20)
                Text(subtitle)
                    .font(.system(size: 30))
                    .foregroundColor(.white)
                    .fontWeight(.light)
            }
            .padding(.top, 80)

        }
        .offset(y: -95)
        .frame(width: UIScreen.main.bounds.width * 3,
               height: 300)
    }
}

#Preview {
    
    HeaderView(title: "Preview", subtitle: "preview", angle: 15, background: .pink)
}
