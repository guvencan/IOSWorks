//
//  AnswerList.swift
//  MathQuiz
//
//  Created by Guvencan Karpat [Bireysel Mobil Bankacilik Squad 2] on 19.08.2021.
//

import Foundation


class Singleton{
    
    static let shared = Singleton()
    
    var list: [Result] = []
    
    private init(){}
    
}
