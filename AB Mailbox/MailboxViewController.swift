//
//  MailboxViewController.swift
//  AB Mailbox
//
//  Created by Anthony Bojorquez on 6/3/16.
//  Copyright © 2016 Anthony Bojorquez. All rights reserved.
//

import UIKit

class MailboxViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var messageView: UIView!
    var messageDownOffset: CGFloat!
    var messageOriginalCenter: CGPoint!
    var messageLeft: CGPoint!
    var messageRight: CGPoint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        scrollView.delegate = self
        
        scrollView.contentSize = CGSize(width: 320, height: 1000)
        
        
        messageDownOffset = 140
        messageLeft = messageView.center
        messageRight = CGPoint(x: messageView.center.x ,y: messageView.center.y + messageDownOffset)
        
        
        
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    
    @IBAction func didPanMessage(sender: UIPanGestureRecognizer) {
        
        let translation = sender.translationInView(view)
        
        if sender.state == UIGestureRecognizerState.Began {
            print("message gesture began")
            messageOriginalCenter = messageView.center
            
        } else if sender.state == UIGestureRecognizerState.Changed {
            print("message gesture changed")
            
            messageView.center = CGPoint(x: messageOriginalCenter.x, y: messageOriginalCenter.y + translation.y)
            
        } else if sender.state == UIGestureRecognizerState.Ended {
            print("message gesture ended")
            var velocity = sender.velocityInView(view)
            
            if velocity.y > 0 {
                UIView.animateWithDuration(0.3, animations: {() -> Void in
                    self.messageView.center = self.messageLeft
                })
                
            }else  {
                UIView.animateWithDuration(0.3, animations: {() -> Void in
                    self.messageView.center = self.messageRight
                })
                
            }
        }
        
        
        
        
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        // This method is called as the user scrolls
    }
    
    func scrollViewWillBeginDragging(scrollView: UIScrollView) {
        
    }
    
    func scrollViewDidEndDragging(scrollView: UIScrollView,
        willDecelerate decelerate: Bool) {
            // This method is called right as the user lifts their finger
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        // This method is called when the scrollview finally stops scrolling.
    }
    
    
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}
