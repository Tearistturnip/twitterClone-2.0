//
//  TweetCell.swift
//  twitter_alamofire_demo
//
//  Created by Charles Hieger on 6/18/17.
//  Copyright © 2017 Charles Hieger. All rights reserved.
//

import UIKit
import AlamofireImage





class TweetCell: UITableViewCell {
    
    @IBOutlet weak var tweetTextLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var timeStampLabel: UILabel!
    @IBOutlet weak var profilePicImageView: UIImageView!
    
    @IBOutlet weak var retweetButton: UIButton!
    
    @IBOutlet weak var favoriteButton: UIButton!
    
    
    var tweet: Tweet! {
        didSet {
            tweetTextLabel.text = tweet.text
            nameLabel.text = tweet.user.name
            usernameLabel.text = tweet.user.screenName
            timeStampLabel.text = tweet.createdAtString
            let posterURL = tweet.user.profileImagePath
            
            if(posterURL != nil){
                let profilePicPath = URL(string: posterURL!)
                profilePicImageView.af_setImage(withURL: profilePicPath!)
            }
            else{
                print("is nil")
                let defaultPicPath = URL(string: tweet.user.defaultPicPath)
                profilePicImageView.af_setImage(withURL: defaultPicPath!)
                
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    /*
    func refreshData(){
        
    }
 */
    
    @IBAction func retweetSelected(_ sender: Any) {
        if(!retweetButton.isSelected){
            retweetButton.isSelected = true
            APIManager.shared.retweet(tweet) { (tweet: Tweet?, error: Error?) in
                if let  error = error {
                    print("Error favoriting tweet: \(error.localizedDescription)")
                } else if let tweet = tweet {
                    print("Successfully favorited the following Tweet: \n\(tweet.text)")
                }
            }
            retweetButton.setImage(#imageLiteral(resourceName: "retweet-icon-green"), for: UIControlState.normal)
        }
        else{
            retweetButton.isSelected = false
            retweetButton.setImage(#imageLiteral(resourceName: "retweet-icon"), for: UIControlState.normal)
            
        }
        
    }
    
    @IBAction func favoriteSelected(_ sender: Any) {
        if(!favoriteButton.isSelected){
            favoriteButton.isSelected = true
            tweet.favorited = true
            tweet.favoriteCount = tweet.favoriteCount! + 1
            APIManager.shared.favorite(tweet) { (tweet: Tweet?, error: Error?) in
                if let  error = error {
                    print("Error favoriting tweet: \(error.localizedDescription)")
                } else if let tweet = tweet {
                    print("Successfully favorited the following Tweet: \n\(tweet.text)")
                }
            }
            favoriteButton.setImage(#imageLiteral(resourceName: "favor-icon-red"), for: UIControlState.normal)
        }
        else{
            favoriteButton.isSelected = false
            favoriteButton.setImage(#imageLiteral(resourceName: "favor-icon"), for: UIControlState.normal)
            
        }
    }
    
    
}
