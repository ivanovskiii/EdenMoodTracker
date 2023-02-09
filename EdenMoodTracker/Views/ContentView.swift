//
//  ContentView.swift
//  EdenMoodTracker
//
//  Created by Gorjan Ivanovski & Iva Naskovska on 6.2.23.
//

import SwiftUI
import CoreData
import RiveRuntime

struct Quote: Decodable{
    let q: String
    let a: String
}

class QuoteViewModel: ObservableObject{
    
    @Published var quote: String = ""
    @Published var author: String = ""
    
    func fetch(){
        let request = NSMutableURLRequest(url: NSURL(string: "https://zenquotes.io/api/random")! as URL,
                                                cachePolicy: .useProtocolCachePolicy,
                                            timeoutInterval: 10.0)
        request.httpMethod = "GET"
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print(error!)
            } else {
                let httpResponse = response as? HTTPURLResponse
                print(httpResponse!)

                let str = String.init(data: data!, encoding: .utf8)
                print(str!)

                let decoder = JSONDecoder()
                do{
                    let quoteDecoded = try decoder.decode([Quote].self, from: data!)
                    self.quote =  quoteDecoded.first!.q
                    self.author =  quoteDecoded.first!.a

                } catch{
                    print(String(describing: error))
                }

            }
        })

        dataTask.resume()
            
        }
    }

struct ContentView: View {
    
    @StateObject var quoteViewModel = QuoteViewModel()
    
    @State private var showingAddView = false
    
    @State private var ifQuoteCalled = true
    
    var body: some View {
        
        
        ZStack {
            RiveViewModel(fileName: "shapes_new").view()
                .ignoresSafeArea()
                .blur(radius: 25)
                .aspectRatio(contentMode: .fill)
            GeometryReader{ geometry in
                ScrollView(.vertical){
                    ZStack{
                        Circle()
                            .foregroundColor(Color.clear)
                            .frame(width: 350)
                            .background(
                                .thinMaterial,
                                in: Circle())
                        VStack(){
                            Text("Today")
                                .fontWeight(.light)
                                .font(.system(size: 24))
                                .foregroundColor(Color("edenIndigo"))
                            
                            Text(Date.now.formatted(.dateTime.weekday(.wide)))
                                .foregroundColor(Color("edenIndigo"))
                                .fontWeight(.bold)
                                .font(.system(size: 36))
                            
                            Text(Date.now.formatted(.dateTime.day().month().year()))
                                .foregroundColor(Color("edenIndigo"))
                                .fontWeight(.black)
                                .font(.system(size: 40))
                            
                            Button("Log Your Mood for Today"){
                                showingAddView.toggle()
                            }
                            .frame(maxWidth: 200)
                            .foregroundColor(Color(.white))
                            .padding()
                            .background(Color("edenIndigo"))
                            .clipShape(Capsule())
                            .sheet(isPresented: $showingAddView){
                                AddMoodVIew()
                            }
                        }
                    ZStack{
                        VStack{
                            Text("\""+quoteViewModel.quote+"\"")
                                .multilineTextAlignment(.center)
                                .frame(maxWidth: 350)
                                .padding(.bottom, 10)
                                .fontWeight(.bold)
                                .foregroundColor(Color("edenLavender"))
                                .background(
                                    Color.white
                                        .blur(radius: 35)
                                )
                            Text("-"+quoteViewModel.author)
                                .multilineTextAlignment(.center)
                                .fontWeight(.regular)
                                .foregroundColor(Color("edenLavender"))
                                .background(
                                    Color.white
                                        .blur(radius: 35)
                                )
                        }
                    }.padding(.top, 550)
                    .onAppear(){
                            if(ifQuoteCalled == true){
                                quoteViewModel.fetch()
                            }
                            ifQuoteCalled = false
                        }
                    }.padding()
                        .frame(width: geometry.size.width)
                        .frame(minHeight: geometry.size.height)
                }
            }
        }
    }
    
    struct ContentView_Previews: PreviewProvider{
        static var previews: some View{
            ContentView()
        }
    }
    
}
