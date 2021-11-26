//
//  CategoryView.swift
//  Chalked_Quiz_Game
//
//  Created by Amy Tan on 2021-10-29.
//

import SwiftUI

struct CategoryView: View {
    let tags = [
        "Linux",
        "PHP",
        "Docker",
        "HTML",
        "MySQL",
        "WordPress",
        "Laravel",
        "JavaScript",
        "DevOps"
    ]
    
    let tagIcons = [
        "Linux": "https://cdn.discordapp.com/attachments/823140268252332042/913916481752944660/Linux-Logo-PNG-Images-HD.png",
        "PHP": "https://upload.wikimedia.org/wikipedia/commons/thumb/2/27/PHP-logo.svg/640px-PHP-logo.svg.png",
        "Docker": "https://ms-azuretools.gallerycdn.vsassets.io/extensions/ms-azuretools/vscode-docker/1.18.0/1637001306874/Microsoft.VisualStudio.Services.Icons.Default",
        "HTML": "https://cdn.discordapp.com/attachments/823140268252332042/913915887596224522/html5Logo.png",
        "MySQL": "https://d1.awsstatic.com/asset-repository/products/amazon-rds/1024px-MySQL.ff87215b43fd7292af172e2a5d9b844217262571.png",
        "WordPress": "https://www.inmotionhosting.com/support/wp-content/uploads/2019/06/WordPress-logotype-alternative.png?w=640",
        "Laravel": "https://miro.medium.com/max/400/1*j76hKq2KBP9-Y-N7KcnM6A.png",
        "JavaScript": "https://media.discordapp.net/attachments/823140268252332042/913911396637474826/JavaScript-logo.png",
        "DevOps": "https://images-ext-1.discordapp.net/external/JCPOUWIu6R4Uf729DgbV8_xFnn4ArfoNnVvBORcY1uE/http/www.vlrtraining.in/wp-content/uploads/2020/10/logo-devops.png"
    ]

    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]

    let data = (1...12)

    var body: some View {
        VStack {
            Text("CHOOSE A CATEGORY")
                .font(.title)
                .fontWeight(.bold)
                .frame(width: 325, height: 50)
                .foregroundColor(Color(red: 66 / 255, green: 129 / 255, blue: 164 / 255))
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color(red: 66 / 255, green: 129 / 255, blue: 164 / 255), lineWidth: 5)
                        .background(
                            RoundedRectangle(cornerRadius: 15)
                                .fill(Color.white)
                        )
                )
            ScrollView(.vertical) {
                VStack {
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(tags, id: \.self) {
                            tag in NavigationLink(destination: QuizBeginView(tagName: tag)) {
                                VStack {
                                    RemoteImage(url: tagIcons[tag]!)
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 125, height: 125)
                                        .shadow(color: Color(red: 66 / 255, green: 129 / 255, blue: 164 / 255), radius: 5, x: 5, y: 5)
                                }
                                .frame(width: 150, height: 150)
                                .foregroundColor(Color.white)
                                .background(Color(red: 100 / 255, green: 169 / 255, blue: 166 / 255))
                                .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
                                .shadow(color: Color(red: 66 / 255, green: 129 / 255, blue: 164 / 255), radius: 5, x: 5, y: 5)
                            }
                            .navigationBarHidden(true)
                        }
                    }
                    .padding()
                }
            }
        }
        .padding(.top, 65.0)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(red: 184 / 255, green: 225 / 255, blue: 255 / 255))
        .edgesIgnoringSafeArea([.top, .bottom])
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView()
    }
}
