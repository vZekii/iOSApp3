//
//  ProfileView.swift
//  Recipes
//
//  Created by Zach Clare on 15/5/2022.
//

import SwiftUI


struct ProfileView: View {
    // A simple profile page showing options that we will add in future versions.
    @State var displayMode: Int = 0
    @State var dietaryreq: Int = 0
    @State var showonly: Bool = true
    @State var topup: Bool = false

    var displaymodes = ["Light", "Dark", "System Setting"]
    var dietaryreqs = ["Vegan", "Gluten Free", "Vegetarian"]

    var body: some View {
        NavigationView {
            Form {
                VStack {
                    HStack {
                        Image(systemName: "person.crop.circle")
                            .font(.system(size: 40))
                            .foregroundColor(.gray)
                        Text("Joe Biden")
                            .font(.headline)
                        Spacer()
                    }
                }
                
                Section(header: Text("Recipe Settings"), content: {
                    Picker(selection: $dietaryreq, label: Text("Dietary Requirement")) {
                        ForEach(0 ..< dietaryreqs.count) {
                            Text(self.dietaryreqs[$0])
                        }
                    }
                    Toggle(isOn: $showonly) {
                        Text("Only show dietary recipes")
                    }
                })
                
                Section(header: Text("Ingredient Settings"), content: {
                    Toggle(isOn: $topup) {
                        Text("Auto topup ingredients")
                    }
                })

                Section(header: Text("Display"), content: {
                    Picker(selection: $displayMode, label: Text("Display Mode")) {
                        ForEach(0 ..< displaymodes.count) {
                            Text(self.displaymodes[$0])
                        }
                    }
                })
            }
            .navigationTitle("Profile")

            
        Spacer()

        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
