//
//  ContentView.swift
//  Monero
//
import SwiftUI
import PolyKit

struct ContentView: View {
    @State private var isMenuSettingsVisible = false
    @State private var isCreditCardWindowVisible = false
    @State private var isNoteWindowVisible = false
    @State private var isBudgetWindowVisible = false
    @State private var isAnaliticsWindowVisible = false
    
    
    
    var body: some View {
        ZStack {
            VStack {
                Rectangle()
                    .fill(Color(red: 150/255, green: 100/255, blue: 200/255))
                    .frame(height: 150)
                    .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                
                Spacer()
                Polygon(count: 3, cornerRadius: 40)
                    .fill(Color(red: 150/255, green: 100/255, blue: 200/255))
                    .rotationEffect(.degrees(180)) // Поворот на 180 градусов
                    .scaleEffect(x: 0.35, y: 0.25)
                    .offset(y: -305) // Подвинуть на 200 пикселей наверх
                Rectangle()
                    .fill(Color(red: 150/255, green: 100/255, blue: 200/255))
                    .frame(height: 87)
                    .overlay(
                        HStack {
                            Spacer()
                            Button(action: {
                                // Действие при нажатии на кнопку карты
                                self.isCreditCardWindowVisible.toggle()
                                
                            }) {
                                Image(systemName: "creditcard")
                                    .resizable()
                                    .frame(width: 40, height: 30)
                                    .foregroundColor(.white)
                                    .fontWeight(.regular)
                            }
                            Spacer()
                            Button(action: {
                                // действие при нажатии на кнопку заметок
                                self.isNoteWindowVisible.toggle()
                                
                            }) {
                                Image(systemName: "list.bullet.rectangle.portrait")
                                    .resizable()
                                    .frame(width: 25, height: 30)
                                    .foregroundColor(.white)
                            }
                            Spacer()
                            Button(action: {
                                // Действие при нажатии на кнопку спидометра
                                self.isBudgetWindowVisible.toggle()
                            }) {
                                Image(systemName: "speedometer")
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                    .foregroundColor(.white)
                                
                            }
                            Spacer()
                            Button(action: {
                                // Действие при нажатии на кнопку круговой диаграммы
                                self.isAnaliticsWindowVisible.toggle()
                            }) {
                                Image(systemName: "chart.pie")
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                    .foregroundColor(.white)
                            }
                            Spacer()
                        }
                            .padding(.horizontal)
                            .padding(.bottom)
                           
                    )
            }
            .edgesIgnoringSafeArea(.all)
            
            VStack {
                HStack {
                    Button(action: {
                        withAnimation {
                            self.isMenuSettingsVisible.toggle()
                            
                        }
                    }) {
                        Image(systemName: "line.horizontal.3")
                            .resizable()
                            .frame(width: 46, height: 29)
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(.white)
                            .font(Font.system(size: 3))
                    }
                    Spacer()
                }
                Spacer()
            }
            .padding()
            
            if isMenuSettingsVisible {
                Color.black.opacity(0.5).edgesIgnoringSafeArea(.all)
                VStack {
                    HStack {
                        Spacer()
                        Button(action: {
                            withAnimation {
                                self.isMenuSettingsVisible.toggle()
                                
                            }
                        }) {
                            
                            Image(systemName: "chevron.left")
                                .foregroundColor(.black)
                                .font(.title)
                            
                        }
                        
                    }
                    
                    Spacer()
                    // меню настроек
                    Text("Menu Item 1")
                    Text("Menu Item 2")
                    Text("Menu Item 2")
                }
                
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.white)
                .transition(.move(edge: .leading))
                .animation(.easeInOut)
                .frame(width: UIScreen.main.bounds.width / 2)
                    .offset(x: isMenuSettingsVisible ? 0 : -UIScreen.main.bounds.width / 2)
                
                
            }
        }
        
        .sheet(isPresented: $isCreditCardWindowVisible) {
            // Вместо Text("Новое окно") здесь будет ваше представление нового окна кредитной карты
            Text("Новое окно кредитной карты")
            
        }
        
        .sheet(isPresented: $isNoteWindowVisible) {
            // Вместо Text("Новое окно") здесь будет ваше представление нового окна кредитной карты
            Text("Here u are able to see all ur spendings")
            
        }
        
        .sheet(isPresented: $isBudgetWindowVisible) {
            // Вместо Text("Новое окно") здесь будет ваше представление нового окна кредитной карты
            Text("Here u are able to see ur budget")
        }
        
        .sheet(isPresented: $isAnaliticsWindowVisible) {
            // Вместо Text("Новое окно") здесь будет ваше представление нового окна кредитной карты
            Text("Here u are able to see ur analitics")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
