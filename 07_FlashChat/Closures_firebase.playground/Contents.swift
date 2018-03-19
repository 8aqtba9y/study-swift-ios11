//: Playground - noun: a place where people can play

import UIKit

class Firebase {
    func createUser(userName: String, password:String, completion: (Bool, Int) -> Void) {
        // does something time consuming
        
        let isSuccess = true
        let userID = 123
        completion(isSuccess, userID)
    }
}


class MyApp {
    func registerButtonPressed() {
        let firebase = Firebase()
        firebase.createUser(userName: "8aqtba9y", password: "123456", completion: completed)
        
        firebase.createUser(userName: "8aqtba9y", password: "123456", completion: { (isSuccess: Bool, userID: Int) in
            print("registration is successful: \(isSuccess)")
            print("userID is: \(userID)")
        })
    }
    func completed(isSuccess: Bool, userID: Int) {
        print("registration is successful: \(isSuccess)")
        print("userID is: \(userID)")
    }
}

let myApp = MyApp()
myApp.registerButtonPressed()


