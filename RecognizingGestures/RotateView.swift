//
//  RotateView.swift
//  RecognizingGestures
//
//  Created by Sadeel Muwahed on 22/08/2023.
//

//Experiment rotating a square using two fingers.
//In RotateView you’ll use a two-finger rotation gesture to rotate a square shape.

import SwiftUI

struct RotateView: View {
    
    //To set up the rotation gesture, you need a starting angle, rotation. This state property enables you to track the change of rotation, and redraws the view every time it changes.
    @State private var rotation = Angle.zero
    
    var rotationGesture: some Gesture{
        RotationGesture()
        .onChanged { angle in
            rotation = angle
        }
        .onEnded { angle in
            rotation = angle
        }
    }
    
    var body: some View {
        Rectangle().foregroundColor(.red)
            .frame(width: 100, height: 200)
            .rotationEffect(rotation)
            .gesture(rotationGesture)
    }
}

struct RotateView_Previews: PreviewProvider {
    static var previews: some View {
        RotateView()
    }
}
