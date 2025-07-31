//
//  TheBlues.swift
//  MoodMatcher
//
//  Created by Scholar on 7/30/25.
//

import Foundation

import SwiftUI

struct TheBlues: View {
   // NavigationView { ()
    var body: some View {
        ZStack{
            Color(hue: 0.626, saturation: 0.391, brightness: 0.785)
                .ignoresSafeArea()
            VStack {
                
                Text("Welcome to:")
                    .font(.title2)
                    .foregroundColor(Color.white)
                    .padding(0.5)
                
                    //.navigationTitle
                Text("The Blues")
                
                    .font(.title)
                    .foregroundColor(Color.white)
                Text("☹️")
                    .font(.system(size: 70))
                
                    .fontWeight(.bold)
                    .padding(30) // Adjust size of the circle
                    .background(Color(red: 175/255, green: 180/255, blue: 222/255)) // background color of circle
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.black, lineWidth: 1.5) //border of circle
                    )
                
                    .padding(15)
                
                Text("Pick a category below for recommendations:")
                    .font(.title3)
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.center)
                
                ZStack{
                    VStack{
                        //   NavigationLink(destination: SecondView()){
                        Text("Activities")
                            .font(.title3)
                            .foregroundColor(Color.black)
                            .padding()
                            .padding()
                            .background(Rectangle()
                                .foregroundColor(Color(hue: 0.695, saturation: 0.201, brightness: 0.854)))
                            .cornerRadius(15)
                            .shadow(radius:20)
                            .padding()
                        
                        
                        //         NavigationLink(destination: ThirdView()){
                        Text("Songs")
                            .font(.title3)
                            .foregroundColor(Color.black)
                            .padding()
                            .padding()
                            .background(Rectangle()
                                .foregroundColor(Color(red: 0.711, green: 0.681, blue: 0.857)))
                            .cornerRadius(15)
                            .shadow(radius:20)
                            .padding()
                        
                        
                            .padding()
                        //      NavigationLink(destination: FourthView()){
                        Text("Quotes")
                            .font(.title3)
                            .foregroundColor(Color.black)
                            .padding()
                            .padding()
                            .background(Rectangle()
                                .foregroundColor(Color(red: 0.711, green: 0.681, blue: 0.861)))
                            .cornerRadius(15)
                            .shadow(radius:20)
                            .padding()
                        
                    }
                    
                }
                
                    
            }
            .padding()
        }
        
        
    }
}

#Preview {
    TheBlues()
}
