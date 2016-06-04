//
//  MailBoxViewController.swift
//  Week3Assignment
//
//  Created by Padmaja Ragavendra on 5/31/16.
//  Copyright © 2016 Padmaja Ragavendra. All rights reserved.
//

import UIKit

class MailBoxViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var MessageView: UIView!
    @IBOutlet weak var rescheduleImage: UIImageView!
    @IBOutlet weak var rescheduleView: UIView!
    
    var messageOriginalCenter: CGPoint!
    var messageleftnOffset: CGFloat!
    var messageLeft: CGPoint!
    var messageRight: CGPoint!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        scrollView.contentSize = CGSize(width: 320, height: 1000)
        messageleftnOffset = 0
        messageLeft = MessageView.center
        messageRight = CGPoint(x: MessageView.center.x + messageleftnOffset,y: MessageView.center.y )
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.

    }
    

    @IBAction func onPanMessage(sender: UIPanGestureRecognizer) {
        var translation = sender.translationInView(view)
        print("translation \(translation)")
        if sender.state == UIGestureRecognizerState.Began {
            messageOriginalCenter = MessageView.center
            
        } else if sender.state == UIGestureRecognizerState.Changed {
            MessageView.center = CGPoint(x: messageOriginalCenter.x + translation.x, y: messageOriginalCenter.y )
            //print("MessageView.center \(MessageView.center)")
//if  (MessageView.center.x > 50) {
                
                rescheduleView.alpha =  1
                
                
                
//}
            
        } else if sender.state == UIGestureRecognizerState.Ended {
            var velocity = sender.velocityInView(view)
            if velocity.x > 0 {
                UIView.animateWithDuration(0.3, animations: { () -> Void in
                    self.MessageView.center = self.messageLeft
                })
            } else {
                UIView.animateWithDuration(0.3, animations: { () -> Void in
                    self.MessageView.center = self.messageRight
                })
            }
            
        }
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
