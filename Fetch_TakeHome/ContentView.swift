//
//  ContentView.swift
//  Fetch_TakeHome
//
//  Created by Yogesh Vishwanathan on 2/5/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        MealListView(viewModel: MealListViewModel())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
