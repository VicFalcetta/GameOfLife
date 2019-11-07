//
//  GameViewController.swift
//  GameLifeChallenge
//
//  Created by Victor Falcetta do Nascimento on 01/11/19.
//  Copyright © 2019 Victor Falcetta do Nascimento. All rights reserved.
//

import SceneKit
import QuartzCore

class GameViewController: NSViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let scnView = self.view as! SCNView
        scnView.scene = GameCena()
        setupLight(rootNode: scnView.scene!.rootNode)
        scnView.allowsCameraControl = true
    }
    
    func setupLight(rootNode: SCNNode) {
        let lightNode = SCNNode()
        lightNode.light = SCNLight()
        lightNode.light!.type = .omni
        lightNode.position = SCNVector3(x: 0, y: 100, z: 100)
        rootNode.addChildNode(lightNode)

        let ambientLightNode = SCNNode()
        ambientLightNode.light = SCNLight()
        ambientLightNode.light!.type = .ambient
        ambientLightNode.light!.color = NSColor.gray
        rootNode.addChildNode(ambientLightNode)
    }
    
    
}
