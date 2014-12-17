//
//  ViewController.swift
//  Tables
//
//  Created by stephen g on 12/10/14.
//  Copyright (c) 2014 stephen g. All rights reserved.
//

import UIKit

class SearchResultsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, APIControllerProtocol {
    
    // get a reference to the table view
    @IBOutlet weak var appTableView: UITableView!
    
    let kCellIdentifier: String = "SearchResultCell"
    var albums = [Album]()
    var api: APIController?
    var imageCache = [ String: UIImage]()
    
    /*
        Init
    */

    override func viewDidLoad() {
        super.viewDidLoad()
        api = APIController(delegate: self)
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
        api!.searchItunesFor("Pool")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
        Control
    */
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return albums.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCellWithIdentifier("SearchResultCell") as UITableViewCell
        let album: Album = self.albums[indexPath.row]
        let thumbnailImage: NSURL = NSURL(string: album.thumbnailImageUrl)!
        let imgData = NSData(contentsOfURL: thumbnailImage)
        let formattedPrice = album.price as String
        
        cell.imageView?.image = UIImage(data: imgData!)
        cell.textLabel?.text = album.title
        cell.detailTextLabel?.text = album.price
        
        return cell
    }
    
    /*
        Events
    */
    
    func didReceiveAPIResults(results: NSDictionary) {
        var resultsArr: NSArray = results["results"] as NSArray
        dispatch_async(dispatch_get_main_queue(), {
            self.albums = Album.albumsWithJson(resultsArr)
            self.appTableView!.reloadData()
            UIApplication.sharedApplication().networkActivityIndicatorVisible = false
        })
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        var album = self.albums[indexPath.row]
        var title: String = album.title
        var formattedPrice: String = album.price
        
        var alert: UIAlertView = UIAlertView()
        alert.title = title
        alert.message = formattedPrice
        alert.addButtonWithTitle("Ok")
        alert.show()
    }
}


