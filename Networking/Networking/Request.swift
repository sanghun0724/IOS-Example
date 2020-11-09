//
//  Request.swift
//  Networking
//
//  Created by sangheon on 2020/11/09.
//

import Foundation

let DidReceiveFriendsNotification:Notification.Name = Notification.Name("DidRecieveFriends")

func requestFriends() {
    guard let url: URL = URL(string: "") else {
        return
    }
    
    let session:URLSession = URLSession(configuration: .default)
    let dataTask:URLSessionTask = session.dataTask(with: url) {
        (data:Data?,respons: URLResponse?,error:Error?) in
        
        if let error = error {
            print(error.localizedDescription)
            return
        }
        
        guard let data = data else {
            return
        }
        
        do{
            let apiResponse:APIResponse = try JSONDecoder().decode(APIResponse.self, from: data)
            NotificationCenter.default.post(name: DidReceiveFriendsNotification, object: nil,userInfo: ["friends":apiResponse.results])
          
        }
        catch(let err) {
            print(err.localizedDescription)
        }
    }
    dataTask.resume()
}
