//
//  ViewController.swift
//  PullToRefreshBug
//
//  Created by Edward Hung on 30/09/2016.
//  Copyright © 2016 Edward Hung. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var myTableView: UITableView!
    
    var refreshControl: UIRefreshControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myTableView.delegate = self
        myTableView.dataSource = self
        
        navigationController!.hidesBarsOnSwipe = true
        
        refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(ViewController.refresh), forControlEvents: .ValueChanged)
        myTableView.addSubview(refreshControl)
    }
    
    func refresh() {
        
    }
    
    @IBAction func stopRefreshingBtnPressed(sender: AnyObject) {
        refreshControl.endRefreshing()
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 10
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("myCell", forIndexPath: indexPath)
        cell.textLabel?.text = "section \(indexPath.section) row \(indexPath.row)"
        return cell
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Section Header \(section)"
    }
}

