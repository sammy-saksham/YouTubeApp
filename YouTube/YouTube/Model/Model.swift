//
//  Model.swift
//  YouTube
//
//  Created by Saksham Jain on 09/10/20.
//

import Foundation

protocol ModelDelegate {
    func videosFetched(_ videos: [Video])
}

class Model {
    
    var delegate: ModelDelegate?
    
    func getVideos() {
        
        //Create A URL Object
        let url = URL(string: Constants.API_URL)
        
        guard url != nil else {
            return
        }
        
        //Get a URL Session Object
        let session = URLSession.shared
        
        //Get a Data Task from the URL Session object
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            
            //Check if there were any errors
            if error != nil || data == nil {
                return
            }
            
            do{
                //Parse Data into Video Object
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                
                let response = try decoder.decode(Response.self, from: data!)
                
                if response.items != nil {
                    DispatchQueue.main.async {
                        self.delegate?.videosFetched(response.items!)
                    }
                }
            } catch {
                
            }
        
        }
        
        //Kick Off The Task
        dataTask.resume()
    }
    
}
