//
//  AddTransView.swift
//  BlueChip
//
//  Created by admin on 5/11/24.
//



import SwiftUI

struct AddTransactionView: View {
    
    var completion: () -> ()
    @Environment(\.dismiss) var dismiss
    
    @State private var additionInfo = ""
    @State private var value = ""
    @State private var date = Date()
    @State private var type = "+"
    @State private var isShown: Bool? = false
    @State private var image: UIImage?
    
    @State private var wallets: [Wallet] = []
    
    var types = ["+", "-"]
    
    var body: some View {
        NavigationView {
            ZStack {
                BackgroundView()
                
                VStack {
                    ScrollView {
                        HStack {
                            Text("Value:")
                                .foregroundColor(.white)
                            
                            Spacer()
                            
                            TextField("", text: $value)
                                .font(.system(size: 22, weight: .bold))
                                .foregroundColor(.white)
                                .placeholder(when: value.isEmpty) {
                                    Text("100$").foregroundColor(.gray)
                                }
                                .keyboardType(.numberPad)
                                .frame(width: 120)
                        }
                        .padding(.vertical)
                        
                        DividerView()
                        
                        HStack {
                            Text("Type:")
                                .foregroundColor(.white)
                            
                            Spacer()
                            
                            Picker("", selection: $type) {
                                ForEach(types, id: \.self) {
                                    Text($0)
                                        .foregroundColor(.white)
                                }
                            }
                            .frame(width: 120)
                            .pickerStyle(.segmented)
                        }
                        .padding(.vertical)
                        
                        DividerView()
                        
                        DatePicker("Date", selection: $date, displayedComponents: [.date])
                            .datePickerStyle(.compact)
                            .tint(.white)
                            .foregroundColor(.white)
                            .colorMultiply(.white)
                            .accentColor(.white)
                            .padding(.vertical)
                            .colorScheme(.dark)
                        
                        DividerView()
                        
                        
                        HStack {
                            Text("Addition Info")
                                .foregroundColor(.white)
                            Spacer()
                        }
                        .padding(.vertical)
                        
                        TextEditor(text: $additionInfo)
                            .foregroundStyle(.white)
                            .padding(.horizontal)
                            .frame(height: 200)
                            .scrollContentBackgroundHidden()
                            .background(Color.lightPink.opacity(0.5).cornerRadius(12))
                            .tint(.white)
                            .padding(.bottom)
                        
                        DividerView()
                        
                        VStack {
                            HStack {
                                Text("Photo:")
                                    .foregroundColor(.white)
                                Spacer()
                                
                                Button {
                                    isShown?.toggle()
                                } label: {
                                    Image(systemName: "plus")
                                }
                                .foregroundColor(.white)
                            }
                            
                            if let image = image {
                                Image(uiImage: image)
                                    .resizable()
                                    .frame(width: screenSize().width - 60, height: 250)
                                    .scaledToFit()
                            }
                            
                        }
                        .padding(.vertical)
                        
                        DividerView()
                        
                        Button {
                            if !value.isEmpty && !wallets.isEmpty {
                                StorageManager.shared.addTransaction(
                                    wallet: wallets.first!,
                                    value: Double(value) ?? 0,
                                    note: additionInfo,
                                    type: type,
                                    image: image,
                                    date: date)
                                completion()
                                dismiss()
                            }
                        } label: {
                            Rectangle()
                                .fill(LinearGradient(colors: [.lightPink, .pink, .red], startPoint: .topLeading, endPoint: .bottomTrailing))
                                .cornerRadius(12)
                                .frame(width: screenSize().width - 80, height: 70)
                                .overlay {
                                    Text("Save")
                                        .foregroundColor(.white)
                                }
                                
                        }
                        .padding(.top)
                        
                        Button {
                            dismiss()
                        } label: {
                            Text("Cancel")
                                .foregroundColor(.red)
                                
                        }
                        .padding(.top)
                        
                        VStack {
                            
                        }
                        .frame(height: 400)
                    }
                    .hideScrollIndicator()
                }
                .padding(.top, 40)
                .padding(.horizontal)
                
            }
            .halfSheet(showSheet: $isShown) {
                BottomSheetView(selectedImage: $image) {
                    withAnimation {
                        isShown = false
                    }
                } closing: {
                    isShown = false
                }
            } onDismiss: {}
            
            //MARK: - NavBar
            .modifier(NavBarBackground())
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    HStack {
                        VStack {
                            HStack(spacing: 10) {
                                
                                Button {
                                    dismiss()
                                } label: {
                                    Image(systemName: "xmark")
                                        .foregroundColor(.white)
                                }
                                
                                
                                Spacer()
                                
                                
                                Text("Game Result")
                                    .font(.system(size: 28, weight: .black))
                                    .foregroundColor(Color.white)
                                    .padding(.trailing)
                                
                                Spacer()
                            }
                        }
                        Spacer()
                    }
                    .ignoresSafeArea()
                }
            }
        }
        .onAppear {
            wallets = StorageManager.shared.getWallets()
           
        }
    }
}

//#Preview {
//    AddTransactionView()
//}


struct DividerView: View {
    var body: some View {
        Rectangle()
            .frame(width: screenSize().width - 40, height: 1)
            .foregroundColor(.lightPink.opacity(0.5))
    }
}

