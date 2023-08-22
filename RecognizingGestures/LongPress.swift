//
//  LongPress.swift
//  RecognizingGestures
//
//  Created by Sadeel Muwahed on 22/08/2023.
//

//In the LongPressView, you’ll change the height and width of a capsule shape every time you touch and hold on the shape.



import SwiftUI

struct LongPress: View {
    
    @State private var sizeIndex = 0
    
    private var sizes: [CGSize] = [
        CGSize(width: 100, height: 50),
        CGSize(width: 50, height: 70),
        CGSize(width: 200, height: 10),
        CGSize(width: 500, height: 510)

    ]
    
    //Here you define your custom gesture using a LongPressGesture.
    var longPress: some Gesture{
        LongPressGesture().onEnded { value in
            withAnimation {
                sizeIndex += 1
                if sizeIndex==sizes.count{
                    sizeIndex=0
                }
            }
        }
    }
    
    var body: some View {
        VStack{
            Text("Touch and hold the capsule to change its size")
            Spacer()
            Capsule().foregroundColor(.green)
                .frame(width: sizes[sizeIndex].width, height: sizes[sizeIndex].height)
                .gesture(longPress)
            Spacer()
        }
        .navigationTitle("Touch and Hold")
        .padding()
        .toolbar {
            Button("Reset"){
                sizeIndex=0
            }
        }
    }
}

struct LongPress_Previews: PreviewProvider {
    static var previews: some View {
        LongPress()
    }
}
