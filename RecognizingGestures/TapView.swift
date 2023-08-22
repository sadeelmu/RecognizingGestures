//
//  TapView.swift
//  RecognizingGestures
//
//  Created by Sadeel Muwahed on 22/08/2023.
//

//In SwiftUI, you can add a gesture directly to a view using a .gesture modifier. Here, you’ll explore how to add a tap gesture to a rectangle view so that it changes color when pressed.


import SwiftUI

struct TapView: View {
    
    //To set up this tap gesture, you need a @State value, color. When you mark the property with @State, SwiftUI updates all views that use this value any time it changes.
    @State private var color: Color = Color.primary
    
    
    //This code defines a custom gesture, tapGesture. After you’ve defined a custom gesture, you can attach it to a view using the .gesture modifier.
    var tapGesture: some Gesture{
        TapGesture().onEnded {
            withAnimation {
                color = Color.random()
            }
        }
    }
    
    var body: some View {
        
        VStack{
            Text("Tap the rectangle to change its color.")
            Spacer()
            Rectangle().foregroundColor(color)
                .frame(width: 250, height: 450)
                .gesture(tapGesture)
            Spacer()
            
        }
        .navigationTitle("Tap")
            .padding()
            .toolbar {
                Button("Reset") {
                    color = Color.primary
                }
            }
        
    }
}

struct TapView_Previews: PreviewProvider {
    static var previews: some View {
        TapView()
    }
}

extension Color{
    static func random() -> Color{
        return Color(red: Double.random(in: 0...1), green: Double.random(in: 0...1), blue: Double.random(in: 0...1))
    }
}
