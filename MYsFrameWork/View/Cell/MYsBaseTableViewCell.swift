//
//  MYsBaseTableViewCell.swift
//  MYsFrameWork
//
//  Created by mahdi yousefpour on 7/28/17.
//  Copyright © 2017 mahdi yousefpour. All rights reserved.
//

import UIKit

open class MYsBaseTableViewCell: UITableViewCell {
    open var items = [Any]()
    public var rowWidth = CGFloat(0)
    public var rowHeight = CGFloat(0)
    
    public var didSelectComplition : ()->() = {}
    public var didDeSelectComplition : ()->() = {}
    
    override open func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override open func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    public func isRTL() -> Bool {
        if let rtl = "isRTL".userdefaultData() as? Bool{
            if rtl {
                return true
            }
            return false
        }
        return false
    }
    
    open func showMessage(target: UIViewController,model:MYsAlertModel,doneCompletion:(()->Void)?,cancelCompletion:(()->Void)?){
        let titleAttributed = NSMutableAttributedString(string: model.title.localized, attributes: [NSAttributedString.Key.font:UIFont(size: 18)!])
        let messageAttributed = NSMutableAttributedString(string: model.message.localized, attributes: [NSAttributedString.Key.font:UIFont(size: 14)!])
        
        let alert = UIAlertController(title: model.title.localized, message: model.message.localized, preferredStyle: .alert)
        alert.setValue(titleAttributed, forKey : "attributedTitle")
        alert.setValue(messageAttributed, forKey : "attributedMessage")
        
        
        
        if !model.doneTitle.isEmpty{
            let doneAction = UIAlertAction(title: model.doneTitle.localized, style: .default) { (action) in
                if #available(iOS 11.0, *) {
                    action.accessibilityAttributedLabel = NSMutableAttributedString(string: model.doneTitle.localized, attributes: [NSAttributedString.Key.font:UIFont(size: 14)!])
                } else {
                    // Fallback on earlier versions
                }
                if doneCompletion != nil{
                    doneCompletion!()
                }
            }
            
            alert.addAction(doneAction)
        }
        if !model.cancelTitle.isEmpty{
            alert.addAction(UIAlertAction(title: model.cancelTitle.localized, style: .default) { (action) in
                if #available(iOS 11.0, *) {
                    action.accessibilityAttributedLabel = NSMutableAttributedString(string: model.cancelTitle.localized, attributes: [NSAttributedString.Key.font:UIFont(size: 14)!])
                } else {
                    // Fallback on earlier versions
                }
                if cancelCompletion != nil{
                    cancelCompletion!()
                }
            })
        }
        
        target.present(alert, animated: true)
    }
}
