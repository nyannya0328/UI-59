//
//  ContentView.swift
//  UI-59
//
//  Created by にゃんにゃん丸 on 2020/12/02.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            
            
            Home()
                .navigationBarTitle("Circle")
                .preferredColorScheme(.dark)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Home : View {
    @State var size = UIScreen.main.bounds.width - 100
    
    @State var progress : CGFloat = 0
    @State var angle : Double = 0
    var body: some View{
        VStack{
            
            ZStack{
                
                Circle()
                    
                    .stroke(Color("c1"),style: StrokeStyle(lineWidth: 55, lineCap: .butt))
                    .frame(width: size, height: size)
                
                
                Circle()
                    .trim(from: 0, to: progress)
                    .stroke(Color.green,style: StrokeStyle(lineWidth: 55, lineCap: .butt,lineJoin: .round))
                    .frame(width: size, height: size)
                    .rotationEffect(.init(degrees: -90))
                
                Circle()
                    .fill()
                    .frame(width: 55, height: 55)
                    .offset(x: size / 2)
                    .rotationEffect(.init(degrees: -90))
                
                
                
                
                Circle()
                    .fill(Color.red.opacity(1))
                    .frame(width: 55, height: 55)
                    .offset(x: size / 2)
                    .rotationEffect(.init(degrees: angle))
                    .gesture(DragGesture().onChanged(self.Drag(value:)))
                    .rotationEffect(.init(degrees: -90))
                
                Text("" + String(format: "%.0fMile", progress * 100))
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                
                
                
                
                
                
            }
        }
        
        
    }
    
    func Drag(value:DragGesture.Value){
        
        let vector = CGVector(dx: value.location.x - 27.5, dy: value.location.y - 27.5)
        
        let radius = atan2(vector.dy, vector.dx)
        
        
        var angle = radius * 180 / .pi
        
        if angle < 0 {angle = 360 + angle}
        
        
        withAnimation(Animation.linear(duration: 0.05)){
            
            let progress = angle / 360
            self.progress = progress
            
            self.angle = Double(angle)
        }
        
        
        
    }
}
