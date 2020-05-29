//
//  ViewController.swift
//  trialmountcounter
//
//  Created by Joy Leger on 2020-05-21.
//  Copyright © 2020 Joy Leger. All rights reserved.
//

import UIKit

struct cellData {
    var opened = Bool()
    var title = String()
    var sectionData=[String]()
}

class TableViewController: UITableViewController {

    var tableViewData=[cellData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableViewData = [
            cellData(opened:false, title:"String1", sectionData:["Cell1","Cell2", "Cell3"]),
            cellData(opened:false, title:"String1", sectionData:["Cell1","Cell2", "Cell3"]),
            cellData(opened:false, title:"String1", sectionData:["Cell1","Cell2", "Cell3"])]
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        //Dispose of any recreatable resources
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return tableViewData.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableViewData[section].opened == true{
            return tableViewData[section].sectionData.count + 1
        }else{
        return 1}
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row==0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else {return UITableViewCell()}
            cell.textLabel?.text=tableViewData[indexPath.section].title
            return cell
        }else{
            //use different cell identifier if needed
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else {return UITableViewCell()}
            cell.textLabel?.text=tableViewData[indexPath.section].sectionData[indexPath.row - 1];           return cell
            
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0{
            if tableViewData[indexPath.section].opened == true{
                tableViewData[indexPath.section].opened = false
                let sections = IndexSet.init(integer: indexPath.section)
                tableView.reloadSections(sections, with: .none)
            }else{
                tableViewData[indexPath.section].opened = true
                let sections = IndexSet.init(integer: indexPath.section)
                tableView.reloadSections(sections, with: .none)        }
        }
    }
}

