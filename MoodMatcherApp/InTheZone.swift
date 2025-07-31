//
//  InTheZone.swift
//  MoodMatcher
//
//  Created by Scholar on 7/29/25.
//

import Foundation


import SwiftUI

struct InTheZone: View {
   // NavigationView { ()
    var body: some View {
        ZStack{
            Color(red: 0.6392156862745098, green: 0.7607843137254902, blue: 0.5137254901960784)
                .ignoresSafeArea()
            VStack {
                
                Text("Welcome to:")
                    .font(.title2)
                    .padding(0.5)
                
                    //.navigationTitle
                Text("In The Zone")
                
                    .font(.title)
                Text("😎")
                    .font(.system(size: 70))
                
                    .fontWeight(.bold)
                    .padding(30) // Adjust size of the circle
                    .background(Color(hue: 0.248, saturation: 0.339, brightness: 0.896)) // background color of circle
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.black, lineWidth: 1.5) //border of circle
                    )
                
                    .padding(15)
                
                Text("Pick a category below for recommendations:")
                    .font(.title3)
                    .multilineTextAlignment(.center)
                
                ZStack{
                    VStack{
                        //   NavigationLink(destination: SecondView()){
                        Text("Activities")
                            .font(.title3)
                            .foregroundColor(Color.white)
                            .padding()
                            .padding()
                            .background(Rectangle()
                                .foregroundColor(Color(hue: 0.204, saturation: 0.677, brightness: 0.512)))
                            .cornerRadius(15)
                            .shadow(radius:20)
                            .padding()
                        
                        
                        //         NavigationLink(destination: ThirdView()){
                        Text("Songs")
                            .font(.title3)
                            .foregroundColor(Color.white)
                            .padding()
                            .padding()
                            .background(Rectangle()
                                .foregroundColor(Color(hue: 0.204, saturation: 0.677, brightness: 0.512)))
                            .cornerRadius(15)
                            .shadow(radius:20)
                            .padding()
                        
                        
                            .padding()
                        //      NavigationLink(destination: FourthView()){
                        Text("Quotes")
                            .font(.title3)
                            .foregroundColor(Color.white)
                            .padding()
                            .padding()
                            .background(Rectangle()
                                .foregroundColor(Color(hue: 0.204, saturation: 0.677, brightness: 0.512)))
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
    InTheZone()
}
