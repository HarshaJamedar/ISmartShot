//
//  ContentView.swift
//  ISmartshot
//
//  Created by HARSHAVARDHAN JEMEDAR on 4/18/24.
//

import SwiftUI

struct PromptViewController: View {
    
    @State var selectedStyle = ImageStyle.allCases[0]
    @State var promptText: String = ""
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Text("             IsmartShot")
                    .font(.largeTitle)
                    .multilineTextAlignment(.center)
                    .bold()
                    .foregroundStyle(.blue)
                Text("Choose a style")
                    .font(.headline)
                    .bold()
                    .foregroundStyle(.white)
                GeometryReader { reader in
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach (ImageStyle.allCases, id: \.self) { imageStyle in
                                Button {
                                    selectedStyle = imageStyle
                                } label: {
                                    Image(imageStyle.rawValue)
                                        .resizable()
                                        .background(Color.blue)
                                        .scaledToFill()
                                        .frame(width: reader.size.width * 0.4,
                                               height: reader.size.width * 0.4 * 1.4)
                                        .overlay {
                                            RoundedRectangle(cornerRadius: 20)
                                                .stroke(Color.yellow, lineWidth: imageStyle == selectedStyle ? 3 : 0)
                                        }
                                        .clipShape(RoundedRectangle(cornerRadius: 20))
                                }
                            }
                        }
                    }
                }
                Spacer()
                Text("Enter a prompt")
                    .font(.title3)
                    .bold()
                    .foregroundStyle(.white)
                TextEditor(text: $promptText)
                    .scrollContentBackground(.hidden)
                    .padding()
                    .background(Color.gray.opacity(0.15))
                    .cornerRadius(12)
                    .foregroundStyle(.white)
                    .tint(Color.blue)
                Spacer()
                VStack(alignment: .center) {
                    NavigationLink {
                        GeneratorViewController(viewModel: .init(prompt: promptText, selectedStyle: selectedStyle))
                    } label: {
                        Text("Generate")
                            .foregroundStyle(.black)
                            .padding()
                            .background(Color.blue)
                            .clipShape(Capsule())
                    }
                }
                .frame(maxWidth: .infinity)
            }
            .padding()
        .background(Color.black.edgesIgnoringSafeArea(.all))
        }
    }
}

#Preview {
    PromptViewController()
}
