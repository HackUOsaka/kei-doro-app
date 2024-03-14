//
//  ChatViewController.swift
//  kei-doro
//
//  Created by 大澤清乃 on 2024/03/14.
//

import Foundation
import Firebase
import FirebaseFirestore
import FirebaseAuth
import FirebaseStorage
import SwiftUI
import UIKit

class ChatViewController: UIViewController {

    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var chatTable: UITableView!
    
//    var messages: [String] = []
    let db = Firestore.firestore()
    let user = Auth.auth().currentUser
    let gameID: String = ""
    var addresses: [[String: Any]] = []
    
    
    //messageInputAccesoryViewのインスタンス作成(追加)
    lazy var chatInputAccessoryView: messageInputAccesoryView = {
        let view = messageInputAccesoryView()
        view.delegate = self
        view.frame = .init(x: 0, y: 0, width: view.frame.width , height: 100)
        return view
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        chatTable.delegate = self
        chatTable.dataSource = self
        
        chatTable.register(UINib(nibName: "chatTableViewCell", bundle: nil), forCellReuseIdentifier: "tableViewCell")
        //選択不可にする
        chatTable.allowsSelection = false
        //背景色の設定
        chatTable.backgroundColor = UIColor(red: 206/255, green: 236/255, blue: 227/255, alpha: 1)
        //区切り線をなくす
        chatTable.separatorStyle = .none
        
        //tabBarが邪魔なので非表示にする
        self.tabBarController?.tabBar.isHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //データの取り出し
        db.collection("games")
            .document(gameID)
            .collection("messages")
            .order(by: "time", descending: false)
            .addSnapshotListener {(querySnapshot, error) in
                guard let snapshot = querySnapshot else {
                    return
                }
                self.addresses.removeAll()
                for doc in snapshot.documents {
                    let message = doc.data()["chatContent"] as! String
                    let userUid = doc.data()["userUid"] as! String
                    let timeStamp = doc.data()["time"] as! Timestamp
                    
                    let date: Date = timeStamp.dateValue()
                    self.addresses.append(["chatContent": message,
                                           "userUid": userUid,
                                           "date": date])
                    print("doc: \(doc.data()["chatContent"] as! String)")
                }
                print(self.addresses)
                self.chatTable.reloadData()
                let indexPath = IndexPath(row: self.addresses.count - 1, section: 0)
                self.chatTable.scrollToRow(at: indexPath, at: .bottom, animated: false)
            }
    }
    
    override var inputAccessoryView: UIView? {
        get {
            return chatInputAccessoryView
        }
    }
    
    override var canBecomeFirstResponder: Bool {
        return true
    }
    
    func designData() {
        let backColor = UIColor(named: "BackColor")
        guard let backColor = backColor else { return }
        let mainColor = UIColor(named: "MainColor")
        guard let mainColor = mainColor else { return }
        view.backgroundColor = backColor
        closeButton.tintColor = mainColor
        
        chatTable.backgroundColor = backColor
        chatTable.inputViewController?.tabBarController?.tabBar.isHidden = true
    }
    
    // 前の画面に戻る
    @IBAction func backButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

extension ChatViewController: messageInputAccesoryViewDelegate {
    func tappedButton(text: String) {
        guard let user = Auth.auth().currentUser else { return }
        let addData: [String: Any] = ["chatContent": text,
                                      "userUid": user.uid,
                                      "time": Timestamp(date: Date())]
        db.collection("games")
            .document(gameID)
            .collection("messages")
            .addDocument(data: addData)
        chatInputAccessoryView.removeText()
//        messages.append(text)
//        chatInputAccessoryView.removeText()
//        chatTable.reloadData()
    }
}

extension ChatViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //一旦10に設定する
        return addresses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell", for: indexPath) as! TableViewCell
        let text = addresses[indexPath.row]["chatContent"] as! String
        let chatUid: String = addresses[indexPath.row]["userUid"] as! String
        let myUid: String = user!.uid
        if chatUid == myUid {
            //自分が送信したメッセージの判定と設定
            cell.myMessageText = text
        } else {
            //他人が送信したメッセージの判定と設定
            cell.classmateMessageText = text
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        //tableViewセルの高さの最低値
        tableView.estimatedRowHeight = 40
        //textViewの文字列の長さによって高さを自動調節する
        return UITableView.automaticDimension
    }
}

