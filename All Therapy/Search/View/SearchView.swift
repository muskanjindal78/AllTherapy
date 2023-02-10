//
//  SearchView.swift
//  All Therapy
//
//  Created by Muskan Jindal on 09/02/23.
//

import SwiftUI

struct SearchView: View {
    @ObservedObject var searchViewModel = SearchViewModel()
    
    var body: some View {
        VStack {
            VStack {
                Text("Header")
                Spacer()
            }
            .frame(width: UIScreen.main.bounds.width, height: 80)
            .background(Color.BackgroundColor)
            Text("Select a Therapy")
            ScrollView(showsIndicators: false) {
                if let tempTherapyList = searchViewModel.therapyList, let therapyList = filterActiveTherapyList(tempTherapyList) {
                    let rowCount = (Double(therapyList.count) / Double(3)).rounded(.up)
                    ForEach(0..<Int(rowCount), id: \.self) { row in
                        VStack(){
                            HStack() {
                                ForEach(0..<3, id: \.self) { column in
                                    let index = row * 3 + column
                                    if index < therapyList.count {
                                        NavigationLink(destination: EmptyView()) {
                                            ZStack {
                                                ImageView(withURL: therapyList[index].profile ?? "")
                                                    .cornerRadius(15)
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
//                            .fixedSize(horizontal: false, vertical: true)
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
