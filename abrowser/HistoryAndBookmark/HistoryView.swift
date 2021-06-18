    //
    //  HistoryView.swift
    //  abrowser
    //
    //  Created by 李兴利 on 2021/6/4.
    //
    
    import SwiftUI
    
    struct SearchBar : UIViewRepresentable {
        
        @Binding var text : String
        
        class Cordinator : NSObject, UISearchBarDelegate {
            
            @Binding var text : String
            
            init(text : Binding<String>) {
                _text = text
            }
            
            func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
                text = searchText
            }
        }
        
        func makeCoordinator() -> SearchBar.Cordinator {
            return Cordinator(text: $text)
        }
        
        func makeUIView(context: UIViewRepresentableContext<SearchBar>) -> UISearchBar {
            let searchBar = UISearchBar(frame: .zero)
            searchBar.delegate = context.coordinator
            return searchBar
        }
        
        func updateUIView(_ uiView: UISearchBar, context: UIViewRepresentableContext<SearchBar>) {
            uiView.text = text
        }
    }
    
    struct HistoryView: View {
        @State var clearBtnIsPresented = false
        @State private var searchTerm : String = ""
        @ObservedObject var historyState : HistoryState
        @ObservedObject var navigationState : NavigationState
        @Binding var isPresented : Bool
        
        func deleteRowToday(at offsets:IndexSet) {
            historyState.historytoday.remove(atOffsets: offsets)
        }
        
        func deleteRowYesterday(at offsets:IndexSet) {
            historyState.historyyesterday.remove(atOffsets: offsets)
        }
        
        func deleteRowAgo(at offsets:IndexSet) {
            historyState.historyago.remove(atOffsets: offsets)
        }
        
        var body: some View {
            VStack(spacing:0){
                SearchBar(text: $searchTerm)
                ForEach(historyState.history.filter{ item in
                    self.searchTerm.isEmpty ? false : item.websitename.localizedStandardContains(self.searchTerm)
                }, id: \.self) { i in
                    HistoryCellView(model: i)
                        .onTapGesture {
                            navigationState.navGoTo(addressInput: i.websiteURL)
                            isPresented = false
                        }
                }
                List{
                    
                    if (!historyState.historytoday.isEmpty) {
                        Section(header: Text("今天")) {
                            ForEach(historyState.historytoday) { item in
                                HistoryCellView(model: item)
                                    .onTapGesture {
                                        navigationState.navGoTo(addressInput: item.websiteURL)
                                        isPresented = false
                                    }
                            }.onDelete(perform: deleteRowToday)
                        }
                    }
                    if (!historyState.historyyesterday.isEmpty) {
                        Section(header: Text("昨天")) {
                            ForEach(historyState.historyyesterday) { item in
                                HistoryCellView(model: item)
                                    .onTapGesture {
                                        navigationState.navGoTo(addressInput: item.websiteURL)
                                        isPresented = false
                                    }
                            }.onDelete(perform: deleteRowYesterday)
                        }
                    }
                    if (!historyState.historyago.isEmpty) {
                        Section(header: Text("更早之前")) {
                            ForEach(historyState.historyago) { item in
                                HistoryCellView(model: item)
                                    .onTapGesture {
                                        navigationState.navGoTo(addressInput: item.websiteURL)
                                        isPresented = false
                                    }
                            }.onDelete(perform: deleteRowAgo)
                        }
                    }
                }
                
                HStack{
                    Spacer()
                    Button(action: {
                        // 清除
                        self.clearBtnIsPresented = true
                    }, label: {
                        Text("清除")
                    })
                    .actionSheet(isPresented: $clearBtnIsPresented) {
                        ActionSheet(title: Text("清除历史记录"), buttons: [
                            .destructive(Text("今天")) {
                                historyState.deleteTodayHistory()
                            },
                            .destructive(Text("今天和昨天")) {
                                historyState.deleteTodayandYesterdayHistory()
                            },
                            .destructive(Text("全部")) {
                                historyState.deleteAllHistory()
                                
                            },
                            .cancel(Text("取消"))
                        ])
                    }
                }
                .padding(.horizontal)
                .padding(.top, 8)
                .padding(.bottom)
                //.listStyle(GroupedListStyle())
                //            .background(Color.white)
            }
        }
    }
    
    //struct HistoryView_Previews: PreviewProvider {
    //    static var previews: some View {
    //        //ListDemo()
    //        HistoryView()
    //    }
    //}
    
