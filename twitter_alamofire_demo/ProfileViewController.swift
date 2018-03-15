//
//  ProfileViewController.swift
//  twitter_alamofire_demo
//
//  Created by Justin Lee on 3/14/18.
//  Copyright © 2018 Charles Hieger. All rights reserved.
//

import UIKit
import AlamofireImage

class ProfileViewController: UIViewController {
    @IBOutlet weak var userPicImage: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var screenNameLabel: UILabel!
    
    @IBOutlet weak var followingLabel: UILabel!
    @IBOutlet weak var tweetsLabel: UILabel!
    
    @IBOutlet weak var followersLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        if let user = User.current {
            // get the things e.g. user.profileImage
            /*
            print(user.profileImagePath!)
            let please = URL(user.profileImagePath)
 */
            let profilePicURL = user.profileImagePath
            let path = URL(string: profilePicURL!)
            userPicImage.af_setImage(withURL: path!)
            nameLabel.text = user.name
            screenNameLabel.text = user.screenName
            followersLabel.text = String(user.followersCount!)
            followingLabel.text = String(user.followingCount!)
            tweetsLabel.text = String(user.tweetCount!)
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
