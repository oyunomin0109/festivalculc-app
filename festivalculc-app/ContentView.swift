//
//  ContentView.swift
//  festivalculc-app
//
//  Created by oyunomin on 2023/08/25.
//

import SwiftUI

class AppManager: ObservableObject {
    @AppStorage("yakitoriPrice") var yakitoriPrice: Int = 150
    @AppStorage("tukunePrice") var tukunePrice: Int = 150
    @AppStorage("furankuPrice") var furankuPrice: Int = 200
    @AppStorage("yakisobaPrice") var yakisobaPrice: Int = 350
    @AppStorage("osekihanPrice") var osekihanPrice: Int = 350
    @AppStorage("namabeerPrice") var namabeerPrice: Int = 500
    @AppStorage("kanbeerPrice") var kanbeerPrice: Int = 300
    @AppStorage("happouPrice") var happouPrice: Int = 250
    @AppStorage("nonalPrice") var nonalPrice: Int = 250
    @AppStorage("gohyakuPrice") var gohyakuPrice: Int = 150
    @AppStorage("nanahyakuPrice") var nanahyakuPrice: Int = 200
    @AppStorage("otherPrice") var otherPrice: Int = 0
    @AppStorage("totalAmount") var totalAmount: Int = 0
    @AppStorage("billAmount") var billAmount: Int = 0
}

struct ContentView: View {
    @EnvironmentObject var appManager: AppManager
    @State private var isSettingsPresented = false
    @State private var isCalcPresented = false
    
    @State private var yakitori = 0
    @State private var tukune = 0
    @State private var furanku = 0
    @State private var yakisoba = 0
    @State private var osekihan = 0
    @State private var namabeer = 0
    @State private var kanbeer = 0
    @State private var happou = 0
    @State private var nonal = 0
    @State private var gohyaku = 0
    @State private var nanahyaku = 0
    @State private var otherPrice = ""
    @State private var newother = 0
    
