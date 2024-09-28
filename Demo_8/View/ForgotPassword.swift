//
//  ForgotPassword.swift
//  Demo_8
//
//  Created by User on 28.09.2024.
//

import SwiftUI

struct ForgotPassword: View {
    @State private var isShowingDetailView = false
    @State var isShowAlert = false
    @State private var checkBox: Bool = false
    @StateObject var userViewModel = UserViewModel()
    
    var body: some View {
        
        NavigationView{
            VStack (alignment: .leading, spacing: 10){
                
                VStack (alignment: .leading, spacing: 10){
                    Text("Forgot Password")
                        .font(.custom("Roboto-Medium", size: 24))
                        .foregroundStyle(.black)
                    Text("Enter your email address")
                        .font(.custom("Roboto-Medium", size: 14))
                        .foregroundStyle(.gray)
                }
                .padding(.top, 20)
             //   .padding(.leading, 5)
                
                
                VStack (alignment: .leading){
                    
                    Text("Email Address")
                        .font(.custom("Roboto-Medium", size: 14))
                        .foregroundStyle(.gray)
                    CustomField(placeholder: "**********@mail.com", text: $userViewModel.email)
                        .padding(.bottom, 20)
                }
                .padding(.top, 30)
          //      .padding(.leading, 5)
                
                HStack{
                    NavigationLink(destination: OTPVerification(), isActive: $isShowingDetailView)
                    { EmptyView() }
                    Button(action: {
                        userViewModel.signUp()
                        //                        if $userViewModel.user.name != "" {
                        //                            isShowingDetailView.toggle()
                        //                        }
                        //                        else {
                        //                            isShowAlert=true
                        //                            print(isShowAlert.description)
                        //                        }
                    })
                    { Text("Send OTP")
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
                    Text("Remember password? Back to ")
                        .font(.custom("Roboto-Regular", size: 14))
                        .foregroundColor(.btnColorGrey)
                    
                    NavigationLink(destination: LogIn()){
                        Text("SignIn")
                            .font(.custom("Roboto-Regular", size: 14))
                        //    .foregroundColor(.btnColorGrey)
                        //    .background(Color.blue)
                    }
                
                
                }
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
              //  .background(Color.red)
            }
         //   .padding(.vertical, 15)
            .padding(.horizontal, 15)
        }
        
        
    }
}

#Preview {
    ForgotPassword()
}
