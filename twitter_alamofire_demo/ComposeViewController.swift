//
//  ComposeViewController.swift
//  twitter_alamofire_demo
//
//  Created by Justin Lee on 3/11/18.
//  Copyright © 2018 Charles Hieger. All rights reserved.
//

import UIKit
import AlamofireImage
import RSKPlaceholderTextView


protocol ComposeViewControllerDelegate{
    func did(post: Tweet)
}

class ComposeViewController: UIViewController, UITextViewDelegate {
    
    
    var delegate: ComposeViewControllerDelegate?

    @IBOutlet weak var userPicImage: UIImageView!
    
    @IBOutlet weak var tweetText: UITextView!
    
    
    @IBOutlet weak var characterCountLabel: UILabel!

    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //userPicImage.af
        /*
        self.tweetText = RSKPlaceholderTextView(frame: CGRect(x: 0, y: 20, width: self.view.frame.width, height: 100))
        self.tweetText.placeholder = "yes"
        view.addSubview(self.tweetText)
         */
        tweetText.delegate = self
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didTapPost(_ sender: Any) {
        APIManager.shared.composeTweet(with: tweetText.text) { (tweet, error) in
            if let error = error {
                print("Error composing Tweet: \(error.localizedDescription)")
            } else if let tweet = tweet {
                self.delegate?.did(post: tweet)
                print("Compose Tweet Success!")
            }
        }
        
    }
    
    @IBAction func cancelButton(_ sender: Any) {
         dismiss(animated: true, completion: nil)
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        // TODO: Check the proposed new text character count
        // Allow or disallow the new text
        let characterLimit = 140
        
        // Construct what the new text would be if we allowed the user's latest edit
        let newText = NSString(string: textView.text!).replacingCharacters(in: range, with: text)
        
        // TODO: Update Character Count Label
        characterCountLabel.text = String(newText.count)
        
        // The new text should be allowed? True/False
       
        return newText.count < characterLimit
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
