//
//  Cell.swift
//  GameLifeChallenge
//
//  Created by Victor Falcetta do Nascimento on 01/11/19.
//  Copyright © 2019 Victor Falcetta do Nascimento. All rights reserved.
//

import Foundation
import SceneKit

class Cell: SCNNode {
    
    var isViva: Int
    var vaiViver: Bool = true
    let corCubo: NSColor = NSColor.orange
    let cuboTam: CGFloat
    let posX: CGFloat
    let posY: CGFloat
    
    init (isViva: Int, posX: CGFloat, posY: CGFloat, cuboTam: CGFloat) {
        //Inicializando os parametros da classe
        self.isViva = isViva
        self.cuboTam = cuboTam
        self.posX = posX
        self.posY = posY
        super.init()
        
        //Após o super.init, os inicializadores do SCNNode começam a funcionar. Não é necessário o override antes já que possui um próprio seu e não utiliza o do pai.
        
        self.geometry = SCNBox(width: cuboTam, height: cuboTam, length: cuboTam, chamferRadius: 0)
        self.geometry?.firstMaterial?.diffuse.contents = corCubo
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
