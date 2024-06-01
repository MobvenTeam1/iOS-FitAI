//
//  ProfileView.swift
//
//  Created by Ahmet Yasin Atakan on 29.05.2024.

import SwiftUI

struct ProfileView: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 24) {
                Text("Profil")
                    .font(.system(size: 24))
                    .fontWeight(.medium)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 24)
                CardView(userName: "Jane Doe", signUpDate: "5 Mayıs 2024")
                    .padding(.top, 26)
                ProfileSettingsView(zStackFrame: (327, 284), headerText: "Kişiselleştir",
                                    imageNameArray: ["kişiselbilgiler","beslenmeplanı","antrenmanplanı","kaloritakibi","sutakibi"],
                                    textArray: ["Kişisel Bilgiler", "Beslenme Planı", "Antrenman Planı", "Kalori Takibi", "Su Takibi"])
                
                ProfileSettingsView(zStackFrame: (327, 180), headerText: "Bağlantılı Hesaplar",
                                    imageNameArray: ["applehealth","google","watch"],
                                    textArray: ["Apple Health", "Google", "Watch"])
                
                ProfileSettingsView(zStackFrame: (327, 180), headerText: "Takip",
                                    imageNameArray: ["kilogüncellemesi","sutüketim","adım"],
                                    textArray: ["Kilo Güncellemesi", "Su Tüketim", "Adım"],isOpenOrClosed: ["Açık","Kapalı","Kapalı"])
                
                ProfileSettingsView(zStackFrame: (327, 180), headerText: "Bildirim",
                                    imageNameArray: ["görevanımsatıcısı","motivasyonbildirimi","günsonuözeti"],
                                    textArray: ["Görev Anımsatıcısı", "Motivasyon Bildirimi", "Gün Sonu Özeti"], toggleIndices: [0,1,2])
                
                ProfileSettingsView(zStackFrame: (327, 232), headerText: "Destek",
                                    imageNameArray: ["yardımmerkezi","güvenlik","fitainasılçalışır","geribildirimdebulunun"],
                                    textArray: ["Yardım Merkezi", "Güvenlik", "FitAI Nasıl Çalışır?", "Geri Bildirimde Bulunun"])
                
                ProfileSettingsView(zStackFrame: (327, 128), headerText: "Yasal",
                                    imageNameArray: ["kullanımşartları","gizlilikpolitikası"],
                                    textArray: ["Kullanım Şartları", "Gizlilik Politikası"])
                ScreenModeView(imageName: ["sistem","light","dark"], actions: [
                    {print("Ekranı modu sistem olarak ayarlandı")},
                    {print("Ekranı modu light olarak ayarlandı")},
                    {print("Ekranı modu dark olarak ayarlandı")}
                ])
                LogOutButton()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .padding(.bottom, 40)
            .toolbar(.hidden)
        }
        
    }
}
