//
//  DetailsViewController.swift
//  Json
//
//  Created by bj gemert on 30/09/15.
//  Copyright © 2015 bj gemert. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    
    @IBOutlet weak var LbTitle: UILabel!
    @IBOutlet weak var Category: UILabel!
    @IBOutlet weak var PubDate: UILabel!
    @IBOutlet weak var Description: UITextView!
    
    var SelectedNewsItem: NewsItem?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.LbTitle.text = self.SelectedNewsItem?.title
        self.Category.text = self.SelectedNewsItem?.Category
        self.PubDate.text = self.SelectedNewsItem?.pubDate
        self.Description.text = self.SelectedNewsItem?.description
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
