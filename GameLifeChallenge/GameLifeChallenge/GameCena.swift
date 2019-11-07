//
//  GameCena.swift
//  GameLifeChallenge
//
//  Created by Victor Falcetta do Nascimento on 01/11/19.
//  Copyright © 2019 Victor Falcetta do Nascimento. All rights reserved.
//

import Foundation
import SceneKit

class GameCena: SCNScene {
    var timer: Timer?
    var altura: CGFloat = 1
    
    override init() {
        super.init()
        
        //Criando uma camera para a cena
        let cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        rootNode.addChildNode(cameraNode)
        
        //Posicionando a camera
        cameraNode.camera?.zFar = 1000.0
        cameraNode.rotation = SCNVector4(x: 5, y: 5, z: 0, w: 150)
        cameraNode.position = SCNVector3(x: -70, y: 60, z: 90)
        
        let plano = SCNBox(width: 40, height: 5, length: 40, chamferRadius: 0)
        plano.firstMaterial?.diffuse.contents = NSColor.gray
        
        let planoNode = SCNNode(geometry: plano)
        planoNode.position = SCNVector3(0, plano.height/2, 0)
        rootNode.addChildNode(planoNode)
        
        let grid = Grid(sizeLength: plano.length, sizeWidth: plano.width, sizeHeight: plano.height)
        grid.position = SCNVector3(0, 0, 0)
        rootNode.addChildNode(grid)
        
        loopGrid(grid: grid)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func percorreGrid(grid: Grid) {
        var vizinhos: Int
        for n in 0 ..< grid.gridCell.count {
            for m in 0 ..< grid.gridCell[n].count {
                vizinhos = grid.contaVizinhos(posX: m, posY: n)
                if (grid.gridCell[n][m].isViva == 1) && (vizinhos > 1) && (vizinhos < 4) {
                    grid.gridCell[n][m].vaiViver = true
                } else if (grid.gridCell[n][m].isViva == 0) && (vizinhos == 3) {
                    grid.gridCell[n][m].vaiViver = true
                } else {
                    grid.gridCell[n][m].vaiViver = false
                }
            }
        }
        for n in 0 ..< grid.gridCell.count {
            for m in 0 ..< grid.gridCell[n].count {
                if (grid.gridCell[n][m].vaiViver == false) {
                    grid.gridCell[n][m].removeFromParentNode()
                    grid.gridCell[n][m].isViva = 0
                }
                else {
                    grid.gridCell[n][m].isViva = 1
                    grid.addChildNode(grid.gridCell[n][m])
                }
            }
        }
    }
    
    func loopGrid(grid: Grid) {
        timer = Timer.scheduledTimer(withTimeInterval: 0.3, repeats: true) { timer in
            self.percorreGrid(grid: grid)
        }
    }
}
