//
//  MYsBaseCustomSegmentControl.swift
//  MYsFrameWork
//
//  Created by mahdi yousefpour on 3/26/18.
//  Copyright © 2018 mahdi yousefpour. All rights reserved.
//

import UIKit

// Use It
// For Use it at Table View Cell
//  in cellforRowAtIndexPath call setTitles(titles:[String]) Method
// and Then in view Controller, add gradient to highlightButton at viewDidLayoutSubviews Method
// you can set method to changeCompletionHandler closure for change selected Index
//

open class MYsBaseCustomSegmentControl: UISegmentedControl {

    open var plainText = UIColor.black{
        didSet{
            self.setTitleTextAttributes([
                NSAttributedString.Key.font : textFont!,
                NSAttributedString.Key.foregroundColor: plainText
                ], for: .normal)
        }
    }
    open var highlightText = UIColor.lightGray
//        {
//        didSet{
//            self.setTitleTextAttributes([
//                NSAttributedString.Key.font : textFont!,
//                NSAttributedString.Key.foregroundColor: highlightText
//                ], for: .selected)
//        }
//    }
    
    open var textFont = UIFont(size: 14)
    open var btnhighlight = UIButton()
    public var changeCompletionHandler: ()->Void = {}
    
    required public init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        initial()
    }
    
    open func initial(){
        self.semanticContentAttribute = .forceLeftToRight
        btnhighlight = UIButton(frame: CGRect(x: 0, y: 0, width: (self.width / CGFloat(self.numberOfSegments)), height: self.height))
        if self.segmentTitles.count >= 0 {
            btnhighlight.setTitle(self.segmentTitles[0], for: .normal)
        }
        btnhighlight.setTitleColor(highlightText, for: .normal)
        btnhighlight.setTitleColor(highlightText, for: .highlighted)
        btnhighlight.titleLabel?.font = textFont
        btnhighlight.roundCornerRadius()
        btnhighlight.alpha = 0.78
        
        
        MYsUtilities.delay(0.1) {
        self.insertSubview(self.btnhighlight, at: 0)
            UIView.animate(withDuration: 0.2) {
                self.btnhighlight.alpha = 1
                self.setHighlightButtonWidth()
            }
        }
        
        self.roundCornerRadius()
        self.backgroundColor = UIColor.white.withAlphaComponent(0.3)
        self.tintColor = .clear
        
        self.setTitleTextAttributes([
            NSAttributedString.Key.font : textFont!,
            NSAttributedString.Key.foregroundColor: plainText
            ], for: .normal)
        
        self.setTitleTextAttributes([
            NSAttributedString.Key.font : textFont!,
            NSAttributedString.Key.foregroundColor: UIColor.clear
            ], for: .selected)
        self.addTarget(self, action: #selector(self.segmentedControlValueChanged(_:)), for: UIControl.Event.valueChanged)
    }
    
    @objc func segmentedControlValueChanged(_ sender: UISegmentedControl) {
        setHighlightButtonWidth()
        self.btnhighlight.setTitle("", for: .normal)
        
        UIView.animate(withDuration: 0.3) {
            self.btnhighlight.frame.origin.x = (self.frame.width / CGFloat(self.numberOfSegments)) * CGFloat(self.selectedSegmentIndex)
            self.btnhighlight.setTitle(self.segmentTitles[self.selectedSegmentIndex], for: .normal)
        }
        changeCompletionHandler()
    }
    
    
    open func setHighlightButtonWidth(){
        btnhighlight.frame.size.width = self.width / CGFloat(self.numberOfSegments)
    }
    
    open func setTitles(titles:[String]){
        self.segmentTitles = titles
        switch titles.count {
        case 2:
            textFont = UIFont(size: 14)
            self.btnhighlight.titleLabel?.font = textFont
        case 3:
            textFont = UIFont(size: 12)
            self.btnhighlight.titleLabel?.font = textFont
        case 4:
            textFont = UIFont(size: 11)
            self.btnhighlight.titleLabel?.font = textFont
        default:
            textFont = UIFont(size: 11)
            self.btnhighlight.titleLabel?.font = textFont
        }
        initial()
    }

}
