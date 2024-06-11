//
//  SettingsView.swift
//  festivalculc-app
//
//  Created by oyunomin on 2023/08/26.
//

/*import SwiftUI

struct SettingView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var AppManager: AppManager
    @State private var yakitoriPrice = ""
    @State private var furanku = false
    @State private var isToggled: Bool = false
    
    var body: some View {
        VStack {
            Text("設定システム")
                .font(.system(size: 50))
                .fontWeight(.bold)
            .padding()
            Form {
                Section(header: Text("串物")) {
                    HStack(spacing: 0){
                        Text("焼き鳥の金額")
                            .frame(width: 200, alignment: .leading)
                            .padding()
                        Spacer(minLength: 300)
                        TextField(/*@START_MENU_TOKEN@*/"Placeholder"/*@END_MENU_TOKEN@*/, text: $yakitoriPrice)
                            .padding()
                    }
                }
                Button("保存", action: {
                    if let price = Int(yakitoriPrice) {
                        AppManager.yakitoriPrice = price
                    }
                })
                    .padding()
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
*/
