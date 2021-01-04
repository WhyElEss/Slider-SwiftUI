//
//  SliderExampleView.swift
//  Slider-SwiftUI
//
//  Created by Юрий Станиславский on 04.01.2021.
//

import SwiftUI

struct SliderExampleView: View {
    @State private var progress: Float = 0
    @ObservedObject var viewModel = PlayerViewModel()
    
    var body: some View {
        VStack {
            Slider(value: Binding(get: {
                Double(progress)
            }, set: { newValue in
                progress = Float(newValue)
                viewModel.setTime(value: Float(newValue))
            }), in: 0...viewModel.maxDuration)
                .padding()
                .accentColor(.purple)
            
            HStack {
                Button(action: {
                    viewModel.play()
                }, label: {
                    Text("Play")
                })
                .frame(width: 100, height: 50)
                .background(Color.purple)
                .cornerRadius(10.0)
                
                Button(action: {
                    viewModel.stop()
                }, label: {
                    Text("Stop")
                })
                .frame(width: 100, height: 50)
                .background(Color.purple)
                .cornerRadius(10.0)
            }
            .foregroundColor(.white)
            .font(.headline)
        }
    }
}

struct SliderExampleView_Previews: PreviewProvider {
    static var previews: some View {
        SliderExampleView()
    }
}
