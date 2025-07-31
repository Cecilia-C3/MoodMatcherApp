//
//  QuotesPage.swift
//  MoodMatcher
//
//  Created by Scholar on 7/30/25.
//

import Foundation

import SwiftUI

struct QuotePage: View {
    var body: some View {
        
            ZStack{
                Color(red: 0.6392156862745098, green: 0.7607843137254902, blue: 0.5137254901960784)
                    .ignoresSafeArea()
                ScrollView{
                    
                VStack{
                    HStack{
                        
                        Text("📝")
                            .font(.system(size: 40))
                        Text("Quotes")
                            .font(.system(size: 25))
                            .fontWeight(.bold)
                            .foregroundColor(Color(hue: 0.261, saturation: 0.664, brightness: 0.322))
                            .padding()
                            .border(Color(hue: 0.235, saturation: 0.174, brightness: 0.889), width:3)
                            .background(Color(hue: 0.222, saturation: 0.262, brightness: 0.77))
                            .padding(15)
                        Text("📝")
                            .font(.system(size: 40))
                    }
                    
                    Text("to stay In The Zone and for inspiration:")
                        .font(.title3)
                        .padding()
                    
                        .padding(.horizontal, 20)
                        .padding(.vertical, 12)
                        .background(
                            Capsule()
                                .fill(Color(hue: 0.236, saturation: 0.307, brightness: 0.923))
                        )
                        .overlay(
                            Capsule()
                                .stroke(Color(hue: 0.251, saturation: 0.356, brightness: 0.676), lineWidth: 2)
                        )
                        .shadow(radius: 2)
                    
                    
                    HStack{
                        Text("- Success is built on what you do daily")
                        
                        //.padding(.all)
                        
                            .font(.system(size: 17))
                            .fontWeight(.bold)
                            .foregroundColor(Color(hue: 0.261, saturation: 0.664, brightness: 0.322))
                            .padding()
                            .border(Color(hue: 0.235, saturation: 0.174, brightness: 0.889), width:3)
                            .background(Color(hue: 0.222, saturation: 0.262, brightness: 0.77))
                            .padding(10)
                        
                        
                        Text("- Life isn't about finding yourself, it's about creating yourself")
                        //.padding(.all)
                        
                            .font(.system(size: 17))
                            .fontWeight(.bold)
                            .foregroundColor(Color(hue: 0.261, saturation: 0.664, brightness: 0.322))
                            .padding()
                            .border(Color(hue: 0.235, saturation: 0.174, brightness: 0.889), width:3)
                            .background(Color(hue: 0.222, saturation: 0.262, brightness: 0.77))
                            .padding(10)
                        
                    }
                    
                    HStack{
                        
                        VStack{
                            Text("- Change is scary but so is staying the Same")
                            //  .padding(.all)
                            
                                .font(.system(size: 17))
                                .fontWeight(.bold)
                                .foregroundColor(Color(hue: 0.261, saturation: 0.664, brightness: 0.322))
                                .padding()
                                .border(Color(hue: 0.235, saturation: 0.174, brightness: 0.889), width:3)
                                .background(Color(hue: 0.222, saturation: 0.262, brightness: 0.77))
                                .padding(10)
                            
                            Text("- Avoiding a task takes as much mental energy as doing it")
                            //  .padding(.all)
                            
                                .font(.system(size: 17))
                                .fontWeight(.bold)
                                .foregroundColor(Color(hue: 0.261, saturation: 0.664, brightness: 0.322))
                                .padding()
                                .border(Color(hue: 0.235, saturation: 0.174, brightness: 0.889), width:3)
                                .background(Color(hue: 0.222, saturation: 0.262, brightness: 0.77))
                                .padding(10)
                            
                        }
                        .padding(.all)
                        Text("- Studying is a privilage not a chore. There is a whole world of knowledge out there, and we have the opportunity to explore some of it. So change your mindset.")
                        // .padding(.all)
                        
                            .font(.system(size: 17))
                            .fontWeight(.bold)
                            .foregroundColor(Color(hue: 0.261, saturation: 0.664, brightness: 0.322))
                            .padding()
                            .border(Color(hue: 0.235, saturation: 0.174, brightness: 0.889), width:3)
                            .background(Color(hue: 0.222, saturation: 0.262, brightness: 0.77))
                            .padding(10)
                        
                    }
                   
                }
            }
        }
    }
}
   
#Preview {
    QuotePage()
}