    var body: some View {
        VStack {
            Text("合計金額: \(appManager.totalAmount)円")
                .font(.system(size: 40))
                .fontWeight(.bold)
                .frame(maxWidth: 600, alignment: .trailing)
                .padding()
            Form {
                Section(header: Text("串類")) {
                    HStack {
                        Stepper("焼き鳥 \(appManager.yakitoriPrice)円    \(self.yakitori)個", onIncrement: {
                            self.yakitori += 1
                        }, onDecrement: {
                            if(self.yakitori > 0){
                                self.yakitori -= 1
                            }
                        })
                        .padding()
                        Stepper("つくね \(appManager.tukunePrice)円    \(self.tukune)個", onIncrement: {
                            self.tukune += 1
                        }, onDecrement: {
                            if(self.tukune > 0){
                                self.tukune -= 1
                            }
                        })
                        .padding()
                    }
                    HStack {
                        Stepper("フランク \(appManager.furankuPrice)円    \(self.furanku)個", onIncrement: {
                            self.furanku += 1
                        }, onDecrement: {
                            if(self.furanku > 0){
                                self.furanku -= 1
                            }
                        })
                        .padding()
                        .frame(maxWidth: 348, alignment: .leading)
                    }
                }
                Section(header: Text("パック類")) {
                    HStack {
                        Stepper("焼きそば \(appManager.yakisobaPrice)円    \(self.yakisoba)個", onIncrement: {
                            self.yakisoba += 1
                        }, onDecrement: {
                            if(self.yakisoba > 0){
                                self.yakisoba -= 1
                            }
                        })
                        .padding()
                        Stepper("お赤飯 \(appManager.osekihanPrice)円    \(self.osekihan)個", onIncrement: {
                            self.osekihan += 1
                        }, onDecrement: {
                            if(self.osekihan > 0){
                                self.osekihan -= 1
                            }
                        })
                        .padding()
                    }
                }
                Section(header: Text("飲み物類")) {
                    HStack {
                        Stepper("生ビール \(appManager.namabeerPrice)円    \(self.namabeer)個", onIncrement: {
                            self.namabeer += 1
                        }, onDecrement: {
                            if(self.namabeer > 0){
                                self.namabeer -= 1
                            }
                        })
                        .padding()
                        Stepper("缶ビール \(appManager.kanbeerPrice)円    \(self.kanbeer)個", onIncrement: {
                            self.kanbeer += 1
                        }, onDecrement: {
                            if(self.kanbeer > 0){
                                self.kanbeer -= 1
                            }
                        })
                        .padding()
                    }
                    HStack {
                        Stepper("発泡酒 \(appManager.happouPrice)円    \(self.happou)個", onIncrement: {
                            self.happou += 1
                        }, onDecrement: {
                            if(self.happou > 0){
                                self.happou -= 1
                            }
                        })
                        .padding()
                        Stepper("ノンアル \(appManager.nonalPrice)円    \(self.nonal)個", onIncrement: {
                            self.nonal += 1
                        }, onDecrement: {
                            if(self.nonal > 0){
                                self.nonal -= 1
                            }
                        })
                        .padding()
                    }
                    HStack {
                        Stepper("500ml \(appManager.gohyakuPrice)円    \(self.gohyaku)個", onIncrement: {
                            self.gohyaku += 1
                        }, onDecrement: {
                            if(self.gohyaku > 0){
                                self.gohyaku -= 1
                            }
                        })
                        .padding()
                        Stepper("700ml \(appManager.nanahyakuPrice)円    \(self.nanahyaku)個", onIncrement: {
                            self.nanahyaku += 1
                        }, onDecrement: {
                            if(self.nanahyaku > 0){
                                self.nanahyaku -= 1
                            }
                        })
                        .padding()
                    }
                }
                Section(header: Text("その他")) {
                    HStack(spacing: 0){
                        Text("その他金額")
                            .frame(width: 200, alignment: .leading)
                            .padding()
                        Spacer(minLength: 300)
                        TextField("Placeholder", text: $otherPrice)
                            .padding()
                    }
                }
                HStack {
                    Button("クリア", action: {
                        let clearvalue = 0
                        DispatchQueue.main.async {
                            appManager.totalAmount = clearvalue
                            self.yakitori = clearvalue
                            self.tukune = clearvalue
                            self.furanku = clearvalue
                            self.yakisoba = clearvalue
                            self.osekihan = clearvalue
                            self.namabeer = clearvalue
                            self.kanbeer = clearvalue
                            self.happou = clearvalue
                            self.nonal = clearvalue
                            self.gohyaku = clearvalue
                            self.nanahyaku = clearvalue
                        }
                    })
                    .padding()
                    .buttonStyle(.plain)
                    Button("計算", action: {
                        if let other = Int(otherPrice) {
                            self.newother = other
                        }
                        let newTotal = (appManager.yakitoriPrice * self.yakitori) + (appManager.tukunePrice * self.tukune) + (appManager.furankuPrice * self.furanku) + (appManager.yakisobaPrice * self.yakisoba) + (appManager.osekihanPrice * self.osekihan) + (appManager.namabeerPrice * self.namabeer) + (appManager.kanbeerPrice * self.kanbeer) + (appManager.nonalPrice * self.nonal) +
                        (appManager.gohyakuPrice * self.gohyaku) + (appManager.nanahyakuPrice * self.nanahyaku) + self.newother
                        DispatchQueue.main.async {
                            appManager.totalAmount = newTotal
                        }
                    })
                    .padding()
                    .buttonStyle(.plain)
                    Button("お釣り", action: {
                        isCalcPresented = true
                    })
                    .padding()
                    .buttonStyle(.plain)
                    Button("設定", action: {
                        isSettingsPresented = true
                    })
                    .padding()
                    .buttonStyle(.plain)
                }
            }
        }
        .sheet(isPresented: $isCalcPresented, content: {
            CalcView(isPresented: $isCalcPresented) // isPresentedを渡す
                .environmentObject(appManager)
        })
        .sheet(isPresented: $isSettingsPresented, content: {
            SettingsView(isPresented: $isSettingsPresented) // isPresentedを渡す
                .environmentObject(appManager)
        })
    }
}

struct CalcView: View {
    @EnvironmentObject var appManager: AppManager
    
    @State private var ichi = 0
    @State private var zyu = 0
    @State private var gozyu = 0
    @State private var hyaku = 0
    @State private var gohyaku = 0
    @State private var sen = 0
    @State private var gosen = 0
    @State private var ichiman = 0
    @Binding var isPresented: Bool // 追加
    
