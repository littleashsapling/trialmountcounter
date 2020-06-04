//
//  ViewController.swift
//  trialmountcounter
//
//  Created by Joy Leger on 2020-05-21.
//  Copyright © 2020 Joy Leger. All rights reserved.
//

import UIKit
/*stuct for title cell
 stuct for cell cell
 struct for cell data for collapse
 title string = title struct
 and
 section data string array= section data cell cell array*/
struct MountTitle {
    var allCellMounts = false
    var humanClick = false
    var mountTitleName = ""
    var mountQuest = ""
}

struct MountCell {
    var humanClick = false
    var mountCellName = ""
    var mountDungeon = ""
}
struct CellData {
    var opened = false
    var title: MountTitle
    var sectionData: [ MountCell ]
}



//cell structure
class TableViewController: UITableViewController {

    var tableViewData=[CellData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
            tableView.delegate = self
            tableView.dataSource = self
        
        // Do any additional setup after loading the view.
        
        tableViewData = [
            CellData(opened:false,
                     title: MountTitle(allCellMounts: false,humanClick: false,mountTitleName:  "Horse",mountQuest: "more donught"),
                     sectionData:[
                        MountCell(humanClick: false, mountCellName: "dark horse", mountDungeon: "any"),
                        MountCell(humanClick: false, mountCellName: "dark horse", mountDungeon: "any")                ]
            )
        ]
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        //Dispose of any recreatable resources
    }
    //make the cells
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
            let cell = tableView.dequeueReusableCell(withIdentifier: "titleMount") as! MountTitleTableCell
            cell.configure(cell: tableViewData[indexPath.section])
            cell.action = {
                self.tableViewData[indexPath.section].title.allCellMounts = !self.tableViewData[indexPath.section].title.allCellMounts
                self.tableViewData[indexPath.section].title.humanClick = !self.tableViewData[indexPath.section].title.humanClick
                tableView.reloadData()
            }
            /*cell.textLabel?.text=tableViewData[indexPath.section].title.mountTitleName*/
            return cell
        }else{
            //use different cell identifier if needed
            let cell = tableView.dequeueReusableCell(withIdentifier: "minorMount") as! MountCellTableCell
            cell.configure(tableView:tableView, cell: tableViewData[indexPath.section].sectionData[indexPath.row - 1])
            cell.action = {
                self.tableViewData[indexPath.section].sectionData[indexPath.row - 1].humanClick = !self.tableViewData[indexPath.section].sectionData[indexPath.row - 1].humanClick
                tableView.reloadData()
            }
            return cell
        }
         
    }
    
    //title cell open
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0{
            if tableViewData[indexPath.section].opened == true{
                tableViewData[indexPath.section].opened = false
                let sections = IndexSet.init(integer: indexPath.section)
                tableView.reloadSections(sections, with: .none)
            }else{
                tableViewData[indexPath.section].opened = true
                let sections = IndexSet.init(integer: indexPath.section)
                tableView.reloadSections(sections, with: .none)
                
            }
        }
    }
    
}

// cell classes for filtering data
class MountTitleTableCell : UITableViewCell {
    @IBOutlet weak var mountTitleLbl: UILabel!
    @IBOutlet weak var questLbl: UILabel!
    @IBOutlet weak var mountTitleButton: UIButton!
    var cell:CellData?
    var action = {}
    
    
    func configure(cell: CellData){
        self.cell = cell
        mountTitleLbl.text = cell.title.mountTitleName
        questLbl.text = cell.title.mountQuest
        var allDone = true
        cell.sectionData.forEach { mount in
            if !mount.humanClick{
                allDone = false
                mountTitleButton.setImage(UIImage(named: "notchecked"), for: .normal)
            }
        }
        if allDone{
            mountTitleButton.setImage(UIImage(named: "checkmark"), for: .normal)
        }else{
            mountTitleButton.setImage(UIImage(named:"notchecked"), for: .normal)
        }
    }
    
    @IBAction func mountTitleClick(_ sender: Any) {
        action()
    }
    /*check if all moutncells are true = alert
     if all*/
    
}



class MountCellTableCell : UITableViewCell {
    @IBOutlet weak var mountCellLbl: UILabel!
    @IBOutlet weak var trialLbl: UILabel!
    @IBOutlet weak var mountCellBtn: UIButton!
    var cell:MountCell?
    var action = {}
    
    func configure(tableView:UITableView, cell: MountCell){
        self.cell = cell
        mountCellLbl.text = cell.mountCellName
        trialLbl.text = cell.mountDungeon
        if cell.humanClick{
            mountCellBtn.setImage(UIImage(named: "checkmark"), for: .normal)
        }else{
            mountCellBtn.setImage(UIImage(named: "notchecked"), for: .normal)
        }
    }
    
    @IBAction func cellButtonClick(_ sender: Any){
        action()
    }
 }

