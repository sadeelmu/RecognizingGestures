//
//  LineDraw.swift
//  RecognizingGestures
//
//  Created by Sadeel Muwahed on 22/08/2023.
//

//In LineDraw, you’ll use a drag gesture to draw a line in the view. To do this, you’ll create a Path and redraw it every time you initiate a drag event.


import SwiftUI

struct LineDraw: View {
    
    @State private var lineStart = CGPoint.zero
    @State private var lineEnd = CGPoint.zero
    
    var lineDraw: some Gesture{
        //This drag gesture example uses a DragGesture, just like the other drag gesture example. However, here you need two event handlers: one that’s called as the drag value changes in .onChanged, and the other that’s called when the drag gesture ends in .onEnded.
        DragGesture()
            .onChanged { value in
                lineStart = value.startLocation
                lineEnd = value.location
            }
            .onEnded { value in
                lineEnd = value.location
            }
    }
    
    var body: some View {
        VStack{
            Text("Touch and drag to make a line")
            Spacer()
            //To draw a line, you’ll use a Path, which creates an outline of a shape. First, you’ll move the path to the lineStart value and then you’ll add a line to the lineEnd value. Because each of these values are @State properties, any changes to their data causes SwiftUI to redraw the path and update the view. As a result, you can see the line updating as you drag around the view.
            
            Path{ path in
                path.move(to: lineStart)
                path.addLine(to: lineEnd)
            }.stroke(Color.green,lineWidth: 0.6)
                .contentShape(Rectangle())
                .gesture(lineDraw)
        }
    }
}

struct LineDraw_Previews: PreviewProvider {
    static var previews: some View {
        LineDraw()
    }
}
