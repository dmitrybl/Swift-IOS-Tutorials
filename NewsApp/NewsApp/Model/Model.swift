//
//  Model.swift
//  NewsApp
//
//  Created by Dmitry Belyaev on 27/01/2019.
//  Copyright © 2019 Dmitry Belyaev. All rights reserved.
//

import Foundation

var articles: [Article] = []

var urlToData: URL {
    let path = NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, true)[0] + "/data.json"
    let urlPath = URL(fileURLWithPath: path)
    return urlPath
}

func loadNews(completionHandler: (() -> Void)?) {
    let url = URL(string: "https://newsapi.org/v2/everything?q=bitcoin&from=2018-12-27&sortBy=publishedAt&apiKey=8e6b26b5f777404ab851a02ccd13d8fe")
    let session = URLSession(configuration: .default)
    let downloadTask = session.downloadTask(with: url!) { (url, response, error) in
        if url != nil {
            try? FileManager.default.copyItem(at: url!, to: urlToData)
            parseNews()
            completionHandler?()
        }
    }
    
    downloadTask.resume()
}

func parseNews() {
    
    let data = try? Data(contentsOf: urlToData)
    if data == nil {
        return
    }

    let rootDictionaryAny = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments)
    if rootDictionaryAny == nil {
        return
    }
    let rootDictionary = rootDictionaryAny as? Dictionary<String, Any>
    if rootDictionary == nil {
        return
    }
    
    if let array = rootDictionary!["articles"] as? [Dictionary<String, Any>] {
        var returnArray: [Article] = []
        for dict in array {
            let newArticle = Article(dictionary: dict)
            returnArray.append(newArticle)
        }
        
        articles = returnArray
    }
    
  
}