    var body: some View {
        VStack {
            Text("会計計算")
                .font(.system(size: 50))
                .fontWeight(.bold)
            .padding()
            Form {
                Text("合計金額: \(appManager.totalAmount)円")
                    .font(.system(size: 50))
                    .fontWeight(.bold)
                .padding()
                Text("お釣り: \(appManager.billAmount)円")
                    .font(.system(size: 40))
                    .fontWeight(.bold)
                    .frame(alignment: .trailing)
                .padding()
                HStack {
                    Stepper("1万円札    \(self.ichiman)枚", onIncrement: {
                        self.ichiman += 1
                    }, onDecrement: {
                        if(self.ichiman > 0){
                            self.ichiman -= 1
                        }
                    })
                    .padding()
                    Stepper("5千円札    \(self.gosen)枚", onIncrement: {
                        self.gosen += 1
                    }, onDecrement: {
                        if(self.gosen > 0){
                            self.gosen -= 1
                        }
                    })
                    .padding()
                }
                HStack {
                    Stepper("1000円札    \(self.sen)枚", onIncrement: {
                        self.sen += 1
                    }, onDecrement: {
                        if(self.sen > 0){
                            self.sen -= 1
                        }
                    })
                    .padding()
                    Stepper("500円玉    \(self.gohyaku)枚", onIncrement: {
                        self.gohyaku += 1
                    }, onDecrement: {
                        if(self.gohyaku > 0){
                            self.gohyaku -= 1
                        }
                    })
                    .padding()
                }
                HStack {
                    Stepper("100円玉    \(self.hyaku)枚", onIncrement: {
                        self.hyaku += 1
                    }, onDecrement: {
                        if(self.hyaku > 0){
                            self.hyaku -= 1
                        }
                    })
                    .padding()
                    Stepper("50円玉    \(self.gozyu)枚", onIncrement: {
                        self.gozyu += 1
                    }, onDecrement: {
                        if(self.gozyu > 0){
                            self.gozyu -= 1
                        }
                    })
                    .padding()
                }
                HStack {
                    Stepper("10円玉    \(self.zyu)枚", onIncrement: {
                        self.zyu += 1
                    }, onDecrement: {
                        if(self.zyu > 0){
                            self.zyu -= 1
                        }
                    })
                    .padding()
                    Stepper("1円玉    \(self.ichi)枚", onIncrement: {
                        self.ichi += 1
                    }, onDecrement: {
                        if(self.ichi > 0){
                            self.ichi -= 1
                        }
                    })
                    .padding()
                }
                HStack {
                    Button("計算する", action: {
                        let newTotal = 10000 * self.ichiman + 5000 * self.gosen + 1000 * self.sen + 500 * self.gohyaku + 100 * self.hyaku + 50 * self.gozyu + 10 * self.zyu + 1 * self.ichi
                        DispatchQueue.main.async {
                            appManager.billAmount = newTotal - appManager.totalAmount
                        }
                    })
                    .padding()
                    .buttonStyle(.plain)
                    Button("戻る", action: {
                        self.ichiman = 0
                        self.gosen = 0
                        self.sen = 0
                        self.gohyaku = 0
                        self.hyaku = 0
                        self.gozyu = 0
                        self.zyu = 0
                        self.ichi = 0
                        appManager.billAmount = 0
                        isPresented = false // SettingsViewを閉じる
                    })
                    .padding()
                    .buttonStyle(.plain)
                }
            }
        }
        .onAppear {
        }
    }
}


struct SettingsView: View {
    @EnvironmentObject var appManager: AppManager
    @State private var yakitoriPrice = ""
    @State private var tukunePrice = ""
    @State private var furankuPrice = ""
    @State private var yakisobaPrice = ""
    @State private var osekihanPrice = ""
    @State private var namabeerPrice = ""
    @State private var kanbeerPrice = ""
    @State private var happouPrice = ""
    @State private var nonalPrice = ""
    @State private var gohyakuPrice = ""
    @State private var nanahyakuPrice = ""
    @Binding var isPresented: Bool // 追加

