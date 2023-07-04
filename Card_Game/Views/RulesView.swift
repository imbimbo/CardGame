//
//  RulesView.swift
//  Card_Game
//
//  Created by Aluno ISTEC on 24/07/2023.
//

import SwiftUI

struct RulesView: View {
    var body: some View {
        ZStack {
            //Background image
            Image("newbackground")
                .resizable()
                .clipped()
                .ignoresSafeArea()
            
            //Items will appear here!
            VStack {
                Text("Regras do Jogo!")
                    .bold()
                    .font(.title)
                    .foregroundColor(Color.black)
                    .padding(.bottom, 10)
                
                Text("O jogador que sacar a carta com o menor valor tem que beber uma dose da bebida de sua preferencia.")
                    .foregroundColor(.black)
                    .bold()
                    .frame(width: 300)
                    .background()
                    .cornerRadius(10)
                    .padding()
                Text("Sequencia: Ás, 2, 3, 4, 5, 6, 7, 8, 9, 10, Valete, Dama e Rei.")
                    .foregroundColor(.black)
                    .bold()
                    .frame(width: 300)
                    .background()
                    .cornerRadius(10)
                
                /*NavigationLink(destination: MenuView()){
                    Text("Voltar ao Menu")
                        .foregroundColor(.red)
                        .font(.system(size:30))
                        .fontWeight(.bold)
                }*/
                
                
            }
        }
    }
    
    struct RulesView_Previews: PreviewProvider {
        static var previews: some View {
            RulesView()
        }
    }
}
