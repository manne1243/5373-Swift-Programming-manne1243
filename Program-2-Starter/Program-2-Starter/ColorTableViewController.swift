//
//  ColorTableViewController.swift
//  Program-2-Starter
//
//  Created by Terry Griffin on 3/23/15.
//  Copyright (c) 2015 mwsu. All rights reserved.
//

import UIKit

protocol ColorTableViewControllerDelegate: class {
    func ColorTableViewChooseColorCancel(controller:ColorTableViewController)
    func ColorTableViewChooseColor(controller: ColorTableViewController, chosenColor color: String)
}


class ColorTableViewController: UITableViewController {
    
    var myColors:Colors = Colors()
    var currentColor:String = ""
    var prevColor:String = ""
    
    weak var delegate: ColorTableViewControllerDelegate?
    
    @IBOutlet weak var doneMenuButton: UIBarButtonItem!
    @IBOutlet weak var cancelMenuButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Register custom cell
        var nib = UINib(nibName: "vwTblCell", bundle: nil)
        tableView.registerNib(nib, forCellReuseIdentifier: "cell")
        
        myColors.resetCurrent()
        doneMenuButton.enabled = false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table View Methods
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        println("Again:")
        println(myColors.fetchColorCount())
        return myColors.fetchColorCount()
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let CellId:String = "Cell"
        var cell : TblCell = tableView.dequeueReusableCellWithIdentifier("cell") as! TblCell
        var color = myColors.fetchNextColor()
        
        let name = color.colorName
        
        println(name)
        cell.colorName.text = name
        let ColorValue: UIColor = myColors.hexStringToUIColor(myColors.fetchHexValue(name))
        cell.imageName.image = UIImage(named: "")
        cell.imageName.backgroundColor = ColorValue
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let cell = self.tableView.cellForRowAtIndexPath(indexPath) as! TblCell
        let text = cell.colorName.text
        if let text = text {
            println("did select and the text is \(text)")
            currentColor = text
            if(currentColor == prevColor){
                delegate?.ColorTableViewChooseColor(self,chosenColor:currentColor)
            }
            prevColor = text
            doneMenuButton.enabled = true
        }
        println(currentColor)
    }
    
    // MARK: - Button Action Methods
    
    
    @IBAction func doneMenuButton(sender: AnyObject) {
        println("pushed done and color is: \(currentColor)")
        delegate?.ColorTableViewChooseColor(self,chosenColor:currentColor)
        //dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func cancelMenuButton(sender: AnyObject) {
        println("cancelled")
        delegate?.ColorTableViewChooseColorCancel(self)
        //dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    
}
