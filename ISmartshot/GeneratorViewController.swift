//
//  GeneratorViewController.swift
//  ISmartshot
//
//  Created by HARSHAVARDHAN JEMEDAR on 4/18/24.
//

import SwiftUI

struct GeneratorViewController: View {
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Generated Image")
                .font(.largeTitle)
                .bold()
                .foregroundStyle(.white)
            VStack {
                Text("Time spent: \("")")
                AsyncImage(url: viewModel.image) { image in
                    image.resizable().aspectRatio(1, contentMode: .fit)
                } placeholder: {
                    ProgressView()
                }
                .background(Color.gray.opacity(0.2))
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .infinity)
                .cornerRadius(20)
                .clipped()
            }
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color.black.edgesIgnoringSafeArea(.all))
        .onAppear {
            viewModel.generateImage()
        }
    }
}

#Preview {
    GeneratorViewController(viewModel: .init(prompt: "red car", selectedStyle: .threeDRender))
}
