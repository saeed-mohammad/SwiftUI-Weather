//
//  WeatherButton.swift
//  SwiftUI-Weather
//
//  Created by saeed shaikh on 6/2/24.
//

import SwiftUI

struct WeatherButtonView: View{
    var title:String
    var backgroundColor:Color
    var textColor:Color
    var body:some View{
        Text(title)
            .padding()
            .background(backgroundColor)
            .foregroundColor(textColor)
            .cornerRadius(10)
    }
}
