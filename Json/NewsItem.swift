//
//  NewsItem.swift
//  Json
//
//  Created by bj gemert on 30/09/15.
//  Copyright © 2015 bj gemert. All rights reserved.
//

import Foundation
class NewsItem{
    var title:String?;
    var link:String?;
    var Category:String?;
    var pubDate:String?;
    var guid:String?;
    var description:String?;
    
    init(title: String!, link: String!, Category: String!, pubDate: String!, guid: String!, description: String!)
    {
        self.title = title;
        self.link = link;
        self.Category = Category;
        self.pubDate = pubDate;
        self.guid = guid;
        self.description = description;
    }
}