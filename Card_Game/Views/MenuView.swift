//
//  MenuView.swift
//  Card_Game
//
//  Created by Felipe Imbimbo on 24/06/2023.
//

import SwiftUI


struct MenuView: View {
    
    
    var body: some View {
        NavigationView{
    
        ZStack {
            //Background image
            Image("newbackground")
                .resizable()
                .clipped()
                .ignoresSafeArea()
                
            VStack {
                Text("DRINKING GAME!")
                    .bold()
                    .font(.largeTitle)
                    .foregroundColor(Color.black)
                    .padding(.bottom, 10)
            
                //Links para as outras Views
    
                NavigationLink(destination: MainView()){
                    Text("Jogar")
                        .foregroundColor(.white)
                        .font(.system(size:30))
                        .fontWeight(.bold)
                        .frame()
                }
                
                NavigationLink(destination: RulesView()){
                    Text("Regras")
                        .foregroundColor(.red)
                        .font(.system(size:20))
                        .fontWeight(.bold)
                }
            
                
             
            }
       
        }
    }
    }
        


struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
            .environmentObject(ContentModel())
    }
}
    }
