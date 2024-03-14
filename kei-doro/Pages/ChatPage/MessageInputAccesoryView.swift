import UIKit

protocol messageInputAccesoryViewDelegate: AnyObject {
    func tappedButton(text: String)
}

class messageInputAccesoryView: UIView{
    
    @IBOutlet weak var sendMessageButton: UIButton!
    @IBOutlet weak var messageTextView: UITextView!
    
    weak var delegate: messageInputAccesoryViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        instantiateNib()
        updateUI()
    }
    
    //Xibファイルを登録して、インスタンス化するメソッド
    func instantiateNib(){
        let nib = UINib(nibName: "inputAccesoryView", bundle: nil)
        guard let view = nib.instantiate(withOwner: self, options: nil).first as? UIView else {
            return
        }
        
        view.frame = self.bounds
        //親のViewの大きさが変わったら中のViewの大きさも変わる。
        view.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        self.addSubview(view)
    }
    
    func removeText(){
        messageTextView.text = ""
        sendMessageButton.isEnabled = false
    }
    
    func updateUI(){
        messageTextView.layer.cornerRadius = 15
        messageTextView.layer.borderWidth = 1
        messageTextView.layer.borderColor = UIColor.lightGray.cgColor
        //高さを可変にするのに必要
        messageTextView.isScrollEnabled = false
        //delegate処理の記述
        messageTextView.delegate = self
        
        sendMessageButton.layer.cornerRadius = 10
        sendMessageButton.imageView?.contentMode = .scaleAspectFill
        sendMessageButton.contentVerticalAlignment = .fill
        sendMessageButton.contentHorizontalAlignment = .fill
        sendMessageButton.isEnabled = false
        
        //横幅が限界まできたら改行して高さ可変にする
        autoresizingMask = .flexibleHeight
    }
    
    @IBAction func tappedSendMessageButton(_ sender: Any) {
        guard let text = messageTextView.text else { return }
        
        delegate?.tappedButton(text: text)
    }
    
    //そのViewを表示するために必要な最低の大きさにする
    override var intrinsicContentSize: CGSize{
        return .zero
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

extension messageInputAccesoryView: UITextViewDelegate{
    //textViewの内容が変更された時に発動
    func textViewDidChange(_ textView: UITextView) {
        //空だったらボタンが使えないようにする
        if textView.text.isEmpty == true{
            sendMessageButton.isEnabled = false
        } else {
            sendMessageButton.isEnabled = true
        }
    }
}
