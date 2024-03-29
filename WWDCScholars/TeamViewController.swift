//
//  TeamViewController.swift
//  WWDCScholars
//
//  Created by Andrew Walker on 14/04/2017.
//  Copyright © 2017 WWDCScholars. All rights reserved.
//

import Foundation
import UIKit
import MapKit
import Agrume

final class TeamViewController: UIViewController {
    
    // MARK: - Private Properties
    
    @IBOutlet private weak var scrollView: UIScrollView?
    @IBOutlet private weak var wwdcscholarsLogoImageView: UIImageView?
    @IBOutlet private weak var wwdcscholarsLogoContainerView: UIView?
    
    // MARK: Sam
    @IBOutlet private weak var samImageContentView: UIView?
    @IBOutlet private weak var samImageView: UIImageView?
    @IBOutlet private weak var samNameLabel: UILabel?
    @IBOutlet private weak var samDescriptionLabel: UILabel?
    
    // MARK: Moritz
    @IBOutlet private weak var moritzImageContentView: UIView?
    @IBOutlet private weak var moritzImageView: UIImageView?
    @IBOutlet private weak var moritzNameLabel: UILabel?
    @IBOutlet private weak var moritzDescriptionLabel: UILabel?
    
    // MARK: Michie
    @IBOutlet private weak var michieImageContentView: UIView?
    @IBOutlet private weak var michieImageView: UIImageView?
    @IBOutlet private weak var michieNameLabel: UILabel?
    @IBOutlet private weak var michieDescriptionLabel: UILabel?
    
    
    // MARK: - File Private Properties
    @IBOutlet fileprivate weak var wwdcscholarsTeamBannerImageView: UIImageView!
    
    private var wwdcscholarsTeamBannerImageViewHeight: CGFloat = 0.0
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView?.contentSize.width = view.frame.size.width
        scrollView?.showsHorizontalScrollIndicator = false
        
        styleUI()
        configureUI()
        populateContent()
        
        let barBtn = UIBarButtonItem.init(title: "Intro", style: .plain, target: self, action: #selector(showIntroTapped))
        navigationItem.rightBarButtonItem = barBtn

        let teamImageTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(teamImageTapped))
        wwdcscholarsTeamBannerImageView.addGestureRecognizer(teamImageTapGestureRecognizer)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        wwdcscholarsTeamBannerImageViewHeight = wwdcscholarsTeamBannerImageView?.frame.height ?? 0.0

    }
    
    // MARK: - UI
    
    private func styleUI() {
        self.navigationController?.navigationBar.backgroundColor = .scholarsPurple
        
        wwdcscholarsLogoContainerView?.roundCorners()
        wwdcscholarsLogoImageView?.roundCorners()

        samImageContentView?.roundCorners()
        samImageView?.roundCorners()

        moritzImageContentView?.roundCorners()
        moritzImageView?.roundCorners()

        michieImageContentView?.roundCorners()
        michieImageView?.roundCorners()
    }
    
    private func configureUI() {
        title = "Team"
    }
    
    // MARK: - Private Functions
    @objc
    private func teamImageTapped() {
        let agrume = Agrume(image: UIImage(named: "wwdcscholarsTeamBanner")!)
        agrume.show(from: self)
    }

    @objc
    private func showIntroTapped() {
        let storyboard = UIStoryboard(name: "Intro", bundle: nil)
        let intro = storyboard.instantiateInitialViewController()!
        intro.modalPresentationStyle = .fullScreen
        present(intro, animated: true, completion: nil)
    }
    
    private func populateContent() {
        samImageView?.image = UIImage(named: "samProfile")
        samNameLabel?.text = "Sam Eckert"
        samDescriptionLabel?.text = "Sam started developing iOS apps when he turned 14. He received two WWDC scholarships (2015 & 2017) and is now creating a futuristic marketing design suite at Linearity."
        
        moritzImageView?.image = UIImage(named: "moritzProfile")
        moritzNameLabel?.text = "Moritz Sternemann"
        moritzDescriptionLabel?.text = "Moritz is the most recent addition to our team and mostly worked on the website and the signup form. He attended WWDC as a scholarship winner for two consecutive years."
        
        michieImageView?.image = UIImage(named: "michieProfile")
        michieNameLabel?.text = "Michie Ang"
        michieDescriptionLabel?.text = "Michie was a nurse when she first got into iOS development. She won a scholarship three times, builds tech communities and travels around to inspire others to learn programming."
    }
}
