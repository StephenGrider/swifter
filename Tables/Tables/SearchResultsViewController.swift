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
    var tableData = []
    var api = APIController()
    var imageCache = [ String: UIImage]()
    
    /*
        Init
    */

    override func viewDidLoad() {
        super.viewDidLoad()
        api.delegate = self
        api.searchItunesFor("Pool")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
        Control
    */
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCellWithIdentifier("SearchResultCell") as UITableViewCell
        let rowData: NSDictionary = self.tableData[indexPath.row] as NSDictionary
        let urlString: String = rowData["artworkUrl60"] as String
        let imgUrl: NSURL = NSURL(string: urlString)!
        let imgData = NSData(contentsOfURL: imgUrl)
        let formattedPrice = rowData["formattedPrice"] as String
        
        cell.imageView.image = UIImage(data: imgData!)
        cell.textLabel.text = rowData["trackName"] as? String
        cell.detailTextLabel?.text = formattedPrice
        
        return cell
    }
    
    /*
        Events
    */
    
    func didReceiveAPIResults(results: NSDictionary) {
        var resultsArr: NSArray = results["results"] as NSArray
        dispatch_async(dispatch_get_main_queue(), {
            self.tableData = resultsArr
            self.appTableView!.reloadData()
        })
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        var rowData: NSDictionary = self.tableData[indexPath.row] as NSDictionary
        var name: String = rowData["trackName"] as String
        var formattedPrice: String = rowData["formattedPrice"] as String
        
        var alert: UIAlertView = UIAlertView()
        alert.title = name
        alert.message = formattedPrice
        alert.addButtonWithTitle("Ok")
        alert.show()
    }
}


