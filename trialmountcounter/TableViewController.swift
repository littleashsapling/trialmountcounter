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




class TableViewController: UITableViewController {

    var tableViewData=[CellData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableViewData = [
            CellData(opened:false,
                     title: MountTitle(allCellMounts: false,humanClick: false,mountTitleName:  "Horse",mountQuest: "more donught"),
                     sectionData:[MountCell(humanClick: false, mountCellName: "dark horse", mountDungeon: "any")]
            )
        ]
        
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
            let cell = tableView.dequeueReusableCell(withIdentifier: "titleMount") as! MountTitleTableCell
            cell.configure(cell: tableViewData[indexPath.section])
            /*cell.textLabel?.text=tableViewData[indexPath.section].title.mountTitleName*/
            return cell
        }else{
            //use different cell identifier if needed
            let cell = tableView.dequeueReusableCell(withIdentifier: "minorMount") as! MountCellTableCell
            cell.configure(cell: tableViewData[indexPath.section].sectionData[indexPath.row])
            return cell
            
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

class MountTitleTableCell : UITableViewCell {
    @IBOutlet weak var mountTitleLbl: UILabel!
    
    @IBOutlet weak var questLbl: UILabel!
    @IBOutlet weak var mntBtn: UIButton!
    @IBOutlet weak var mountTitleButton: UIButton!
    
    
    func configure(cell: CellData){
        mountTitleLbl.text = cell.title.mountTitleName
       
    }
}

class MountCellTableCell : UITableViewCell {
    @IBOutlet weak var mountCellLabel: UILabel!
    @IBOutlet weak var mountCellLbl: UILabel!
    @IBOutlet weak var trialLbl: UILabel!
    @IBOutlet weak var mountCellBtn: UIButton!
    
    
    func configure(cell: MountCell){
        mountCellLbl.text = cell.mountCellName
    }
 }
}
