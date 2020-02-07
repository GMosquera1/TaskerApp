//
//  ContentView.swift
//  Tasker
//
//  Created by Genesis Mosquera on 1/13/20.
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
//struct ContentView: View {
//
//    var body: some View {
//
//        VStack {
//            //Map
//            MapView()
//                .frame(height:300)
//                .edgesIgnoringSafeArea(.top)
//
//            //Image
//            CircleImage()
//                .offset(y: -130)
//                .padding(.bottom, -130)
//
//            Button(action: {
//            //    self.delete
//               // ListView()
//                 //   .edgesIgnoringSafeArea(.all)
////                print("Button tapped!")
//            }) {
//                Text ("2020")
//                    .background(LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]), startPoint: .top, endPoint: .bottom))
//                    .foregroundColor(.yellow)
//                    .font(.title)
//            }
//
//            //TextViews
//            VStack(alignment: .leading) {
//                Text("DECLARATION")
//                    .font(.title)
//                HStack {
//                    Text("CROSSOVER 2020!")
//                        .font(.subheadline)
//                    Spacer()
//                    Text("EPHESIANS 3:20")
//                    Text("Make the vision plain for all to see")
//                }
//            }.padding()
//
//            // Spacer
//            Spacer()
//        }
//    }
//}
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
//
//struct DetailView: View {
//    let value: String
//    let onDone: () -> Void
//
//    var body : some View {
//        VStack {
//            Text("Full View: \(value)")
//            Button(action: onDone, label: {Text("Back")})
//        }
//    }
//    struct ContentView: View {
//        @State var displaySubview = false
//
//        var body: some View {
//            VStack {
//                if displaySubview {
//                    DetailView(value: "Hello World") {
//                        self.displaySubview = false
//                    }
//                } else {
//                    Button(action: {
//                        self.displaySubview = true
//                    }, label: { Text("Click Me") })
//                }
//            }
//        }
//    }
//}
//
//


//struct DetailView: View {
//    let value: String
//    let onDone: () -> Void
//
//    var body : some View {
//        VStack {
//            Text("Full View: \(value)")
//            Button(action: onDone, label: {Text("Back")})
//        }
//    }
//    struct ContentView: View {
//        @State var displaySubview = false
//
//        var body: some View {
//            VStack {
//                if displaySubview {
//                    DetailView(value: "Hello World") {
//                        self.displaySubview = false
//                    }
//                } else {
//                    Button(action: {
//                        self.displaySubview = true
//                    }, label: { Text("Click Me") })
//                }
//            }
//        }
//    }
//}
//
//
