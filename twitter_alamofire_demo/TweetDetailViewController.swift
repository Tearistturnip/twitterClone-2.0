//
//  TweetDetailViewController.swift
//  twitter_alamofire_demo
//
//  Created by Justin Lee on 3/6/18.
//  Copyright © 2018 Charles Hieger. All rights reserved.
//

import UIKit

class TweetDetailViewController: UIViewController {
    
    @IBOutlet weak var profilePicView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var screenNameLabel: UILabel!
    @IBOutlet weak var tweetLabel: UILabel!
    @IBOutlet weak var dateCreatedLabel: UILabel!
    @IBOutlet weak var retweetsLabel: UILabel!
    @IBOutlet weak var favoritesLabel: UILabel!
    
    
    var tweet: Tweet?

    override func viewDidLoad() {
        super.viewDidLoad()
        if let tweet = tweet{
            let profileURL = URL(string: tweet.user.profileImagePath!)
            profilePicView.af_setImage(withURL: profileURL!)
            nameLabel.text = tweet.user.name
            screenNameLabel.text = tweet.user.screenName
            tweetLabel.text = tweet.text
            dateCreatedLabel.text = tweet.createdAtString
            retweetsLabel.text = String(tweet.retweetCount)
            favoritesLabel.text = String(describing: tweet.favoriteCount)
            
            
            
            
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
