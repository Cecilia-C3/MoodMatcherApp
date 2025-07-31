//
//  Cloud9.swift
//  MoodMatcher
//
//  Created by Scholar on 7/30/25.
//

import Foundation

import SwiftUI

struct Cloud9: View {
  // NavigationView { ()
   var body: some View {
       ZStack{
           Color(red: 0.9176470588235294, green: 0.47058823529411764, blue: 0.34509803921568627)
               .ignoresSafeArea()
           VStack {
               
               Text("Welcome to:")
                   .font(Font.custom("BRADLEY", size: 25))
                   .foregroundColor(Color(red: 0.261, green: 0.155, blue: 0.021))
                   .padding(0.5)
               
                   //.navigationTitle
               Text("Cloud 9")
                   .font(Font.custom("BRADLEY", size: 40))
                   .foregroundColor(Color(red: 0.261, green: 0.155, blue: 0.021))
               
               Text("😇")
                   .font(.system(size: 70))
                   .fontWeight(.bold)
                   .padding(30) // Adjust size of the circle
                   .background(Color(hue: 0.051, saturation: 0.402, brightness: 0.917)) // background color of circle
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
                           .font(.system(size: 25))
                           .font(.title3)
                           .fontWeight(.bold)
                           .foregroundColor(Color.black)
                           .padding()
                           .padding()
                           .background(Rectangle()
                               .foregroundColor(Color(hue: 0.084, saturation: 0.469, brightness: 0.966)))
                           .cornerRadius(15)
                           .shadow(radius:20)
                           .padding()
                       
                       
                       //         NavigationLink(destination: ThirdView()){
                       Text("Songs")
                           .font(.system(size: 25))
                           .font(.title3)
                           .fontWeight(.bold)
                           .foregroundColor(Color.black)
                           .padding()
                           .padding()
                           .background(Rectangle()
                               .foregroundColor(Color(hue: 0.084, saturation: 0.469, brightness: 0.966)))
                           .cornerRadius(15)
                           .shadow(radius:20)
                           .padding()
//
                       
                       //      NavigationLink(destination: FourthView()){
                       Text("Quotes")
                           .font(.system(size:25))
                           .font(.title3)
                           .font(.title3)
                           .fontWeight(.bold)
                           .foregroundColor(Color.black)
                           .padding()
                           .padding()
                           .background(Rectangle()
                               .foregroundColor(Color(hue: 0.084, saturation: 0.469, brightness: 0.966)))
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
   Cloud9()
}
