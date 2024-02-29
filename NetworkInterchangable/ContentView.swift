//
//  ContentView.swift
//  NetworkInterchangable
//
//  Created by yekta on 29.02.2024.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var userListViewModel : UserListViewModel
    
    init(){
        self.userListViewModel = UserListViewModel(service: WebService())
    }
    var body: some View {
        List(userListViewModel.userList, id: \.id){user in
            VStack{
                Text(user.name)
                    .font(.title3)
                    .foregroundColor(.blue)
                    .frame(maxWidth:.infinity, alignment: .leading)
                Text(user.username)
                    .foregroundColor(.green)
                    .frame(maxWidth:.infinity, alignment: .leading)
                Text(user.email)
                    .foregroundColor(.brown)
                    .frame(maxWidth:.infinity, alignment: .leading)
            }
        }.task {
            await userListViewModel.downloadUsers()
        }
    }
}

#Preview {
    ContentView()
}
