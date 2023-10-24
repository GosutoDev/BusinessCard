//
//  ContentView.swift
//  BusinessCard
//
//  Created by Tomáš Duchoslav on 24.10.2023.
//

import SwiftUI

extension Font {
    static let titleFont: Font = Font.custom("DancingScript-REgular", size: 50).bold()
    
    static let bitFont: Font = Font.custom("PressStart2P-Regular", size: 10)
}

struct ContentView: View {
    
    let inputs: [String] = ["duchoslav.tomas@gmail.com", "+420 774 774 774"]
    
    var body: some View {
        ZStack {
            // background
            LinearGradient(gradient: Gradient(colors: [.white, .blue]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            VStack {
                // photo
                Image("photoMe")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .background(.white.opacity(0.5))
                    .clipShape(Circle())
                    .shadow(color: .white, radius: 10)
                    .overlay {
                        Circle()
                            .stroke(lineWidth: 3)
                    }
                // name
                Text("Tomas Duchoslav")
                    .font(.titleFont)
                    .shadow(color: .white, radius: 2, x: 2, y: 2)
                
                // email and phone number
                ForEach(inputs, id: \.self) { input in
                    HStack() {
                        Image(systemName: input.contains("@") ? "envelope" : "phone")
                        Text(input)
                            .font(.bitFont)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding([.vertical, .leading])
                    .background(.white)
                    .background(Color.black.offset(x: 3, y: 4))
                    .overlay {
                        Rectangle()
                            .stroke(lineWidth: 2)
                    }
                    .padding([.horizontal, .bottom])
                }
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    ContentView()
}
