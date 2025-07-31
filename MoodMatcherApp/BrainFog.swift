//
//  BrainFog.swift
//  MoodMatcher
//
//  Created by Scholar on 7/30/25.
//

import Foundation

import SwiftUI

struct BrainFog: View {
   // NavigationView { ()
    var body: some View {
        ZStack{
            Color(red: 0.9294117647058824, green: 0.7450980392156863, blue: 0.8941176470588236)
                .ignoresSafeArea()
            VStack {
                
                Text("Welcome to:")
                    .font(.title2)
                    .padding(0.5)
                
                    //.navigationTitle
                Text("Brain Fog")
                
                    .font(.title)
                Text("😵‍💫")
                    .font(.system(size: 70))
                
                    .fontWeight(.bold)
                    .padding(30) // Adjust size of the circle
                    .background(Color(hue: 0.827, saturation: 0.254, brightness: 0.64)) // background color of circle
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
                                .foregroundColor(Color(hue: 0.791, saturation: 0.505, brightness: 0.532)))
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
                                .foregroundColor(Color(red: 0.463, green: 0.261, blue: 0.533)))
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
                                .foregroundColor(Color(red: 0.463, green: 0.261, blue: 0.533)))
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
    BrainFog()
}
