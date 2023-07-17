//
//  ContentView.swift
//  SampleApp
//
//  Created by curry on 2023/3/9.
//

import SwiftUI


struct ContentView: View {
    var body: some View {
        /// 1. test image which was imported by yourself in the Assets (/SampleApp/Assets)
        let path = Bundle.main.path(forResource: "2023", ofType: "png") ?? Bundle.main.bundlePath
        let img = UIImage(contentsOfFile: path) ?? UIImage(named: "2023")
        Image(uiImage: img ?? UIImage())
            .resizable()
            .frame(width: 60, height: 60)

        let ok = OtherClassTest().otherTest()

        Image("2023", bundle: Bundle.main)
            .resizable()
            .frame(width: 50, height: 50)
    }
}
