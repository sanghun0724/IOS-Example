//
//  Request.swift
//  Networking
//
//  Created by sangheon on 2020/11/09.
//

import Foundation

let DidRecieveFriendsNotification:Notification.Name = Notification.Name("DidRecieveFriends")

func requestFriends() {
    guard let url: URL = URL(string: "https://randomuser.me/api/?results=20&inc=name,email,picture") else {
        print("123")
        return
    }
    
    let session:URLSession = URLSession(configuration: .default)
    let dataTask:URLSessionTask = session.dataTask(with: url) {
        (data:Data?,respons: URLResponse?,error:Error?) in
        
        if let error = error {
            print("1234")
            print(error.localizedDescription)
            return
        }
        
        guard let data = data else {
            print("12345")
            return
        }
        
        do {
            let apiResponse:APIResponse = try! JSONDecoder().decode(APIResponse.self, from: data)
            
            DispatchQueue.main.async {
                NotificationCenter.default.post(name: DidRecieveFriendsNotification, object: nil,userInfo: ["friends":apiResponse.results])
            }
        }
        
        catch(let err) {
            print("여기서 에러")
            print(err.localizedDescription)
        }
    }
    
    dataTask.resume()
}
