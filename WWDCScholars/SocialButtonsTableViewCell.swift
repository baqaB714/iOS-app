//
//  SocialButtonsTableViewCell.swift
//  WWDCScholars
//
//  Created by Andrew Walker on 24/05/2016.
//  Copyright © 2016 WWDCScholars. All rights reserved.
//

import UIKit

protocol SocialButtonDelegate {
    func openURL(url: String)
    func composeEmail(address: String)
}

class SocialButtonsTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var iconsView: UIView!
    @IBOutlet weak var twitterImageView: UIButton!
    @IBOutlet weak var linkedInImageView: UIButton!
    @IBOutlet weak var emailImageView: UIButton!
    @IBOutlet weak var facebookImageView: UIButton!
    @IBOutlet weak var githubImageView: UIButton!
    @IBOutlet weak var websiteImageView: UIButton!
    @IBOutlet weak var appStoreImageView: UIButton!
    
    var delegate: SocialButtonDelegate?
    var scholar: Scholar!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.linkedInImageView.addTarget(self, action: #selector(SocialButtonsTableViewCell.linkedInTapped), forControlEvents: .TouchUpInside)
        self.facebookImageView.addTarget(self, action: #selector(SocialButtonsTableViewCell.facebookTapped), forControlEvents: .TouchUpInside)
        self.twitterImageView.addTarget(self, action: #selector(SocialButtonsTableViewCell.twitterTapped), forControlEvents: .TouchUpInside)
        self.githubImageView.addTarget(self, action: #selector(SocialButtonsTableViewCell.gitHubTapped), forControlEvents: .TouchUpInside)
        self.websiteImageView.addTarget(self, action: #selector(SocialButtonsTableViewCell.websiteTapped), forControlEvents: .TouchUpInside)
        self.emailImageView.addTarget(self, action: #selector(SocialButtonsTableViewCell.emailTapped), forControlEvents: .TouchUpInside)
        self.appStoreImageView.addTarget(self, action: #selector(SocialButtonsTableViewCell.appStoreTapped), forControlEvents: .TouchUpInside)
    }
    
    // MARK: - Internal functions
    
    internal func linkedInTapped() {
        self.delegate?.openURL(self.scholar.linkedInURL!)
    }
    
    internal func gitHubTapped() {
        self.delegate?.openURL(self.scholar.githubURL!)
    }
    
    internal func facebookTapped() {
        
        let facebookProfileID = self.scholar.facebookURL!.componentsSeparatedByString("/").last
        if facebookProfileID != nil {
            
            let deeplink = NSURL(string: "fb://profile/\(facebookProfileID!)".stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())!)
            
            if UIApplication.sharedApplication().canOpenURL(deeplink!) {
                UIApplication.sharedApplication().openURL(deeplink!)
            } else {
               self.delegate?.openURL(self.scholar.facebookURL!)
            }
            
        } else {
            self.delegate?.openURL(self.scholar.facebookURL!)
        }
        
    }
    
    internal func websiteTapped() {
        self.delegate?.openURL(self.scholar.websiteURL!)
    }
    
    internal func emailTapped() {
        self.delegate?.composeEmail(self.scholar.email)
    }
    
    internal func appStoreTapped() {
        
        if UIApplication.sharedApplication().canOpenURL(NSURL(string: self.scholar.iTunesURL!)!) {
            UIApplication.sharedApplication().openURL(NSURL(string: self.scholar.iTunesURL!)!)
        }
        
    }
    
    internal func twitterTapped() {
        
        let twitterProfileID = self.scholar.twitterURL!.componentsSeparatedByString("/").last
        if twitterProfileID != nil {
            
            let deeplink = NSURL(string: "twitter://user?screen_name=\(twitterProfileID!)".stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())!)
            
            if UIApplication.sharedApplication().canOpenURL(deeplink!) {
                UIApplication.sharedApplication().openURL(deeplink!)
            } else {
                self.delegate?.openURL(self.scholar.twitterURL!)
            }
            
        } else {
            self.delegate?.openURL(self.scholar.twitterURL!)
        }
        
    }
    
    // MARK: - Public functions
    
    func setIconVisibility() {
        self.linkedInImageView.hidden = self.scholar.linkedInURL == nil
        self.facebookImageView.hidden = self.scholar.facebookURL == nil
        self.githubImageView.hidden = self.scholar.githubURL == nil
        self.websiteImageView.hidden = self.scholar.websiteURL == nil
        self.appStoreImageView.hidden = self.scholar.iTunesURL == nil
        
        self.twitterImageView.hidden = true //Missing implementation
        self.emailImageView.hidden = false //Never hidden
    }
}
