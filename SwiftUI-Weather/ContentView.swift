//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by saeed shaikh on 5/27/24.
//

import SwiftUI

 struct ContentView: View {
     @State private var isNight = false
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: isNight)
            VStack{
                CityTextView(cityName: "Mumbai, Mum")
                MainWeatherStatusView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill" , temperature: 35)
                    .padding(.bottom,20)
                HStack(spacing: 20){
                    WeatherDayView(dayOfWeeks: "MON", imageName: "sun.max.fill", temperature: 40)
                    WeatherDayView(dayOfWeeks: "TUE", imageName: "wind",
                        temperature: 30)
                    WeatherDayView(dayOfWeeks: "WED", imageName: "cloud.sun.fill", temperature: 34)
                    WeatherDayView(dayOfWeeks: "THU", imageName: "sun.max.fill", temperature: 40)
                    
                }
                Spacer()
                Button(action: {
                    isNight.toggle()
                    
                }, label: {
                    WeatherButtonView(title: "Change Day Time", backgroundColor: .white, textColor: .blue)
                })
                Spacer()
                
                
            }
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WeatherDayView: View {
    
    var dayOfWeeks:String
    var imageName:String
    var temperature:Int
    
    var body: some View {
        VStack(spacing: 10){
            Text(dayOfWeeks)
                .font(.system(size: 20, weight: .medium, design: .default))
                .foregroundColor(.white)
            Image(systemName: imageName)
                .symbolRenderingMode(.multicolor)
                .resizable()
                .aspectRatio( contentMode: .fit)
                .frame(width: 40, height: 40, alignment: .center)
            Text("\(temperature)° C")
                .font(.system(size: 20, weight: .medium, design: .default))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    
    var isNight: Bool
    
    var body: some View {
        LinearGradient(colors: [isNight ? .black : .blue,
                              isNight ? .gray : Color("lightblue")], startPoint: .topLeading, endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
    }
}

struct CityTextView: View{
    var cityName:String
    var body: some View{
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding(.bottom)
    }
}

struct MainWeatherStatusView: View{
    var imageName:String
    var temperature:Int
    
    var body: some View{
        VStack(spacing:10){
            
            Image(systemName: imageName)
                .symbolRenderingMode(.multicolor)
                .resizable()
                .aspectRatio( contentMode: .fit)
                .frame(width: 150, height: 150, alignment: .center)
            Text("\(temperature)° C")
                .font(.system(size: 60, weight: .medium, design: .default))
                .foregroundColor(.white)
        }

    }
}

