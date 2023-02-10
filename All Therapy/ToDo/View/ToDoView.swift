//
//  ToDoView.swift
//  All Therapy
//
//  Created by Muskan Jindal on 09/02/23.
//

import SwiftUI

struct ToDoView: View {
    @Binding var showDrawer: Bool
    var body: some View {
        VStack {
            HeaderView(showDrawer: $showDrawer)
            Text("To Do View!")
            Spacer()
        }
    }
}
