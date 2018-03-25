//: Playground - noun: a place where people can play

import UIKit

let defaults:UserDefaults = UserDefaults.standard

let myDictionaryKey:String = "myDictionary"

defaults.set(0.24, forKey: "Volume")
defaults.set(true, forKey: "MusicOn")
defaults.set("Qi Jsb", forKey: "PlayerName")
defaults.set(Date(), forKey: "AppLastOpenedByUser")
let array:[Int] = [1, 2, 3]
defaults.set(array, forKey: "myArray")
let dictionary:[String:String] = ["name": "Qi Jsb"]
defaults.set(dictionary, forKey: myDictionaryKey)


let volume = defaults.float(forKey: "Volume")
let appLastOpen = defaults.object(forKey: "AppLastOpenedByUser") as! Date
let myArray = defaults.array(forKey: "myArray") as! [Int]
let myDictionary = defaults.dictionary(forKey: myDictionaryKey)
