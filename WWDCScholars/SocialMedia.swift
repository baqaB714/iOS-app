//
//  SocialMedia.swift
//  WWDCScholars
//
//  Created by Matthijs Logemann on 03/06/2017.
//  Copyright © 2017 WWDCScholars. All rights reserved.
//

import Foundation
import CloudKit

enum SocialMediaType: String{
    case bluesky
    case threads
    case mastodon
    case discord
	case imessage
	case itunes
	case website
	case linkedin
	case github
	case facebook
	case twitter
}

internal class SocialMedia {
    
    // MARK: - Internal Functions
    internal var bluesky : String?
    internal var threads : String?
    internal var mastodon : String?
    internal var discord : String?
    internal var imessage : String?
    internal var itunes : String?
    internal var website : String?
    internal var linkedin : String?
    internal var github : String?
    internal var facebook : String?
    internal var twitter : String?
    
    internal required init(record: CKRecord) {
        bluesky = record["bluesky"] as! String?
        threads = record["threads"] as! String?
        mastodon = record["mastodon"] as! String?
        discord = record["discord"] as! String?
        imessage = record["imessage"] as! String?
        itunes = record["itunes"] as! String?
        website = record["website"] as! String?
        linkedin = record["linkedin"] as! String?
        github = record["github"] as! String?
        facebook = record["facebook"] as! String?
        twitter = record["twitter"] as! String?
    }
}
