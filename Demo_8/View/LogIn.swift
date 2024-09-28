//
//  LogIn.swift
//  Demo_8
//
//  Created by User on 28.09.2024.
//

import SwiftUI

struct LogIn: View {
    @State private var isShowingDetailView = false
    @State var isShowAlert = false
    @State private var checkBox: Bool = false
    @StateObject var userViewModel = UserViewModel()
    
    var body: some View {
        
        NavigationView{
            VStack (alignment: .leading, spacing: 10){
                
                VStack (alignment: .leading, spacing: 10){
                    Text("Welcome Back")
                        .font(.custom("Roboto-Medium", size: 24))
                        .foregroundStyle(.black)
                    Text("Fill in your email and password to continue")
                        .font(.custom("Roboto-Medium", size: 14))
                        .foregroundStyle(.gray)
                }
                .padding(.top, 20)
                .padding(.leading, 5)
                
                
                VStack (alignment: .leading){
                    
                    Text("Email Address")
                        .font(.custom("Roboto-Medium", size: 14))
                        .foregroundStyle(.gray)
                    CustomField(placeholder: "**********@mail.com", text: $userViewModel.email)
                        .padding(.bottom, 20)
                    
                    Text("Password")
                        .font(.custom("Roboto-Medium", size: 14))
                        .foregroundStyle(.gray)
                    CustomPasswordField(placeholder: "**********", text: $userViewModel.password)
                        .padding(.bottom, 20)
                }
                .padding(.top, 10)
                .padding(.leading, 5)
                
                HStack{
                    CheckBox(value: $checkBox)
                        .padding(.top, 15)
                        .foregroundStyle(.gray)
                    Text("Remember password")
                        .font(.custom("Roboto-Medium", size: 12))
                        .foregroundStyle(.gray)
                        .padding(.top, 15)
                    Spacer()
                    
                    NavigationLink(destination: ForgotPassword()){
                        Text("Forgot password")
                            .font(.custom("Roboto-Medium", size: 12))
                    }
                    // .padding(.leading, 10)
                    .padding(.top, 15)
                    .foregroundStyle(.blue)
                    
                }
                .padding(.top, 10)
                .padding(.leading, 5)
                
                HStack{
                    NavigationLink(destination: ContentView(), isActive: $userViewModel.isNavigate)
                    { EmptyView() }
                    Button(action: {
                        userViewModel.signIn()
                        //                        if $userViewModel.user.name != "" {
                        //                            isShowingDetailView.toggle()
                        //                        }
                        //                        else {
                        //                            isShowAlert=true
                        //                            print(isShowAlert.description)
                        //                        }
                    })
                    { Text("Log In")
                            .frame(maxWidth: .infinity)
                            .frame(height: 46)
                        
                            .font(.custom("Roboto-Bold", size: 14))
                        //   .padding()
                        //   .background(isShowAlert ? .gray : .blue)
                            .background(.btnColorGrey)
                            .foregroundColor(.white)
                            .cornerRadius(4)
                    }
                    .alert(isPresented: $userViewModel.isShowAlert){//$isShowAlert) {
                        Alert(title: Text ("Ошибка"),
                              message: Text("Заполнены не все поля"),
                              dismissButton: .default(Text("OK")))
                    }
                }
                
                VStack (alignment: .center){
                    Text("Already have an account?")
                        .font(.custom("Roboto-Regular", size: 14))
                        .foregroundColor(.btnColorGrey)
                    
                    NavigationLink(destination: SignUp()){
                        Text("SignUp")
                            .font(.custom("Roboto-Regular", size: 14))
                        //    .foregroundColor(.btnColorGrey)
                        //    .background(Color.blue)
                    }
                
                //   .padding(5)
                
              //  HStack (){
                    Text("or log in using")
                        .font(.custom("Roboto-Regular", size: 14))
                        .foregroundColor(.btnColorGrey)
                    Image("Vector")
                        .imageScale(.large)
                        .foregroundStyle(.tint)
                }
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
              //  .background(Color.red)
            }
            .padding(.vertical, 5)
            .padding(.horizontal, 5)
        }
        
        
    }
}

#Preview {
    LogIn()
}
