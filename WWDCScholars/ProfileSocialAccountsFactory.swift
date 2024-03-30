//
//  ProfileSocialAccountsFactory.swift
//  WWDCScholars
//
//  Created by Andrew Walker on 06/05/2017.
//  Copyright © 2017 WWDCScholars. All rights reserved.
//

import Foundation
import UIKit

internal final class ProfileSocialAccountsFactory {
    
    // MARK: - Private Properties
    
    private let socialMedia: SocialMedia
    
    // MARK: - Lifecycle
    
    internal init(socialMedia: SocialMedia) {
        self.socialMedia = socialMedia
    }
    
    // MARK: - Internal Functions
    
    internal func accountButtons() -> [SocialAccountButton] {
        let buttons = [self.facebookButton(), self.twitterButton(), self.blueskyButton(), self.threadsButton(), self.mastodonButton(), self.linkedInButton(), self.websiteButton(), self.gitHubButton(), self.iMessageButton(), self.discordButton()]
        let visibleButtons = buttons.compactMap({ ($0 as? SocialAccountButton) })
        
        return visibleButtons
    }
    
    // MARK: - Private Functions
    
    private func blueskyButton() -> UIButton? {
        if let bluesky = self.socialMedia.bluesky, !bluesky.isEmpty {
            return self.accountButton(withType: .bluesky, url: bluesky)
        }
        
        return nil
    }
    
    private func threadsButton() -> UIButton? {
        if let threads = self.socialMedia.threads, !threads.isEmpty {
            return self.accountButton(withType: .threads, url: threads)
        }
        
        return nil
    }
    
    private func mastodonButton() -> UIButton? {
        if let mastodon = self.socialMedia.mastodon, !mastodon.isEmpty {
            return self.accountButton(withType: .mastodon, url: mastodon)
        }
        
        return nil
    }
    
    private func discordButton() -> UIButton? {
        if let discord = self.socialMedia.discord, !discord.isEmpty {
            return self.accountButton(withType: .discord, url: discord)
        }
        
        return nil
    }
    
    private func iMessageButton() -> UIButton? {
        if let iMessage = self.socialMedia.imessage, !iMessage.isEmpty {
            return self.accountButton(withType: .imessage, url: iMessage)
        }
        
        return nil
    }
    
    private func gitHubButton() -> UIButton? {
        if let gitHubURL = self.socialMedia.github, !gitHubURL.isEmpty {
            return self.accountButton(withType: .github, url: gitHubURL)
        }
        
        return nil
    }
    
    private func websiteButton() -> UIButton? {
        if let websiteURL = self.socialMedia.website, !websiteURL.isEmpty {
            return self.accountButton(withType: .website, url: websiteURL)
        }
        
        return nil
    }
    
    private func linkedInButton() -> UIButton? {
        if let linkedInURL = self.socialMedia.linkedin, !linkedInURL.isEmpty {
            return self.accountButton(withType: .linkedin, url: linkedInURL)
        }
        
        return nil
    }
    
    private func facebookButton() -> UIButton? {
        if let facebookURL = self.socialMedia.facebook, !facebookURL.isEmpty {
            return self.accountButton(withType: .facebook, url: facebookURL)
        }
        
        return nil
    }
    
    private func twitterButton() -> UIButton? {
        if let twitterURL = self.socialMedia.twitter, !twitterURL.isEmpty {
            return self.accountButton(withType: .twitter, url: twitterURL)
        }
        
        return nil
    }
    
    private func accountButton(withType type: SocialMediaType, url: String) -> SocialAccountButton {
        let button = SocialAccountButton()
        button.accountDetail = url
		button.type = type
        button.widthAnchor.constraint(equalToConstant: 30.0).isActive = true
        return button
    }
}
