//
//  ContentView.swift
//  SUI
//
//  Created by Valentin Harenzhenkov on 3.05.25.
//

import SwiftUI

struct GridView: View {
    
    var body: some View {
        ScrollView {
            Grid (alignment: .center, horizontalSpacing: 4, verticalSpacing: 4) {
                GridRow {
                    Text("Кросовки").font(.title3.bold()).fontDesign(.serif)
                }
                .frame(maxWidth: .infinity)
                Divider()
                    ForEach(Shoes.mockData) { shoe in
                        ZStack (alignment: .bottom){
                            Image(shoe.photo)
                                .resizable()
                                .scaledToFit()
                                .frame(maxWidth: .infinity, maxHeight: 240)
                            VStack {
                                Text(shoe.title)
                                    .font(.title2.bold()).fontDesign(.serif)
                                Text("\(shoe.price) ₽")
                                
                            }
                            .padding(.horizontal, 24)
                            .padding(.vertical, 8)
                            .frame(width: 180)
                            .background(.blue.opacity(0.1))
                            .clipShape(.rect(cornerRadius: 12))
                            .padding(.leading)
                        }
                        .frame(height: 250)
                        .padding(4)
                        .background {
                            RoundedRectangle(cornerRadius: 12).fill(Color.white)
                                .shadow(radius: 1)
                        }
                        .padding(.horizontal, 24)
                        .padding(.vertical, 4)
                    }
                }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}

struct Shoes: Identifiable {
    var id: Int
    var title: String
    var price: Int
    var photo: String
    
    static let mockData: [Shoes] = [
        .init(id: 1, title: "Adidas", price: 100, photo: "adidas"),
        .init(id: 4, title: "Asics", price: 400, photo: "asics"),
        .init(id: 5, title: "Reebok", price: 250, photo: "reebok"),
        .init(id: 6, title: "TNF", price: 180, photo: "tnf"),
        .init(id: 7, title: "PS", price: 180, photo: "ps")]
    
}
#Preview {
    GridView()
}
