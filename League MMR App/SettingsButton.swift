//
//  SettingsButton.swift
//  League MMR App
//
//  Created by Clayton Watkins on 12/23/21.
//

import SwiftUI

struct SettingsButton: View {
    var body: some View {
        Button {
          print("I'm currently useless!")
        } label: {
//            Label("Settings", systemImage: gearshape.fill )
            Image(systemName: "gearshape.fill")
                .resizable()
                .frame(width: 30, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        }
    }
}

struct SettingsButton_Previews: PreviewProvider {
    static var previews: some View {
        SettingsButton()
    }
}
