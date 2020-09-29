//
//  tweetCellTableViewCell.swift
//  Twitter
//
//  Created by Thuyvan on 9/21/20.
//  Copyright © 2020 Dan. All rights reserved.
//

import UIKit

class tweetCellTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var tweetContent: UILabel!
    
    @IBOutlet weak var retweetButton: UIButton!
    @IBOutlet weak var favButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    var favorited:Bool = false
    var tweetId: Int = -1
    
    @IBAction func favoriteTweet(_ sender: Any) {
        let toBeFavorite = !favorited
        if(toBeFavorite) {
            TwitterAPICaller.client?.favoriteTweet(tweetId: tweetId, success: {
                self.setFavorite(true)
            }, failure: {(error) in
                print("Favorite did not succeed: \(error)")
                
            })
        } else{
            TwitterAPICaller.client?.unfavoriteTweet(tweetId: tweetId, success: {
                self.setFavorite(false)
            }, failure: {(error) in
                print("Unfavorite did not succeed: \(error)")
                
            })
        }
    }
    
    @IBAction func retweetTweet(_ sender: Any) {
    }
    
    
    func setFavorite(_ isFavorited: Bool){
               favorited = isFavorited
               if(favorited){
                   favButton.setImage(UIImage(named:"favor-icon-red"), for: UIControl.State.normal)
               }
               else{
                   favButton.setImage(UIImage(named:"favor-icon-1"), for: UIControl.State.normal)
               }
           }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
