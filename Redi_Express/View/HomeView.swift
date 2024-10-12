//
//  HomeView.swift
//  Redi_Express
//
//  Created by user on 12.10.2024.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView{
            VStack(alignment: .center){
                Text("Hello")
                    .font(.custom("Roboto-Italic", size: 14))
            }
        }
    }
}

#Preview {
    HomeView()
}
