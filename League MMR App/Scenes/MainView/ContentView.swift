//
//  ContentView.swift
//  League MMR App
//
//  Created by Clayton Watkins on 12/23/21.
//

import SwiftUI

struct ContentView: View {
    @State var summonerName = ""
    @ObservedObject var vm: SummonerMMRViewModel = SummonerMMRViewModel(fetchService: FetchService())
    
    var body: some View {
        NavigationView {
            VStack(spacing: 30) {
                Text("Summoner Name:")
                    .padding(.top, 10)
                TextField("Enter summoner name", text: $summonerName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width: 350, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                Button("Get My MMR!") {
                    print("Getting Summoner MMR")
                    vm.summonerName = self.summonerName
                    vm.getMMR()
                }
                Text("Normal MMR: \(vm.normalMMR)")
                Text("Ranked MMR: \(vm.rankedMMR)")
                Spacer()
            }
            .navigationBarTitle("What's my MMR?")
            .navigationBarItems(trailing: SettingsButton())
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
