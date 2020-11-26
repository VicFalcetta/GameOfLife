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
        scnView.allowsCameraControl = true
    }
    
    func renderer(_ renderer: SCNSceneRenderer, updateAtTime time: TimeInterval) {
        
    }
    
    
}
