//
//  SearchView.swift
//  All Therapy
//
//  Created by Muskan Jindal on 09/02/23.
//

import SwiftUI

struct SearchView: View {
    @ObservedObject var searchViewModel = SearchViewModel()
    @Binding var showDrawer: Bool
    
    var body: some View {
        VStack {
            HeaderView(showDrawer: $showDrawer)
            Text("Select a Therapy")
            ScrollView(showsIndicators: false) {
                if let tempTherapyList = searchViewModel.therapyList, let therapyList = filterActiveTherapyList(tempTherapyList) {
                    let rowCount = (Double(therapyList.count) / Double(3)).rounded(.up)
                    ForEach(0..<Int(rowCount), id: \.self) { row in
                        VStack{
                            HStack() {
                                ForEach(0..<3, id: \.self) { column in
                                    let index = row * 3 + column
                                    if index < therapyList.count {
                                        NavigationLink(destination: EmptyView()) {
                                            ZStack {
                                                VStack(alignment: .center, spacing: 10) {
                                                    ImageView(withURL: therapyList[index].profile ?? "")
                                                }
                                                VStack {
                                                    Spacer()
                                                    if let name = therapyList[index].name as? String {
                                                        Text("\(name)")
                                                            .foregroundColor(Color.white)
                                                            .padding(.bottom, 10)
                                                    }
                                                }
                                            }
                                        }
                                    } else {
                                        Spacer()
                                    }
                                }
                            }
                            .frame(width: UIScreen.main.bounds.width)
                        }
                        .scaledToFit()
                    }
                }
            }
        }
        .onAppear {
            searchViewModel.getTherapyList()
        }
    }
    
    func filterActiveTherapyList(_ therapyList: [SearchModel]) -> [SearchModel]? {
        var tempTherapyList: [SearchModel] = []
        for temp in therapyList {
            if temp.status?.lowercased() == "active" {
                tempTherapyList.append(temp)
            }
        }
        return tempTherapyList
    }
}
