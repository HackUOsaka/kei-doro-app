//
//  ChatView.swift
//  kei-doro
//
//  Created by 大澤清乃 on 2024/03/14.
//

import SwiftUI

struct ChatView: View {
    var body: some View {
        ChatViewControllerWrapper {
            Text("Hello, World!")
        }
    }
}

struct ChatViewControllerWrapper<Content: View>: UIViewControllerRepresentable {
    typealias UIViewControllerType = ChatViewController
    var content: () -> Content
    
    func makeUIViewController(context: Context) -> ChatViewController {
        let viewControllerWithStoryboard = ChatViewController()
        return viewControllerWithStoryboard
    }
    
    func updateUIViewController(_ uiViewController: ChatViewController, context: Context) {
    }
}

#Preview {
    ChatView()
}
