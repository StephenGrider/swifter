//
//  ViewController.swift
//  Tables
//
//  Created by stephen g on 12/10/14.
//  Copyright (c) 2014 stephen g. All rights reserved.
//

import UIKit

class SearchResultsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // get a reference to the table view
    @IBOutlet weak var appTableView: UITableView!
    
    var tableData = []
    
    /*
        Init
    */

    override func viewDidLoad() {
        super.viewDidLoad()

        searchItunesFor("productivity")
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
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "tableCell")
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
    
    func searchItunesFor(searchTerm: String) {
        let itunesSearchTerm = searchTerm.stringByReplacingOccurrencesOfString(" ", withString: "+", options: NSStringCompareOptions.CaseInsensitiveSearch, range: nil)
        
        if let escapedSearchTerm = itunesSearchTerm.stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding) {
            let urlPath = "http://itunes.apple.com/search?term=\(escapedSearchTerm)&media=software"
            let url = NSURL(string: urlPath)
            let session = NSURLSession.sharedSession()
            let task = session.dataTaskWithURL(url!, completionHandler: {data, response, error -> Void in
                if(error != nil) { println(error.localizedDescription)}
                var err: NSError?
                
                var jsonResult = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: &err) as NSDictionary
                if(err != nil) { println("JSON Error \(err!.localizedDescription)") }
                
                let results: NSArray = jsonResult["results"] as NSArray
                dispatch_async(dispatch_get_main_queue(), {
                    self.tableData = results
                    self.appTableView!.reloadData()
                })
            })
            
            task.resume()
        }
    }
}


