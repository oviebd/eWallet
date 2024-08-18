//
//  PinnedScrolledView.swift
//  eWallet
//
//  Created by Habibur Rahman on 10/8/24.
//

import SwiftUI

struct Message  : Identifiable {
    var id : String = UUID().uuidString
    var message = ""
}

struct PinnedScrolledView: View {
    
    let maxHeight = UIScreen.main.bounds.height / 2.3
    var topEdge : CGFloat
    var messages : [Message] = [Message(message: "One") , Message(message: "Two"), Message(message: "One") , Message(message: "Two"), Message(message: "One") , Message(message: "Two"), Message(message: "One") , Message(message: "Two")]
    
    
    //Offset
    @State var offset : CGFloat = 0
    
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false){
            
            VStack(spacing: 15){
                
                //Top Nav View
                
                GeometryReader{ proxy in
                    
                    TopBarView(topEdge: topEdge, offset: $offset, maxHeight: maxHeight)
                        .foregroundStyle(Color.white)
                        .frame(maxWidth: .infinity)
                    
                    //Sticky Effect ...
                        .frame(height: getHeaderHeight(), alignment : .bottom)
                        .background(Color.theme.darkBlue, in: CustomCorner(corners: [.bottomRight], radius: getCornerRadius()))
                        .overlay(
                            // Top Nav View
                            
                            HStack(spacing: 15){
                                Button{
                                    
                                }label: {
                                    Image(systemName: "xmark")
                                        .font(.body.bold())
                                }
                                
                                Image("pic")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 35, height: 35)
                                    .clipShape(Circle())
                                    .opacity(topBarTitleOpacity())
                                
                                Text("GOT")
                                    .fontWeight(.bold)
                                    .foregroundStyle(Color.white)
                                    .opacity(topBarTitleOpacity())
                                
                                Spacer()
                                
                                Button{
                                    
                                }label: {
                                    Image(systemName: "line.3.horizontal.decrease")
                                        .font(.body.bold())
                                }
                            }
                                .padding(.horizontal)
                            //Max Height
                            .frame(height: 80)
                            .foregroundStyle(Color.white)
                            .padding(.top,topEdge)
                            , alignment: .top
                            
                        )
                      
                    
                }.frame(height: maxHeight)
                //Fixing at top
                    .offset(y: -offset)
                    .zIndex(1)
                
                //Sample Messages ...
                VStack(spacing:15){
                    ForEach(messages){ message in
                         MessageCardView(message: message)
                    }
                }
                .padding()
                .zIndex(0)
            }
            .modifier(OffsetModifier(offset: $offset))
        }
        .coordinateSpace(.named("SCROLL"))
        
    }
    
    
    func getCornerRadius() -> CGFloat {
        let progress = -offset / (maxHeight - (80 + topEdge))
        let value = 1 - progress
        let radius = value * 50
        return offset < 0 ? radius : 50
    }
    
    func getHeaderHeight() -> CGFloat {
        let topHeight = maxHeight + offset
        // Height is the constant top navBar height
        // Since we included top safe area so we also need to include that too ..
        
        return topHeight > (80 + topEdge) ? topHeight : (80 + topEdge)
    }
    
    func topBarTitleOpacity () -> CGFloat {
        let progress = -(offset + 60) / (maxHeight - (80 + topEdge))
        //let opacity = 1 - progress
        return progress
    }
}

#Preview {
  //  PinnedScrolledView(topEdge: )
    ContentView()
}


struct MessageCardView : View {
    var message : Message
  
    var body: some View {
        HStack(){
            Text(message.message)
        }
        .frame(height: 100)
        .padding()
    }
}
