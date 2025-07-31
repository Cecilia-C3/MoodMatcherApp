//
//  SwiftUIView.swift
//  MoodMatcher
//
//  Created by Scholar on 7/29/25.
//

import SwiftUI

enum MoodType : String {
    case happy, sad, bored, productive
}

struct Answer {
    let text: String
    let mood: MoodType
    let points: Int
}

struct Question {
    let text: String
    let answers: [Answer]
}

struct SwiftUIView: View {
    
    let questions: [Question] = [
        
        //question 1
        Question(text: "When you woke up this morning, your first thought was…", answers: [
            Answer(text: "Today is going to be amazing! 🌞", mood: .happy, points: 1),
            Answer(text: "Why even bother get out of bed? 🌧", mood: .sad, points: 1),
            Answer(text: "Wait… what day is it again? 😵", mood: .bored, points: 1),
            Answer(text: "Let’s get after it! I’ve got a plan. ✅", mood: .productive, points: 1)
        ]),
        
        //question 2
        Question(text: "How would you describe your energy level right now?", answers: [
            Answer(text: "Light, bubbly, and unstoppable 💃", mood: .happy, points: 1),
            Answer(text: "Heavy, drained, and slow 😔", mood: .sad, points: 1),
            Answer(text: "Foggy and scattered—hard to focus 💤", mood: .bored, points: 1),
            Answer(text: "Sharp and locked in—ready to tackle anything 💼 ", mood: .productive, points: 1)
        ]),
        
        //question 3
        Question(text: "How are you responding to other people today?", answers: [
            Answer(text: "Full of warmth—I want to connect 💞", mood: .happy, points: 1),
            Answer(text: "Withdrawn—just not up for interaction 😶", mood: .sad, points: 1),
            Answer(text: "Indifferent—I’m not really tuned in 🙃", mood: .bored, points: 1),
            Answer(text: "Focused—keeping conversations purposeful 👥 ", mood: .productive, points: 1)
        ]),
        
        //question 4
        Question(text: "How are your thoughts flowing today? ", answers: [
            Answer(text: "Like a happy stream, full of gratitude and lightness 🌊", mood: .happy, points: 1),
            Answer(text: "Heavy and echoing with old feelings or regrets 🕳", mood: .sad, points: 1),
            Answer(text: "Disconnected and scattered, hard to follow 🧩", mood: .bored, points: 1),
            Answer(text: "Clear, fast, and organized like a checklist 💡", mood: .productive, points: 1)
        ]),
        
        //question 5
        Question(text: "If your current mood was a weather forecast, it would be…", answers: [
            Answer(text: "Bright sunshine with a warm breeze ☀️", mood: .happy, points: 1),
            Answer(text: "Grey clouds and a quiet drizzle 🌧", mood: .sad, points: 1),
            Answer(text: "Misty and no clear direction 🌫", mood: .bored, points: 1),
            Answer(text: "Crisp, cool, and totally clear skies ⛅", mood: .productive, points: 1)
        ])
        
    ]
    
    @State private var currentIndex = 0
    @State private var scores: [MoodType: Int] = [:]
    @State private var showResult = false
    @State private var buttonColor: Color = (Color(hue: 0.91, saturation: 0.451, brightness: 0.568))

    
    
    var body: some View {
        
        ZStack {
            Color (red: 240/255, green: 230/255, blue: 220/255)
                .ignoresSafeArea()
            
            VStack {
                Text("Take a quiz to find the mood that best matches you!")
                    .font(Font.custom("BRADLEY", size: 24))
                  
                    .multilineTextAlignment(.center)
                //  .lineLimit(3)
                    .padding(.horizontal, 30.0)
                    .padding(.bottom, 100)
                
                // display final result and allow user to restart quiz
                if showResult {
                    let result = calculateResult ()
                    Text ("Your mood is: ")
                        .font(.title)
                        .padding(.bottom,4)
                    Text(moodDescription(result))
                        .font(.largeTitle)
                        .bold()
                        .padding()
                    Button("Restart Quiz") {
                        restartQuiz()
                    }
                    Text ("Go to \(moodDescription(result)) ")
                    .padding()
                } else {
                    Text(questions[currentIndex].text)
                        .font(.title2)
                        .padding()
                    
                    //formatting for questions and answers
                    ForEach(questions[currentIndex].answers, id: \.text) {answer in
                        Button(action: {
                            answerSelected(answer)
                        }) {
                            Text(answer.text)
                                .frame(maxWidth: .infinity)
                                .padding()
                              .background(Color.white.opacity (0.6))
                                .foregroundColor(.black)
                                .background(buttonColor)
                                .cornerRadius(10)
                                .padding(.horizontal)
                        }
                        .padding(.vertical, 4)
                    }
                }
            }
        }
        
   
        .animation(.easeInOut, value: currentIndex)
//        .padding()
        
    }
    
    //add points to mood when corresponding answer is chosen
    func answerSelected(_ answer: Answer) {
        scores[answer.mood, default: 0] += answer.points
        
        if currentIndex < questions.count - 1 {
            currentIndex += 1
        } else {
            showResult = true
        }
    }
    
    //cacluclate total score and determine mood with highest score
    func calculateResult() -> MoodType {
        let maxScore = scores.values.max() ?? 0
        let topMoods = scores.filter { $0.value == maxScore }.map { $0.key }
        
        if topMoods.count == 1 {
            return topMoods.first!
        } else {
            return .bored
        }
    }
    
    //return the mood with the highest points
    func moodDescription(_ mood: MoodType) -> String {
        switch mood {
        case .happy: return "Cloud 9 😇"
        case .sad: return "The Blues ☹️"
        case .bored: return "Brain Fog 😵‍💫"
        case .productive: return "In the Zone 😎"
        }
    }
    
    //restart quiz function
    func restartQuiz() {
        currentIndex = 0
        scores = [:]
        showResult = false
    }
    
}

#Preview {
    SwiftUIView()
}