    var body: some View {
        VStack {
            Text("設定システム")
                .font(.system(size: 50))
                .fontWeight(.bold)
            .padding()
            Form {
                ScrollView {
                    Section(header: Text("串物")) {
                        HStack(spacing: 0){
                            Text("焼き鳥の金額")
                                .frame(width: 200, alignment: .leading)
                                .padding()
                            Spacer(minLength: 300)
                            TextField(/*@START_MENU_TOKEN@*/"Placeholder"/*@END_MENU_TOKEN@*/, text: $yakitoriPrice)
                                .padding()
                        }
                        HStack(spacing: 0){
                            Text("つくねの金額")
                                .frame(width: 200, alignment: .leading)
                                .padding()
                            Spacer(minLength: 300)
                            TextField(/*@START_MENU_TOKEN@*/"Placeholder"/*@END_MENU_TOKEN@*/, text: $tukunePrice)
                                .padding()
                        }
                        HStack(spacing: 0){
                            Text("フランクの金額")
                                .frame(width: 200, alignment: .leading)
                                .padding()
                            Spacer(minLength: 300)
                            TextField(/*@START_MENU_TOKEN@*/"Placeholder"/*@END_MENU_TOKEN@*/, text: $furankuPrice)
                                .padding()
                        }
                    }
                    Section(header: Text("パック類")) {
                        HStack(spacing: 0){
                            Text("焼きそばの金額")
                                .frame(width: 200, alignment: .leading)
                                .padding()
                            Spacer(minLength: 300)
                            TextField(/*@START_MENU_TOKEN@*/"Placeholder"/*@END_MENU_TOKEN@*/, text: $yakisobaPrice)
                                .padding()
                        }
                        HStack(spacing: 0){
                            Text("お赤飯の金額")
                                .frame(width: 200, alignment: .leading)
                                .padding()
                            Spacer(minLength: 300)
                            TextField(/*@START_MENU_TOKEN@*/"Placeholder"/*@END_MENU_TOKEN@*/, text: $osekihanPrice)
                                .padding()
                        }
                    }
                    Section(header: Text("飲み物類")) {
                        HStack(spacing: 0){
                            Text("生ビールの金額")
                                .frame(width: 200, alignment: .leading)
                                .padding()
                            Spacer(minLength: 300)
                            TextField(/*@START_MENU_TOKEN@*/"Placeholder"/*@END_MENU_TOKEN@*/, text: $namabeerPrice)
                                .padding()
                        }
                        HStack(spacing: 0){
                            Text("缶ビールの金額")
                                .frame(width: 200, alignment: .leading)
                                .padding()
                            Spacer(minLength: 300)
                            TextField(/*@START_MENU_TOKEN@*/"Placeholder"/*@END_MENU_TOKEN@*/, text: $kanbeerPrice)
                                .padding()
                        }
                        HStack(spacing: 0){
                            Text("発泡酒の金額")
                                .frame(width: 200, alignment: .leading)
                                .padding()
                            Spacer(minLength: 300)
                            TextField(/*@START_MENU_TOKEN@*/"Placeholder"/*@END_MENU_TOKEN@*/, text: $happouPrice)
                                .padding()
                        }
                        HStack(spacing: 0){
                            Text("ノンアルの金額")
                                .frame(width: 200, alignment: .leading)
                                .padding()
                            Spacer(minLength: 300)
                            TextField(/*@START_MENU_TOKEN@*/"Placeholder"/*@END_MENU_TOKEN@*/, text: $nonalPrice)
                                .padding()
                        }
                        HStack(spacing: 0) {
                            Text("500mlの金額")
                                .frame(width: 200, alignment: .leading)
                                .padding()
                            Spacer(minLength: 300)
                            TextField(/*@START_MENU_TOKEN@*/"Placeholder"/*@END_MENU_TOKEN@*/, text: $gohyakuPrice)
                                .padding()
                        }
                        HStack(spacing: 0) {
                            Text("700mlの金額")
                                .frame(width: 200, alignment: .leading)
                                .padding()
                            Spacer(minLength: 300)
                            TextField(/*@START_MENU_TOKEN@*/"Placeholder"/*@END_MENU_TOKEN@*/, text: $nanahyakuPrice)
                                .padding()
                        }
                    }
                }
            }
            Button("保存", action: {
                if let yakitori = Int(yakitoriPrice) {
                    appManager.yakitoriPrice = yakitori
                }
                if let tukune = Int(tukunePrice) {
                    appManager.tukunePrice = tukune
                }
                if let furanku = Int(furankuPrice) {
                    appManager.furankuPrice = furanku
                }
                if let yakisoba = Int(yakisobaPrice) {
                    appManager.yakisobaPrice = yakisoba
                }
                if let osekihan = Int(osekihanPrice) {
                    appManager.osekihanPrice = osekihan
                }
                if let namabeer = Int(namabeerPrice) {
                    appManager.namabeerPrice = namabeer
                }
                if let kanbeer = Int(kanbeerPrice) {
                    appManager.kanbeerPrice = kanbeer
                }
                if let happou = Int(happouPrice) {
                    appManager.happouPrice = happou
                }
                if let nonal = Int(nonalPrice) {
                    appManager.nonalPrice = nonal
                }
                if let gohyaku = Int(gohyakuPrice) {
                    appManager.gohyakuPrice = gohyaku
                }
                if let nanahyaku = Int(nanahyakuPrice) {
                    appManager.nanahyakuPrice = nanahyaku
                }
                isPresented = false // SettingsViewを閉じる
            })
            .padding()
        }
        .onAppear {
            yakitoriPrice = "\(appManager.yakitoriPrice)"
            tukunePrice = "\(appManager.tukunePrice)"
            furankuPrice = "\(appManager.furankuPrice)"
            yakisobaPrice = "\(appManager.yakisobaPrice)"
            osekihanPrice = "\(appManager.osekihanPrice)"
            namabeerPrice = "\(appManager.namabeerPrice)"
            kanbeerPrice = "\(appManager.kanbeerPrice)"
            happouPrice = "\(appManager.happouPrice)"
            nonalPrice = "\(appManager.nonalPrice)"
            gohyakuPrice = "\(appManager.gohyakuPrice)"
            nanahyakuPrice = "\(appManager.nanahyakuPrice)"
        }
    }
}
