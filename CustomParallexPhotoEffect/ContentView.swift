//
//  ContentView.swift
//  CustomParallexPhotoEffect
//
//  Created by Amish Tufail on 06/02/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView {
            ParallaxEffect()
            ContentList()
        }
        .scrollIndicators(.hidden)
        .ignoresSafeArea()
    }
}

#Preview {
    ContentView()
}

struct ParallaxEffect: View {
    var body: some View {
        GeometryReader { proxy in
            let offsetY = proxy.frame(in: .global).minY // This give minY value, and when we scroll value changes
            let isScrolled = offsetY > 0 // This check if scrolled, it is scrolling if value is greater than 0
            Spacer()
                .frame(height: isScrolled ? 400.0 + offsetY : 400.0) // now we increase height as much we scroll
                .background(
                    Image(.image)
                        .resizable()
                        .scaledToFill()
                        .offset(y: isScrolled ? -offsetY : 0) // we offset and use minus, if scroll down value is in postive so we minus it
                        .scaleEffect(isScrolled ? offsetY / 2000 + 1 : 1.0) // Here we scale based on scroll
//                        .blur(radius: isScrolled ? offsetY / 20 : 0) // This adds blur
                )
        }
        // This frame is must as without it seems like image is below the text and text overlaps on the image
        .frame(height: 400.0)
    }
}

struct ContentList: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 15.0) {
            ForEach(0...10, id: \.self) { _ in
                VStack(alignment: .leading, spacing: 5.0) {
                    RoundedRectangle(cornerRadius: 2.0)
                        .fill(.orange)
                        .frame(height: 30.0)
                }
                .padding()
            }
        }
        .padding(.top, 50.0)
    }
}
