//
//  UserVM.swift
//  NetworkInterchangable
//
//  Created by yekta on 29.02.2024.
//

import Foundation
class UserListViewModel:ObservableObject{
    @Published var userList = [UserVM]()
    
    private var service : NetworkService
    init(service:NetworkService) {
        self.service = service
    }
    
    
    func downloadUsers() async {
        var resource = ""
        if service.type == "WebService"{
            resource = Constants.Urls.userExtension
        }else{
            resource = Constants.Paths.baseUrl
        }
        do{
            let users = try await service.download(Constants.Urls.userExtension)
            DispatchQueue.main.async{
                self.userList = users.map(UserVM.init)
            }
        }
        catch{
            print(error)
        }
    }
    
}


struct UserVM {
    let user: User
    var id : Int{
        user.id
    }
    
    var name:String{
        user.name
    }
    
    var username:String{
        user.username
    }
    
    var email:String{
        user.email
    }
}
