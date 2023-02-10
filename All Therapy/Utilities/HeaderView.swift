//
//  HeaderView.swift
//  All Therapy
//
//  Created by Muskan Jindal on 10/02/23.
//

import SwiftUI

struct HeaderView: View {
    @Binding var showDrawer: Bool
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "line.horizontal.3")
                    .foregroundColor(.white)
                    .padding(10)
                    .onTapGesture {
                        showDrawer = true
                    }
                Spacer()
                Image(systemName: "person")
                    .resizable()
                    .frame(width: 60, height: 60)
                    .foregroundColor(Color.yellow.opacity(0.8))
                    .padding(.trailing, -40)
                Spacer()
                ZStack {
                    Image("avatar")
                        .resizable()
                        .frame(width: 80, height: 40)
                        .clipShape(Circle())
                }
            }
            Spacer()
        }
        .frame(width: UIScreen.main.bounds.width, height: 80)
        .background(Color.BackgroundColor)
    }
}
