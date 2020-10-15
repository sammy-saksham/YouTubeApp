//
//  DetailViewController.swift
//  YouTube
//
//  Created by Saksham Jain on 14/10/20.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var textView: UITextView!
    
    var video: Video?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //Clear the fields
        titleLabel.text = ""
        dateLabel.text = ""
        textView.text = ""
        
        //Check if there is a video
        guard video != nil else { return }
        
        //Embed URL
        let embedURL = Constants.YT_EMBED_URL + video!.videoId
        
        //Load it into WebView
        let url = URL(string: embedURL)
        let request = URLRequest(url: url!)
        webView.load(request)
        
        
        //Set Date, Title and Description
        titleLabel.text = video!.title
        
        let df = DateFormatter()
        df.dateFormat = "EEEE, MMM d, yyyy"
        dateLabel.text = df.string(from: video!.published)
        
        textView.text = video?.description
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
