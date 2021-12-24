//
//  ContentView.swift
//  League MMR App
//
//  Created by Clayton Watkins on 12/23/21.
//

import SwiftUI

struct ContentView: View {
    @State var summonerName = ""
    @ObservedObject var vm: SummonerMMRViewModel = SummonerMMRViewModel()
    
    
    var body: some View {
        NavigationView {
            VStack(spacing: 5){
                Text("Summoner Name:")
                    .padding(.top, 10)
                TextField("Enter summoner name", text: $summonerName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width: 350, height: 120, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                Button("Submit") {
                    print("Getting Summoner MMR")
                }
                
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
