//
//  MainView.swift
//  Card_Game
//
//  Created by Felipe Imbimbo on 17/06/2023.
//


import SwiftUI


struct MainView: View {
    
    @EnvironmentObject var model: ContentModel
    var isNewDeck: Bool {
        return ((model.deckOfCards?.remaining ?? 0) == 52) ? true : false
    }
    
    var statusText: String {
        return model.deckOfCards?.success! ?? false ? "Valid deck loaded!" : "No cards available"
    }

    
    var body: some View {
        //
        ZStack {
            //Background image
            Image("newbackground")
                .resizable()
                .clipped()
                .ignoresSafeArea()
                
            VStack {
                Text("Vamos ao jogo!")
                    .bold()
                    .font(.largeTitle)
                    .foregroundColor(Color.black)
                    .padding(.bottom, 10)
            
                
                Button {
                    //Chamar API
                    model.createNewDeck()
                    
                } label: {
                    Text("Novo baralho")
                }
                .padding()
                .background()
                .cornerRadius(10)
                .foregroundColor(.black)
                

                //Status do deck
                GroupBox  {
            
                    Text("Cartas restantes:   \(model.remainingCards ?? 0)")
                        .font(.footnote)
                }
                //.padding(.horizontal)
                .frame(width: 250)
                
                HStack{
                Text("Jogador 1")
                    .foregroundColor(Color.black)
                    .bold()
                    .padding(.trailing, 70)
                Text("Jogador 2")
                    .foregroundColor(Color.black)
                    .bold()
                }
                
                
                HStack{
                    
                    //API call - sacar carta para player 1
                    AsyncImage(url: URL(string: model.cardDraw?.cards?[0].image! ?? "")) { image in
                        image.resizable()
                    } placeholder: {
                        Color.white
                    }
                    .frame(width: 100, height: 125)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .shadow(color: .gray, radius: 7, x: 3, y: 3)
                    .padding(.trailing, 50)
    
                    
                    
                    //API call - sacar carta para player 2
                    
                    AsyncImage(url: URL(string: model.cardDraw?.cards?[1].image! ?? "")) { image in
                        image.resizable()
                    } placeholder: {
                        Color.white
                    }
                    .frame(width: 100, height: 125)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .shadow(color: .gray, radius: 7, x: 3, y: 3)
                    .padding(0)
    
                
                }
                HStack{
                    
                    //Instanciar as cardDescriptions
                    
                    let cardDescription = model.describeCard()
                    let cardDescription2 = model.describeCard2()
                    Text(cardDescription)
                        .bold()
                        .foregroundColor(.black)
                        .font(.caption2)
                        .padding(.trailing, 70)
                    
                    Text(cardDescription2)
                        .bold()
                        .foregroundColor(.black)
                        .font(.caption2)
                        
                }
                    
                    
                    VStack{

                    //Button para sacart nova carta!
                    Button {
                        //API call para uma nova carta!
                        model.drawCard(cardDeckId: (model.deckOfCards?.deck_id!)!)
                    } label: {
                        Text("Sacar cartas!")
                    }
                    .padding(10)
                
                    .background(Color.blue)
                    .cornerRadius(10)
                    .foregroundColor(.black)
                    
                }
                .opacity(!(isNewDeck) ? 0 : 1)
                            
                
            }
        }
        //
    }
}


struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(ContentModel())
    }
}
