//
//  ContentView.swift
//  ShWatchSample
//
//  Created by でっていう2001 on 2023/05/22.
//

import SwiftUI

struct ContentView: View {
    @State var hitCount = 0
    //    @State var timer = 0
    @State var countState: Int = 0
    @State var date: Date = Date()
    @State var currentTime: Double = 0
    @State var startTime: Double = 0
    @State var mode: Int = 0
    var posMode:CGFloat {
        if mode == 0 {
            return -105
        } else if mode == 1 {
            return 10
        } else if mode == 2 {
            return 70
        } else {
            return 0
        }
    }
    //    @State var posMode:CGFloat = CGFloat(posModeI)
    //    func TimeCheck (countState: Int) {
    //
    //
    //    }
    var body: some View {
        ZStack {
            Color(.white)
            Rectangle()
                .stroke(lineWidth: 20)
                .fill(.yellow)
            VStack {
                HStack {
                    VStack {
                        Text("🐝")
                            .font(.system(size: 80))
                        //                        Text("\(posMode)")
                        //                            .font(.system(size:20))
                        //                            .padding(.leading)
                    }
                    Spacer()
                    ZStack {
                        
                        RoundedRectangle(cornerRadius: 10)
                            .fill(.gray)
                            .frame(width: 400,height:150)
                        
                        VStack {
                            Text("\(hitCount)")
                                .font(.system(size: 100))
                                .multilineTextAlignment(.trailing)
                                .foregroundColor(.black)
                                .padding(.horizontal, 30.0)
                                .offset(y: 30)
                            Rectangle()
                                .frame(width: 30, height: 10)
                                .offset(x: posMode , y: -30)
                        }
                    }
                    .padding(.trailing, 10.0)
                    
                    
                }
                HStack{
                    Spacer()
                    Text("| SHOOTING    | TIME    | STOP    | ?    | ?")
                        .multilineTextAlignment(.trailing)
                        .padding(.trailing, 20.0)
                        .offset(y: -20)
                    
                }
                Spacer()
                
                HStack {
                    VStack {
                        Text("SELECT")
                        Button(action: {
                            //                            var hoge = 0
                            countState = 0
                            if mode == 2 {
                                mode = 0
                            } else {
                                mode += 1
                            }
                        }) {
                            Capsule()
                                .frame(width: 100, height: 30)
                        }
                    }
                    VStack {
                        Text("START")
                        Button(action: {
                            hitCount = 0
                            countState = 1
                        }) {
                            Capsule()
                                .frame(width: 100, height: 30)
                        }
                    }
                    Spacer()
                    HitButton(hitCount: $hitCount, countState: $countState, date: $date, currentTime: $currentTime, startTime: $startTime)
                        .padding(.horizontal)
                    HitButton(hitCount: $hitCount, countState: $countState, date: $date, currentTime: $currentTime, startTime: $startTime)
                        .padding(.horizontal)
                }
                
                .padding([.bottom, .trailing])
                .foregroundColor(.black)
            }
            .padding()
            
        }
        
    }
}

struct HitButton: View{
    @Binding var hitCount: Int
    @Binding var countState: Int
    @Binding var date: Date
    @Binding var currentTime: Double
    @Binding var startTime: Double
    var body: some View{
        
        Button(action: {
            date = Date()
            currentTime = Double(date.timeIntervalSince1970)
            if countState == 1 {
                startTime = currentTime
                countState = 2
            }
            if (currentTime - startTime) >= 10.0 {
                countState = 0
            }
            if countState == 2 {
                hitCount += 1
            }
        }
        )
        {
            Circle()
                .fill(.black)
                .frame(width : 90)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
