//
//  AccountView.swift
//  Appetizers
//
//  Created by MD-HeryHamzah on 25/12/23.
//

import SwiftUI

struct AccountView: View {
    
    @StateObject var accountViewModel = AccountViewModel()
    @FocusState private var focusedtextField: FocusedTextField?
    
    enum FocusedTextField {
        case firstName, lastName, email
    }

    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("First Name", text: $accountViewModel.user.firstName)
                        .focused($focusedtextField, equals: .firstName)
                        .onSubmit { focusedtextField = .lastName }
                        .submitLabel(.next)
                        .autocorrectionDisabled(true)
                    
                    TextField("Last Name", text: $accountViewModel.user.lastName)
                        .focused($focusedtextField, equals: .lastName)
                        .onSubmit { focusedtextField = .email }
                        .submitLabel(.next)
                        .autocorrectionDisabled(true)
                    
                    TextField("Email", text: $accountViewModel.user.email)
                        .focused($focusedtextField, equals: .email)
                        .onSubmit { focusedtextField = nil }
                        .submitLabel(.continue)
                        .keyboardType(.emailAddress)
                        .textInputAutocapitalization(.none)
                        .autocorrectionDisabled(true)
                    
                    DatePicker("Birthday",
                               selection: $accountViewModel.user.birthDate,
                               in: Date().oneHundredTenYearsAgo...Date().eighteenYearsAgo, 
                               displayedComponents: .date)
                    
                    Button {
                        accountViewModel.saveChanges()
                    } label : {
                        Text("Save Changes")
                    }
                } header: {
                    Text("Personal Info")
                }
                
                Section {
                    Toggle("Extra Napkins", isOn: $accountViewModel.user.extraNapkins)
                    Toggle("Frequent Refills", isOn: $accountViewModel.user.frequensRefills)

                } header: {
                    Text("Request")
                }
                .tint(.brandPrimary)
  
            }
            .navigationTitle("😎 Account")
            .toolbar {
                ToolbarItem(placement: .keyboard) {
                    Button("Dismiss") {
                        focusedtextField = nil
                    }
                }
            }

        } 
        .onAppear {
            accountViewModel.retrieveUser()
        }
        .alert(item: $accountViewModel.alertItem) { alertItem in
            Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.alertButton)
        }
    }
}

#Preview {
    AccountView()
}
