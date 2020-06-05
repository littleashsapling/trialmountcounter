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
    var backroundColor: UIColor?
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
                     title: MountTitle(allCellMounts: false,humanClick: false,mountTitleName:  "Kirin",mountQuest: "Mor Dhona (!) A Legend for a Legend", backroundColor: UIColor(red: 0.949, green: 0.8471, blue: 0.5216, alpha: 1.0)),
                     sectionData:[
                        MountCell(humanClick: false, mountCellName: "Nightmare", mountDungeon: "Bowl of Embers, Howling Eye, The Navel"),
                        MountCell(humanClick: false, mountCellName: "Aithon", mountDungeon: "Bowl of Embers"),
                        MountCell(humanClick: false, mountCellName: "Xanthos", mountDungeon: "Howling Eye"),
                        MountCell(humanClick: false, mountCellName: "Gullfaxi", mountDungeon: "The Navel"),
                        MountCell(humanClick: false, mountCellName: "Enbar", mountDungeon: "Whorleater"),
                        MountCell(humanClick: false, mountCellName: "Markab", mountDungeon: "Striking Tree"),
                        MountCell(humanClick: false, mountCellName: "Boreas", mountDungeon: "Akh Afah Amphitheater")]),
                CellData(opened:false,
                     title: MountTitle(allCellMounts: false,humanClick: false,mountTitleName:  "Firebird",mountQuest: "Idyllshire (!) Firey Wings, Firey Hearts", backroundColor: UIColor(red: 0.949, green: 0.8471, blue: 0.5216, alpha: 1.0)),                    sectionData:[
                       MountCell(humanClick: false, mountCellName: "White Lanner", mountDungeon: "Limitless Blue"),
                       MountCell(humanClick: false, mountCellName: "Rose Lanner", mountDungeon: "Thok Ast Thok"),
                       MountCell(humanClick: false, mountCellName: "Round Lanner", mountDungeon: "TMB: Thordan's Reign"),
                       MountCell(humanClick: false, mountCellName: "Warring Lanner", mountDungeon: "Containment Bay S177"),
                       MountCell(humanClick: false, mountCellName: "Dark Lanner", mountDungeon: "TMB: Nidhogg's Rage"),
                       MountCell(humanClick: false, mountCellName: "Sophic Lanner", mountDungeon: "Containment Bay P1T6"),
                       MountCell(humanClick: false, mountCellName: "Demonic Lanner", mountDungeon: "Containment Bay Z1T9")]),
                CellData(opened:false,
                    title: MountTitle(allCellMounts: false,humanClick: false,mountTitleName:  "Kamuy of the Nine Tails",mountQuest: "Kuganne (!) A Lone Wolf No More", backroundColor: UIColor(red: 0.949, green: 0.8471, blue: 0.5216, alpha: 1.0)),
                    sectionData:[
                       MountCell(humanClick: false, mountCellName: "Blissful Kamuy", mountDungeon: "Emanation"),
                       MountCell(humanClick: false, mountCellName: "Revelry Kamuy", mountDungeon: "Pool of Tribute"),
                       MountCell(humanClick: false, mountCellName: "Legendary Kamuy", mountDungeon: "TMB: Shinry's Dome"),
                       MountCell(humanClick: false, mountCellName: "Auspicsious Kamuy", mountDungeon: "Jade Sea"),
                       MountCell(humanClick: false, mountCellName: "Lunar Kamuy", mountDungeon: "THB: Tsukuyomi's Pain"),
                       MountCell(humanClick: false, mountCellName: "Euphonious Kamuy", mountDungeon: "Hell's Keir"),
                       MountCell(humanClick: false, mountCellName: "Hallowed Kamuy", mountDungeon: "Weath of snakes")])]
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
            cell.shakeclose = {
                    self.tableViewData[indexPath.section].opened = !self.tableViewData[indexPath.section].opened
                let sections = IndexSet.init(integer: indexPath.section)
                    tableView.reloadSections(sections, with: .none)
            }
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
            tableViewData[indexPath.section].opened = !tableViewData[indexPath.section].opened
            let sections = IndexSet.init(integer: indexPath.section)
            tableView.reloadSections(sections, with: .none)
        }
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        //TODO: collapse table sections when shaking.
    }
    
}

    
// cell classes for filtering data
class MountTitleTableCell : UITableViewCell {
    @IBOutlet weak var mountTitleLbl: UILabel!
    @IBOutlet weak var questLbl: UILabel!
    @IBOutlet weak var mountTitleButton: UIButton!
    var cell:CellData?
    var action = {}
    var shakeclose = {}
    
    func configure(cell: CellData){
        self.cell = cell
        mountTitleLbl.text = cell.title.mountTitleName
        questLbl.text = cell.title.mountQuest
        self.backgroundColor = cell.title.backroundColor
        var allDone = true
        cell.sectionData.forEach { mount in
            if !mount.humanClick{
                allDone = false
            }
        }
        if allDone{
            mountTitleButton.setImage(UIImage(named: "alert"), for: .normal)
            if cell.title.humanClick{
                mountTitleButton.setImage(UIImage(named: "checkmark"), for: .normal)
            }
            
        }else{
            mountTitleButton.setImage(UIImage(named:"notchecked"), for: .normal)
        }
    
    }
    
    @IBAction func mountTitleClick(_ sender: Any) {
        action()
    }
    
    //shaken open close
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        print("shake it baby!")
        shakeclose()
    }    /*check if all moutncells are true = alert
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

