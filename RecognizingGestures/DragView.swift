//
//  DragView.swift
//  RecognizingGestures
//
//  Created by Sadeel Muwahed on 22/08/2023.
//

//In DragView you’ll use a drag gesture to move a circle shape around the view.

import SwiftUI

struct DragView: View {
    
    private let circleSize:CGFloat = 100
    
    //To keep track of the circle’s position, the @State variable offset stores a CGSize value. This doesn’t refer to the circle’s size, but is instead used as a distance vector to represent its offset from its starting position in the view.
    @State private var offset = CGSize.zero
    
    var dragGesture: some Gesture{
        DragGesture()
            .onChanged { value in
                offset = CGSize(width: value.startLocation.x + value.translation.width - circleSize/2, height: value.startLocation.y + value.translation.height - circleSize/2)
            
                //The system calls the .onChanged event handler any time the position of your drag changes. Each time the handler is called, it assigns a new value to offset using the translation property of the drag value.
            }
    }
    
    var body: some View {
        VStack{
            Text("Use one finger to drag the circle around")
            Spacer()
            Circle().foregroundColor(.teal)
                .frame(width: circleSize, height: circleSize)
                .offset(offset)
                .gesture(dragGesture)
            Spacer()
        }.navigationTitle("Drag")
            .padding()
            .toolbar {
                Button("Reset"){
                    offset = .zero
                }
            }
    }
}

struct DragView_Previews: PreviewProvider {
    static var previews: some View {
        DragView()
    }
}
