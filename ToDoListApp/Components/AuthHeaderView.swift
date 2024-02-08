//
//  AuthHeader.swift
//  ToDoListApp
//
//  Created by Le Hieu on 08/02/2024.
//

import SwiftUI

struct AuthHeaderView: View {
    
    let title: String
    let subTitle: String
    let backgroundColor: Color?
    let degreeAngle: Double
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(backgroundColor)
                .rotationEffect(Angle(degrees: degreeAngle))
           
            VStack {
                Text(title)
                    .foregroundColor(Color.white)
                    .font(.system(size: 50))
                    .bold()
                Text(subTitle)
                    .foregroundColor(Color.white)
                    .font(.system(size: 30))
                    .bold()
            }
            .padding(.top, 40)
              
        }
        .frame(width: UIScreen.main.bounds.width * 3, height: 250)
        .offset(y: -100)
    }
}

struct AuthHeader_Previews: PreviewProvider {
    static var previews: some View {
        AuthHeaderView(
            title: "",
            subTitle: "",
            backgroundColor: Color.blue,
            degreeAngle: 15)
    }
}
