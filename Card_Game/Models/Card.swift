//
//  Card.swift
//  Card_Game
//
//  Created by Felipe Imbimbo on 17/06/2023.
//


import Foundation

//Classes

class DeckOfCards: Decodable, Identifiable, ObservableObject {
    
    var success: Bool?
    var deck_id: String?
    var shuffled: Bool?
    var remaining: Int?
}


class CardDraw: Decodable, Identifiable, ObservableObject  {
    var success: Bool?
    var deck_id: String?
    var cards: [Card]?
    var remaining: Int?
}



class Card: Decodable, Identifiable, ObservableObject {
    var code: String?
    var image: String?
    var images: ImageSvgPng?
    var value: String?
    var suit: String?
}



class ImageSvgPng: Decodable, Identifiable, ObservableObject {
    var svg: String?
    var png: String?
}
