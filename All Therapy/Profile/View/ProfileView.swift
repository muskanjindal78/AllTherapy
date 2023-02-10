//
//  ProfileView.swift
//  All Therapy
//
//  Created by Muskan Jindal on 09/02/23.
//

import SwiftUI

struct ProfileView: View {
    @Binding var showDrawer: Bool
    var body: some View {
        VStack {
            HeaderView(showDrawer: $showDrawer)
            Text("Profile View!")
            Spacer()
        }
    }
}
