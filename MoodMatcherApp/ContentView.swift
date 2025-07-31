//
//  ContentView.swift
//  MoodMatcher
//
//  Created by Scholar on 7/28/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color(red: 240/255, green: 230/255, blue: 220/255)
                .ignoresSafeArea()
            
            VStack {
                Text("BYE MOOD")
                 //   .font(.system(size: 45, weight: .bold, design: .rounded))
                    .foregroundColor(Color(hue: 0.093, saturation: 0.921, brightness: 0.261))
                    .padding(.horizontal, 10.0)
                    .shadow(radius: 15)
                    .font(Font.custom("Most Sky", size: 60))
            Text( "MATCHER")
             //   .font(.system(size: 45, weight: .bold, design: .rounded))
                    .foregroundColor(Color(red: 0.263, green: 0.152, blue: 0.018))
                .padding(.horizontal, 10.0)
                .shadow(radius: 15)
                .font(Font.custom("Most Sky", size: 60))
                    VStack {
                        HStack {
                            Text("Cloud 9 😇")
                                .multilineTextAlignment(.center)
                                .padding()
                                .font(Font.custom("BRADLEY", size: 40))
                                .fontWeight(.heavy)
                                .foregroundColor(Color(red: 0.263, green: 0.152, blue: 0.018))
                                .padding(.horizontal, 10.0)
                                .frame(width: 175.0, height: 175.0)
                                .background(Color(red: 0.9176470588235294, green: 0.47058823529411764, blue: 0.34509803921568627))
                                .cornerRadius(10)
                                .shadow(radius: 15)
                                .clipShape(Circle())
                            
                            Text("In The Zone 😎")
                                .multilineTextAlignment(.center)
                                .padding()
                                .font(Font.custom("BRADLEY", size: 40))
                                .fontWeight(.heavy)
                                .foregroundColor(Color(red: 0.263, green: 0.152, blue: 0.018))
                                .padding(.horizontal, 10.0)
                                .frame(width: 175.0, height: 175.0)
                                .background(Color(red: 0.6392156862745098, green: 0.7607843137254902, blue: 0.5137254901960784))
                                .cornerRadius(10)
                                .shadow(radius: 15)
                                .clipShape(Circle())
                        }
                    }
                    
                    VStack {
                        HStack {
                            Text("Brain Fog 😵‍💫")
                                .multilineTextAlignment(.center)
                                .padding()
                                .font(Font.custom("BRADLEY", size: 40))
                                .fontWeight(.heavy)
                                .foregroundColor(Color(red: 0.263, green: 0.152, blue: 0.018))
                                .padding(.horizontal, 10.0)
                                .frame(width: 175.0, height: 175.0)
                                .background(Color(red: 0.9294117647058824, green: 0.7450980392156863, blue: 0.8941176470588236))
                                .cornerRadius(10)
                                .shadow(radius: 15)
                                .clipShape(Circle())
                            
                            Text("The Blues ☹️")
                                .multilineTextAlignment(.center)
                                .padding()
                                .font(Font.custom("BRADLEY", size: 40))
                                .fontWeight(.heavy)
                                .foregroundColor(Color(red: 0.263, green: 0.152, blue: 0.018))
                                .padding(.horizontal, 10.0)
                                .frame(width: 175.0, height: 175.0)
                                .background(Color(hue: 0.626, saturation: 0.391, brightness: 0.785))
                                .cornerRadius(10)
                                .shadow(radius: 15)
                                .clipShape(Circle())
                        }
                    }
                    .padding(10.0)
                    .padding()
                    
                    VStack {
                        Text("Take Mood Quiz")
                            .font(Font.custom("BRADLEY", size: 23))
                            .fontWeight(.heavy)
                            .foregroundColor(Color.white)
                            .padding(.horizontal, 10.0)
                            .frame(width: 220.0, height: 40.0)
                            .background(Color(hue: 0.91, saturation: 0.451, brightness: 0.568))
                            .cornerRadius(10)
                            .shadow(radius: 15)
                }
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
