//
//  ViewController.swift
//  InClassRichMedia
//
//  Created by zweakland on 4/15/21.
//

import LinkPresentation
import UIKit


class ViewController: UIViewController {
    
    // view to position our link view
    @IBOutlet weak var linkContrainer: UIView!
    // create a url
    let url = URL(string: "https://www.youtube.com/")!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // call our method
        showMedia()
    }
    
    func showMedia() {
        // view for our url
        let urlView = LPLinkView()
        // provider to retrieve metadata from our url (title, image, desc)
        let provider = LPMetadataProvider()
        
        provider.startFetchingMetadata(for: url) {metadata, error in
            if error != nil {
                return
            }
            
            DispatchQueue.main.async {
                // set our metadata for our link view
                urlView.metadata = metadata!
                // display it to our screen
                self.view.addSubview(urlView)
                // use the view we already have in storyboard
                // to set the frame/dimension of our link view
                urlView.frame = self.linkContrainer.frame
            }
            
        }
    }

    
    
    
    

}

