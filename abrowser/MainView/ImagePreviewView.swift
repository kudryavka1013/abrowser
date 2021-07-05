//
//  ImagePreviewView.swift
//  abrowser
//
//  Created by 李兴利 on 2021/7/2.
//

import SwiftUI

struct ImagePreviewView: View {
    @ObservedObject var navigationState: NavigationState
    var body: some View {
        ZStack{
            Rectangle()
                .fill(Color.black)
                .opacity(0.8)
            
            Image(uiImage: navigationState.previewImages[navigationState.currentIndex])
                .resizable()
                .scaledToFit()
                .frame(width:UIScreen.main.bounds.width, alignment: .center)

            VStack{
                ZStack{
                    HStack{
                        Spacer()
                        Text("\(navigationState.currentIndex + 1) / \(navigationState.previewImages.count)")
                            .foregroundColor(.white)
                        Spacer()
                    }
                    .padding(.top,16)
                    HStack{
                        Spacer()
                        Button(action: {
                            navigationState.isPreviewing = false
                        }, label: {
                            Image(systemName: "xmark.circle")
                                .resizable()
                                .frame(width:24, height:24)
                                .foregroundColor(.white)
                        })
                        
                    }
                    .padding(.top,16)
                    .padding(.trailing, 16)
                }
                
                Spacer()
                //                .onTapGesture {
                //                    navigationState.isPreviewing = false
                //                }
                ZStack{
                    HStack{
                        Spacer()
                        // 上一张
                        Button(action: {
                            //                        navigationState.isPreviewing = false
                            if(navigationState.currentIndex != 0){
                                navigationState.currentIndex -= 1
                            }
                        }, label: {
                            Image(systemName: "arrow.left")
                                .resizable()
                                .scaledToFit()
                                .frame(width:24)
                                .foregroundColor(.white)
                        })
                        .padding(.bottom,16)
                        .padding(.trailing, 16)
                        // 下一张
                        Button(action: {
                            //                        navigationState.isPreviewing = false
                            if(navigationState.currentIndex != navigationState.previewImages.count - 1){
                                navigationState.currentIndex += 1
                            }
                        }, label: {
                            Image(systemName: "arrow.right")
                                .resizable()
                                .scaledToFit()
                                .frame(width:24)
                                .foregroundColor(.white)
                        })
                        .padding(.bottom,16)
                        .padding(.leading, 16)
                        Spacer()
                        
                    }
                    HStack{
                        Spacer()
                        Button(action: {
                            UIImageWriteToSavedPhotosAlbum(navigationState.previewImages[navigationState.currentIndex], nil, nil, nil)
                        }, label: {
                            Image(systemName: "arrow.down.circle")
                                .resizable()
                                .scaledToFit()
                                .frame(width:24)
                                .foregroundColor(.white)
                        })
                    }
                    .padding(.bottom,16)
                    .padding(.trailing, 16)
                    
                }
                
            }
            
            
        }
    }
}

//struct ImagePreviewView_Previews: PreviewProvider {
//    static var previews: some View {
//        ImagePreviewView()
//    }
//}
