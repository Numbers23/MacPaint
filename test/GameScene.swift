//
//  GameScene.swift
//  test
//
//  Created by tyler sand on 8/18/18.
//  Copyright © 2018 tyler sand. All rights reserved.
//

import SpriteKit
import GameplayKit

//test


//test
class GameScene: SKScene {
    
    private var label : SKLabelNode?
    public var spinnyNode : SKShapeNode?
    let wid = CGFloat(0.6)//width of shape
    let hei = CGFloat(0.6)//height of shape
    @IBOutlet weak var Pal: NSMenuItem!
     var click: Bool = false
    var enableRed: Bool = false
    var enableYellow: Bool = false
    var enableGreen: Bool = false
    var activateMarker: Bool = false
    var activatePencil: Bool = false
    @IBOutlet weak var imageView: NSImageView!
    
    @IBOutlet weak var Palette: NSButton!
    let button = SKSpriteNode(imageNamed: "red")
     //var button: SKNode! = nil
    let point = CGPoint(x: 41, y: 38)
    
    //tesr
    
    //test
    
    override func didMove(to view: SKView) {
        
        // Get label node from scene and store it for use later
        /*
        self.label = self.childNode(withName: "//helloLabel") as? SKLabelNode
        if let label = self.label {
            label.alpha = 0.0
            label.run(SKAction.fadeIn(withDuration: 2.0))
        }*/
        
        // Create shape node to use during mouse interaction
        //let w = (self.size.width + self.size.height) * 0.01
        
        
        let w = (self.wid + self.hei) * 0.01//0.01 self.size.width + self.size.height
        
        self.spinnyNode = SKShapeNode.init(rectOf: CGSize.init(width: w, height: w), cornerRadius: w * 0.1)//0.3
        
        
        
        if let spinnyNode = self.spinnyNode {
            spinnyNode.lineWidth = 2.5
            
          
        }
    }
   
    func touchDown(toPoint pos : CGPoint) {
        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
            n.position = pos
           
        }
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
            n.position = pos
            n.strokeColor = SKColor.black//blue
            n.fillColor = NSColor.black//blue
            
            self.addChild(n)
         
            if click == true{
                n.strokeColor = SKColor.white
                n.fillColor = NSColor.white
                self.addChild(n)
                
            }
            if enableRed == true{
                n.strokeColor = SKColor.red
                n.fillColor = NSColor.red
                self.addChild(n)
                
            }
            if enableYellow == true{
                n.strokeColor = SKColor.yellow
                n.fillColor = NSColor.yellow
                self.addChild(n)
                
                
            }
            if enableGreen == true{
                n.strokeColor = SKColor.green
                n.fillColor = NSColor.green
                self.addChild(n)
                
                
            }
            
            if activateMarker == true{
                self.spinnyNode = self.childNode(withName: "//spinnyNode") as? SKShapeNode
                
                
            }
            
            
        }
    }
    
    func touched(atPoint pos : CGPoint) {
        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
            n.position = pos
            n.strokeColor = SKColor.red
            //self.addChild(n)
            //imageview collision
           
            
            
        }
    }
    
    
    
    func touchUp(atPoint pos : CGPoint) {
        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
            n.position = pos
            n.strokeColor = SKColor.red
            //self.addChild(n)
        }
    }
    
    override func mouseDown(with event: NSEvent) {
       // self.touchDown(toPoint: event.location(in: self))
    }
    
    override func mouseDragged(with event: NSEvent) {
     
        self.touchMoved(toPoint: event.location(in: self))
    }
    
    override func mouseUp(with event: NSEvent) {
        self.touchUp(atPoint: event.location(in: self))
    }
    
    override func keyDown(with event: NSEvent) {
        switch event.keyCode {
        case 0x31:
            print("test")
           /* if let label = self.label {
                label.run(SKAction.init(named: "Pulse")!, withKey: "ignition")
            }*/
       
        case 0x12:
            if event.keyCode == 0x12//0x12
            {
                print("left") //get the pressed key
                click = true
                if(click == true){
                    enableGreen = false
                    enableYellow = false
                    enableRed = false
                    
                }
           
        }
        case 0x13:
            if event.keyCode == 0x13//123
            {
                print("left") //get the pressed key
                enableRed = true
                //self.touchDown(toPoint: event.location(in: self))
                if(enableRed == true){
                    
                    
                    enableGreen = false
                    enableYellow = false
                    click = false
                    
                }
                
                
                
            }
        case 0x14:
            if event.keyCode == 0x14//123
            {
                print("left") //get the pressed key
                enableYellow = true
                if(enableYellow == true){
                    enableGreen = false
                    enableRed = false
                    click = false
                    
                }
               
            }
        case 0x15:
            if event.keyCode == 0x15//123
            {
                print("left") //get the pressed key
                enableGreen = true
                if(enableGreen == true){
                    enableYellow = false//switch yellow off
                    enableRed = false
                    click = false //cyan
                    
                }
               
            }
            
        case 0x2E:
            if event.keyCode == 0x2E//123
            {
               self.spinnyNode = self.childNode(withName: "//spinnyNode") as? SKShapeNode
                
                }
            
            //activate pencil
        case 0x23:
            if event.keyCode == 0x23//123
            {
                let w = (self.wid + self.hei) * 0.01
               self.spinnyNode = SKShapeNode.init(rectOf: CGSize.init(width: w, height: w), cornerRadius: w * 0.1)
                
            }
            //test
        case 0x1F:
            if event.keyCode == 0x1F//123
            {
                let dialog = NSOpenPanel();
                //test
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
                           
                            print("file selected:", url.path)
                        }
                        
                        
                    }
                } else {
                    // User clicked on "Cancel"
                    
                    
                    return
                }
               
            }
           
        default:
            print("keyDown: \(event.characters!) keyCode: \(event.keyCode)")
        }
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
