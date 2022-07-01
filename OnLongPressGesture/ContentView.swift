//
//  ContentView.swift
//  OnLongPressGesture
//
//  Created by Skorobogatow, Christian on 1/7/22.
//


import SwiftUI

struct ContentView: View {
    
    @State var isCompleted = false
    @State var isSuccess = false
    @State var animationDuration: Double = 0.5
    
    
    var body: some View {
        VStack{
            Rectangle()
                .fill(isSuccess ? .green : .blue)
                .frame(maxWidth: isCompleted ? .infinity : 0)
                .frame(height: 55)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(.gray)
            
            
            HStack{
                Text("CLICK HERE")
                    .foregroundColor(.white)
                    .padding()
                    .background(.black)
                    .clipShape(Capsule())
                    .onLongPressGesture(minimumDuration: animationDuration,
                                        maximumDistance: 50) {
                        isSuccess = true
                    
                    } onPressingChanged: { isPressing in
                        if isPressing {
                            withAnimation(.easeInOut(duration: animationDuration)) {
                                isCompleted = true
                            }
                        } else {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                if !isSuccess {
                                    withAnimation(.easeInOut(duration: animationDuration)) {
                                        isCompleted = false
                                    }
                                }
                            }
                        }
                    }


                
                
                Text("RESET")
                    .foregroundColor(.white)
                    .padding()
                    .background(.black)
                    .clipShape(Capsule())
                    .onTapGesture {
                        withAnimation {
                            isCompleted = false
                            isSuccess = false
                        }
                        
                    }
                    
            }
        }
        
        
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
