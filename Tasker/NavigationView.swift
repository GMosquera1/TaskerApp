//
//  NavigationView.swift
//  Tasker
//
//  Created by Genesis Mosquera on 2/7/20.
//  Copyright © 2020 Genesis Mosquera. All rights reserved.
//

import SwiftUI
import Combine

enum MyAppPage {
    case Menu
    case SecondPage
}
final class MyAppEnvironmentData: ObservableObject {
    @Published var currentPage: MyAppPage? = .Menu
}

struct NavigationTest: View {
    var body: some View {
        NavigationView {
            PageOne()
        }
    }
}

struct PageOne: View {
    @EnvironmentObject var env: MyAppEnvironmentData
    
    var body: some View {
        let navLink = NavigationLink(destination: PageTwo(),
                                     tag: .SecondPage,
                                     selection: $env.currentPage,
                                     label: {EmptyView() })
        return VStack {
            Text("Page One").font(.largeTitle).padding()
            
            navLink
                .frame(width:0, height:0)
            Button("Button") {
                self.env.currentPage = .SecondPage
            }
        .padding()
            .border(Color.primary)
        }
    }
}

struct PageTwo: View {
    @EnvironmentObject var env: MyAppEnvironmentData
    
    var body: some View {
        VStack {
            Text("Page Two").font(.largeTitle).padding()
            Text("Go Back")
            .padding()
                .border(Color.primary)
                .onTapGesture {
                    self.env.currentPage = .Menu
            }
        }.navigationBarBackButtonHidden(true)
    }
}

#if DEBUG
struct NavigationTest_Previews: PreviewProvider {
    static var previews: some View {
        NavigationTest().environmentObject(MyAppEnvironmentData())
    }
}
#endif
