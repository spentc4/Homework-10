//
//  ViewController.swift
//  Curran Homework 10
//
//  Created by Spencer Curran on 4/29/20.
//  Copyright © 2020 Spencer Curran. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var userName: UITextField!
    
    @IBOutlet weak var faveSong: UITextField!
    
    @IBOutlet weak var faveBook: UITextField!
    
    @IBOutlet weak var faveMovie: UITextField!
    
    @IBOutlet weak var resultsView: UITextView!
    
    
    
    
    @IBAction func displayResultsNow(_ sender: Any) {
        
        let alert = UIAlertController(title: "results", message: " \(userName.text!) \(faveSong.text!) \(faveBook.text!) \(faveMovie.text!)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title:NSLocalizedString("accept", comment: "default action"), style: .`default`, handler: { _ in}))
        
        self.present(alert,animated: true, completion: nil)
    }
    
    
    

    

        
        
        
        
        
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    @IBAction func saveResults(_ sender: Any) {
        let csvLine:String = "\(userName.text!),\(faveSong.text!),\(faveBook.text!),\(faveMovie.text!)\n"
        let paths = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask,true)
        let docDir:String=paths[0]
        let resultsFile:String=(docDir as NSString).appendingPathComponent("results.csv")
        if !FileManager.default.fileExists(atPath: resultsFile) {
            FileManager.default.createFile(atPath: resultsFile,contents: nil, attributes: nil)
        }
        
        let fileHandle:FileHandle=FileHandle(forUpdatingAtPath: resultsFile)!
        fileHandle.seekToEndOfFile()
        fileHandle.write(csvLine.data(using: String.Encoding.utf8)!)
        fileHandle.closeFile()
        
        userName.text = ""
        faveSong.text = ""
        faveBook.text = ""
        faveMovie.text = ""
        
    }
    
    
    
    @IBAction func showResults(_ sender: Any) {
        let paths = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory,FileManager.SearchPathDomainMask.userDomainMask,true)
        let docDir:String=paths[0] as String
        let resultsFile:String=(docDir as NSString).appendingPathComponent("results.csv")
        
        if FileManager.default.fileExists(atPath: resultsFile) {
            let fileHandle:FileHandle = FileHandle(forReadingAtPath:resultsFile)!
            let resultsData:String!=NSString(data: fileHandle.availableData, encoding: String.Encoding.utf8.rawValue)! as String
            fileHandle.closeFile()
            
            
            resultsView?.text=resultsData
        }
        else
        {
            // file does not exist
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }


}

