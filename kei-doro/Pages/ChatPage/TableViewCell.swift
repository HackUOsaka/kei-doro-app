import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var classmateTextView: UITextView!
    @IBOutlet weak var textViewWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var myTextView: UITextView!
    @IBOutlet weak var myTextViewConstraint: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //背景色を透明にする
        backgroundColor = .clear
        updateUI()
    }
    
    var messageText: String? {
        didSet {
            guard let message = messageText else {return}
            //文字数からtextViewの幅を設定する
            let width = estimateTextViewSize(text: message).width + 20
            
            textViewWidthConstraint.constant = width
            //textViewの文字を取得
            classmateTextView.text = message
        }
    }
    
    var myMessageText: String?{
        didSet{
            guard let message = myMessageText else {return}
            myTextView.isHidden = false
            classmateTextView.isHidden = true
            classmateTextView.isHidden = true
            let width = estimateTextViewSize(text: message).width + 20
            myTextViewConstraint.constant = width
            myTextView.text = message
        }
    }
    
    var classmateMessageText: String?{
        didSet{
            guard let message = classmateMessageText else {return}
            classmateTextView.isHidden = false
            myTextView.isHidden = true
            myTextView.isHidden = true
            let width = estimateTextViewSize(text: message).width + 20
            textViewWidthConstraint.constant = width
            classmateTextView.text = message
        }
    }
    
    func estimateTextViewSize(text: String) -> CGRect{
        let size = CGSize(width: 200, height: 500)
        let options = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
        
        return NSString(string: text).boundingRect(with: size, options: options, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14)], context: nil)
    }
    
    func updateUI(){
        let mainColor = UIColor(named: "MainColor")
        guard let mainColor = mainColor else { return }
        myTextView.layer.cornerRadius = 20
        myTextView.layer.borderWidth = 1
        myTextView.layer.borderColor = mainColor.cgColor
        myTextView.isScrollEnabled = false
        myTextView.isEditable = false
        myTextView.isSelectable = false
        classmateTextView.layer.cornerRadius = 20
        classmateTextView.layer.borderWidth = 1
        classmateTextView.layer.borderColor = mainColor.cgColor
        //textViewのtextの長さに応じてセルの高さが決まるように設定したい。
        classmateTextView.isScrollEnabled = false
        classmateTextView.isEditable = false
        classmateTextView.isSelectable = false
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
