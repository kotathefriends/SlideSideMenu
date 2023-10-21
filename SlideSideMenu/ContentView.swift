//
//  ContentView.swift
//  SlideSideMenu
//
//  Created by KOTA TAKAHASHI on 2023/10/21.
//

import SwiftUI

struct ContentView: View {
    @State var show: Bool = false
    
    var body: some View {
        ZStack {
            GeometryReader { _ in
                VStack {
                    ZStack {
                        HStack {
                            Button(action: {
                                withAnimation {
                                    show.toggle()
                                }
                            }, label: {
                                Image(systemName: "list.dash")
                                    .font(.title)
                                    .padding(.trailing, 13)
                            })
                            
                            Spacer()
                            
                            Text("Home")
                        }
                        .padding()
                        .overlay(Rectangle().stroke(Color.gray.opacity(0.08), lineWidth: 1).shadow(radius: 1).edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/))
                        
                        Spacer()
                    }
                }
                HStack {
                    Menu(show: $show)
                        .offset(x: show ? 0 : -UIScreen.main.bounds.width / 1.4, y: 0)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
 }

struct Menu: View {
    @Binding var show: Bool
    
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    HStack {
                        Button(action: {
                            
                        }, label: {
                            Image("avatar")
                                .resizable()
                                .frame(width: 70, height: 70)
                        })
                        
                        Spacer()
                        
                        Button(action: {
                            withAnimation {
                                show.toggle()
                            }
                        }, label: {
                            Image(systemName: "arrow.left")
                                .font(.title)
                                .foregroundColor(.black)
                        })
                    }
                    Text("Username")
                        .font(.title2).bold()
                    
                    Text("@Username")
                        .padding(.bottom, 10)
                    
                    HStack {
                        Text("100")
                            .font(.none).bold()
                        Text("Following")
                        
                        Text("100")
                            .font(.none).bold()
                        Text("Followers")
                    }
                    .padding(.bottom, 20)
                    
                    MenuItem(systemName: "person", title: "Profile")
                    MenuItem(systemName: "list.dash", title: "Lists")
                    MenuItem(systemName: "text.bubble", title: "Topics")
                    MenuItem(systemName: "book", title: "Bookmarks")
                    MenuItem(systemName: "doc.text.below.ecg", title: "Moments")
                    
                    Divider()
                }
            }
            .padding(.top)
            .padding(.bottom, 25)
            
            VStack(alignment: .leading) {
                Text("Settings and Privacy")
                    .font(.title2)
                    .padding(.bottom, 30)
                
                Text("Help Centar")
                    .font(.title2)
            }
            .padding(.trailing, 35)
            
            Spacer()
        }
        .padding(.horizontal, 20)
        .frame(width: UIScreen.main.bounds.width / 1.4)
        .background(Color.white.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/))
        .overlay(Rectangle().stroke(Color.gray.opacity(0.08), lineWidth: 1).shadow(radius: 1).edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/))
    }
    
    struct MenuItem: View {
        var systemName: String = ""
        var title: String = ""
        
        var body: some View {
            HStack {
                Image(systemName: systemName)
                    .font(.title)
                    .padding(.trailing, 13)
                    .frame(width: 45, height: 35, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                
                Text(title)
                    .font(.title2)
            }
            .padding(.bottom, 30)
        }
    }
}
