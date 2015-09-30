//
//  TableViewController.swift
//  Json
//
//  Created by bj gemert on 30/09/15.
//  Copyright © 2015 bj gemert. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    var newsItems = [NewsItem]();
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadJsonData()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var selectedRow = self.tableView.indexPathForSelectedRow
        var selectedNewsItem = self.newsItems[selectedRow!.row]
        var controller = segue.destinationViewController as! DetailsViewController
        controller.SelectedNewsItem = selectedNewsItem
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1;
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return newsItems.count;
    }
    
    func loadJsonData()
    {
        let url = NSURL(string: "https://nikosite.net/super_secret_xml_json.php");
        let request = NSURLRequest(URL: url!);
        let session = NSURLSession.sharedSession();
        let dataTask = session.dataTaskWithRequest(request){ (data, response, error) -> Void in
            do
            {
                if let jsonObject: AnyObject = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.AllowFragments)
                {
                    self.parseJsonData(jsonObject);
                }
            }
            catch
            {
                print("Error parson JSON data");
            }
        }
        dataTask.resume();
    }
    
    func parseJsonData(jsonObject:AnyObject)
    {
        //print(jsonObject);
        if let jsonData = jsonObject as? NSArray
        {
            for item in jsonData
            {
                let newItem = NewsItem(title: item.objectForKey("title") as! String, link: item.objectForKey("link") as! String, Category:item.objectForKey("category") as! String, pubDate: item.objectForKey("pubDate") as! String, guid: item.objectForKey("guid") as! String, description: item.objectForKey("description") as! String)
                newsItems.append(newItem);
            }
        }
        self.tableView.reloadData()
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        as UITableViewCell
        let currentRow = indexPath.row;
        let currentNewsItem = self.newsItems[currentRow];
        cell.textLabel?.text = currentNewsItem.title;
        return cell;
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
