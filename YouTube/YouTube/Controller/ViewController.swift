//
//  ViewController.swift
//  YouTube
//
//  Created by Saksham Jain on 09/10/20.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, ModelDelegate {
    
    @IBOutlet weak var TableView: UITableView!
    
    var model = Model()
    var videos = [Video]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        TableView.dataSource = self
        TableView.delegate = self
        model.delegate = self
        
        model.getVideos()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard TableView.indexPathForSelectedRow != nil else { return }
        
        //Get a refference to the video
        let selectedVideo = videos[TableView.indexPathForSelectedRow!.row]
        
        //Get a reference to the detail view controller
        let detailVC = segue.destination as! DetailViewController
        
        //Set video property of detail view controller
        detailVC.video = selectedVideo
    }
    
    //MARK:- Model delegate methods
    
    func videosFetched(_ video: [Video]) {
        self.videos = video
        
        TableView.reloadData()
    }
    
    //MARK:- Table View Methods

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = TableView.dequeueReusableCell(withIdentifier: Constants.VIDEOCELL_ID, for: indexPath) as? VideosTableViewCell
        
        //Configure the Cell
        cell?.setCell(self.videos[indexPath.row])
        
        //Return the Cell
        return cell as! UITableViewCell
    }
    
}

