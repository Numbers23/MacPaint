//
//  ViewController.swift
//  test
//
//  Created by tyler sand on 8/18/18.
//  Copyright © 2018 tyler sand. All rights reserved.
//

import Cocoa
import SpriteKit
import GameplayKit

//test


//test
extension NSOpenPanel {
    var selectUrl: URL? {
        title = "Select Image"
        allowsMultipleSelection = false
        canChooseDirectories = false
        canChooseFiles = true
        canCreateDirectories = false
        allowedFileTypes = ["jpg","png","pdf","pct", "bmp", "tiff"]  // to allow only images, just comment out this line to allow any file type to be selected
        return runModal() == .OK ? urls.first : nil
    }
    var selectUrls: [URL]? {
        title = "Select Images"
        allowsMultipleSelection = true
        canChooseDirectories = false
        canChooseFiles = true
        canCreateDirectories = false
        allowedFileTypes = ["jpg","png","pdf","pct", "bmp", "tiff"]  // to allow only images, just comment out this line to allow any file type to be selected
        return runModal() == .OK ? urls : nil
    }
}


//test
class img: SKShapeNode{
    init(imageNamed: URL){
        super.init()
      
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}





//test

class ViewController: NSViewController {

    @IBOutlet var skView: SKView!
     var markerSelected: Bool!
    
    @IBOutlet weak var imageView: NSImageView!
    var proceed: Bool!
    
    //test
    @IBAction func colorItem(sender: NSMenuItem) {
        print("success!")
        let dialog = NSOpenPanel();
        
        dialog.title                   = "Choose a .txt file";
        dialog.showsResizeIndicator    = true;
        dialog.showsHiddenFiles        = false;
        dialog.canChooseDirectories    = true;
        dialog.canCreateDirectories    = true;
        dialog.allowsMultipleSelection = false;
        dialog.allowedFileTypes        = ["png"];
        
        if (dialog.runModal() == NSApplication.ModalResponse.OK) {
            let result = dialog.url // Pathname of the file
            
            if (result != nil) {
                
                if let url = dialog.selectUrl {
                    imageView.image = NSImage(contentsOf: url)
                   
                    imageView.canDrawSubviewsIntoLayer = true
                    
                   
                    self.view.addSubview(imageView)
                   
                    print("file selected:", url.path)
                }
                
                
            }
        } else {
            // User clicked on "Cancel"
            
            
            return
        }
        
    }
    //test
@IBAction func removeLayer(_ sender: AnyObject?) {
        imageView.canDrawSubviewsIntoLayer = false
    
        
    }
    
   
    override func viewDidLoad() {
        super.viewDidLoad()

        if let view = self.skView {
            
            if let scene = SKScene(fileNamed: "GameScene") {
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFill
                
                
                
                //scene.size = view.bounds.size
                
                // Present the scene
                view.presentScene(scene)
            }
            
            view.ignoresSiblingOrder = true
            
            view.showsFPS = true
            view.showsNodeCount = true
        }
    }
}

