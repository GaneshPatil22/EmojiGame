//
//  ContentView.swift
//  EmojiGame
//
//  Created by Patil, Ganesh on 09/02/22.
//

import SwiftUI

struct ContentView: View {
    var emojis = ["🚝", "✈️", "🚎", "🚀", "⛴", "🚚", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J"]
    @State var emojiCount = 3
    var body: some View {
        let count = emojis.count - 1
        VStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(emojis[0..<emojiCount], id: \.self) { emoji in
                        CardView(content: emoji)
                            .aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            .foregroundColor(.red)
            Spacer()
            HStack {
                Button {
                    emojiCount = emojiCount == 0 ? count : emojiCount - 1
                } label: {
                    Image(systemName: "minus.circle")
                }
                Spacer()
                Button {
                    emojiCount = emojiCount == count ? 0 : emojiCount + 1
                } label: {
                    Image(systemName: "plus.circle")
                }
            }
            .font(.largeTitle)
            .padding()
            
        }
        .padding(.horizontal)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
//        Text("ada")
    }
}

struct CardView: View {
    var content: String
    @State var isFaceUp = true
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUp {
                shape.foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3 )
                Text(content).font(.largeTitle)
            } else {
                shape
            }
            
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}
