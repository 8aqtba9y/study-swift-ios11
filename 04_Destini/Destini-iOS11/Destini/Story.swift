//
//  Story.swift
//  Destini
//
//  Created by Qi Jsb on 2018/03/16.
//  Copyright © 2018年 London App Brewery. All rights reserved.
//

import Foundation

class Story {
    var story:String
    var answer_a:String
    var answer_b:String
    var answer_aTo:Int
    var answer_bTo:Int
    
    init(story:String, answer_a:String, answer_b:String, answer_aTo:Int, answer_bTo:Int) {
        self.story = story
        self.answer_a = answer_a
        self.answer_b = answer_b
        self.answer_aTo = answer_aTo
        self.answer_bTo = answer_bTo
    }
}
