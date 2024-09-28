//
//  SignUp.swift
//  Demo_8
//
//  Created by User on 28.09.2024.
//


//Класс предназачен для отображения экрана SignUp
//28.09.2024
//Саввина Елена Викторовна



import SwiftUI

struct SignUp: View {
    
    @State private var isShowingDetailView = false
    @State var isShowAlert = false
    @State private var checkBox: Bool = false
    @StateObject var userViewModel = UserViewModel()
    
    var body: some View {
        
        //Элемент для навигации
        NavigationView{
            //Главный стек, на котором располагаются другие стеки для адаптивной верстки
            VStack{
                
                VStack (alignment: .leading, spacing: 10){
                    Text("Create an account")
                        .font(.custom("Roboto-Medium", size: 24))
                        .foregroundStyle(.black)
                    Text("Complete the sign up to get started")
                        .font(.custom("Roboto-Medium", size: 14))
                        .foregroundStyle(.gray)
                }
                .padding(.top, 20)
                
                VStack (alignment: .leading){
                    Text("Full name")
                        .font(.custom("Roboto-Medium", size: 14))
                        .foregroundStyle(.gray)
                    CustomField(placeholder: "Ivanov Ivan", text: $userViewModel.user.name)
                        .padding(.bottom, 20)
                    Text("Phone Number")
                        .font(.custom("Roboto-Medium", size: 14))
                        .foregroundStyle(.gray)
                    CustomField(placeholder: "+7(999)999-99-99", text: $userViewModel.user.phone)
                        .padding(.bottom, 20)
                    
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
                    
                    Text("Confirm Password")
                        .font(.custom("Roboto-Medium", size: 14))
                        .foregroundStyle(.gray)
                    CustomPasswordField(placeholder: "**********", text: $userViewModel.confirmPassword)
                        .padding(.bottom, 20)
                    
                }
                .padding(5)
                
                HStack(){
                    CheckBox(value: $checkBox)
                        .padding(2)
                    Spacer()
                    
                    Text("By ticking this box, you agree to our ")
                        .font(.custom("Roboto-Medium", size: 12))
                        .foregroundStyle(.gray)
                    
                    Link(destination: URL(string: "https://ya.ru")!) {Text("Teams and conditions and private policy")
                            .font(.system(size: 12))
                    }
                    
                }
                //   .background(Color.red)
                .padding(5)
                
                HStack{
                    NavigationLink(destination: LogIn(), isActive: $userViewModel.isNavigate)
                    { EmptyView() }
                    Button(action: {userViewModel.signUp()
                        //                        if $userViewModel.user.name != "" {
                        //                            isShowingDetailView.toggle()
                        //                        }
                        //                        else {
                        //                            isShowAlert=true
                        //                            print(isShowAlert.description)
                        //                        }
                    })
                    { Text("Sign up")
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
                
                
                
                
                
                VStack {
                    Text("Already have an account?")
                        .font(.custom("Roboto-Regular", size: 14))
                        .foregroundColor(.btnColorGrey)

                    
                    NavigationLink(destination: LogIn()){
                        Text("SignIn")
                            .font(.custom("Roboto-Regular", size: 14))
                         //   .foregroundColor(.btnColorGrey)
                    }
                }
                //   .padding(5)
                
                VStack (){
                    Text("or sign in using")
                        .font(.custom("Roboto-Regular", size: 14))
                        .foregroundColor(.btnColorGrey)
                    Image("Vector")
                        .imageScale(.large)
                        .foregroundStyle(.tint)
                }
            }
            .padding(.vertical, 5)
            .padding(.horizontal, 5)
        }
        
            
        }
        
    }


#Preview {
    SignUp()
}
