//
//  Request.swift
//  Networking
//
//  Created by 김민창 on 2021/04/14.
//

import Foundation

let DidReceiveFriendsNotification: Notification.Name = Notification.Name("DidRecieveFriends")

func requestFriends() {
    guard let url: URL = URL(string: "https://randomuser.me/api/?results=20&inc=name,email,picture") else { return }
    
    let session: URLSession = URLSession(configuration: .default)
    let dataTask: URLSessionDataTask = session.dataTask(with: url) { (data: Data?, responds: URLResponse?, error: Error?) in
        if let error = error {
            print(error.localizedDescription)
            return
        }
        
        guard let data = data else {return}
        
        do {
            let apiResponse: APIResponse = try JSONDecoder().decode(APIResponse.self, from: data)
            //여기서 디스패치 큐를 호출해도 무방하다.
            NotificationCenter.default.post(name: DidReceiveFriendsNotification, object: nil, userInfo: ["friends":apiResponse.results])
        } catch(let err) {
            print(err.localizedDescription)
        }
    }  //이 클로저는 요청에 대한 서버의 응답이 왔을때 실행할 클로저 이 클로저 자체는 백그라운드에서 동작하는데 디스패치 큐로 리로드를 옮겨주면 메인에서 정상적으로 동작.
    dataTask.resume() //이때 데이터 요청을 서버에 보낸다.
}
