//
//  ContentModel.swift
//  Card_Game
//
//  Created by Felipe Imbimbo on 17/06/2023.
//


import Foundation
import SwiftUI

class ContentModel: ObservableObject {
    
    @EnvironmentObject var model: ContentModel

    @Published var remainingCards: Int?
    
    @Published var deckOfCards: DeckOfCards?
    @Published var cardDraw: CardDraw?
    
    //Cria um novo  deck usando a API e endpoint
    func createNewDeck(){
        
     
        //Chama a constante a adiciona um Endpoint, criando um deck novo
        let urlString = "\(Constants.apiUrl)new/shuffle/?deck_count=1"
        let url = URL(string: urlString)
  
        if let url = url {
            
            //Criar URL request
            var request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
            request.httpMethod = "GET"

    
            //inicia uma sessao na API
            let session = URLSession.shared
            
       
            let dataTask = session.dataTask(with: request) { data, response, error in
                
                //Controle de erro
                if error == nil {

                    
                    do{
                    //Parse JSON
                        let decoder = JSONDecoder()
                        let result = try decoder.decode(DeckOfCards.self, from: data!)

                        DispatchQueue.main.async {
                            //Assign to the appropriate property
                            self.deckOfCards = result
                            
                            //Assign card remainingCards value
                            self.remainingCards = result.remaining
                        }
                 }
                    catch {
                        print(error)
                    }
                }
            }
            
    
            dataTask.resume()
        }
    }
    //Sacar uma carta do deck
    func drawCard(cardDeckId: String){
        
    

        let urlString = "\(Constants.apiUrl)\(cardDeckId)/draw/?count=2"
        let url = URL(string: urlString)
  
        if let url = url {
            
          
            var request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
            request.httpMethod = "GET"

     
            let session = URLSession.shared
            
       
            let dataTask = session.dataTask(with: request) { data, response, error in
                
        
                if error == nil {
             
                    
                    do{
              
                        let decoder = JSONDecoder()
                        let result = try decoder.decode(CardDraw.self, from: data!)

                        DispatchQueue.main.async {
                      
                            self.cardDraw = result
                            
                  
                            self.remainingCards = result.remaining
                        }
                 }
                    catch {
                        print(error)
                    }
                }
            }
            
            dataTask.resume()

        }
    }
    //Funçao que recebe o nome de cada carta sacada
    func describeCard() -> String {
        
        var cardDescription = ""
        
        if remainingCards == nil {
            cardDescription = ""
        } else if remainingCards! == 52 {
            cardDescription = ""
        } else {
            cardDescription = "\(cardDraw?.cards?[0].value! ?? "no value") of \(cardDraw?.cards?[0].suit! ?? "no suit")"
        }
        
     return cardDescription
    }
    
    func describeCard2() -> String {

        var cardDescription2 = ""
        
        if remainingCards == nil {
            cardDescription2 = ""
        } else if remainingCards! == 52 {
            cardDescription2 = ""
        } else {
            cardDescription2 = "\(cardDraw?.cards?[1].value! ?? "no value") of \(cardDraw?.cards?[1].suit! ?? "no suit")"
        }
        
     return cardDescription2
    }
    
}
