//
//  TDLButton.swift
//  ToDoList
//
//  Created by Hy Nguyen on 12/21/23.
//

import SwiftUI

struct TDLButton: View {
    let title: String
    let background: Color
    let textColor: Color
    let action: () -> Void
    
    init(title: String, background: Color, textColor: Color? = nil, action: @escaping () -> Void = {}) {
        self.title = title
        self.background = background
        self.textColor = textColor ?? .white
        self.action = action
    }

    var body: some View {
        Button {
            action()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(background)
                Text(title)
                    .foregroundColor(textColor)
                    .font(.system(size: 20))
                    .fontWeight(.bold)
            }
        }
        .padding(.vertical, 10)
    }
}

#Preview {
    TDLButton(title: "Log In", background: .pink, textColor: Color.white)
}
