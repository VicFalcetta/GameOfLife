//
//  Grid.swift
//  GameLifeChallenge
//
//  Created by Victor Falcetta do Nascimento on 04/11/19.
//  Copyright © 2019 Victor Falcetta do Nascimento. All rights reserved.
//

import Foundation
import SceneKit

class Grid: SCNNode {
    
    var gridCell = [[Cell]]()
    let sizeLength: CGFloat
    let sizeWidth: CGFloat
    let sizeHeight: CGFloat
    
    init(sizeLength: CGFloat, sizeWidth: CGFloat, sizeHeight: CGFloat) {
        self.sizeWidth = sizeWidth
        self.sizeLength = sizeLength
        self.sizeHeight = sizeHeight
        
        super.init()
        
        var spaceX: CGFloat = 0
        var spaceY: CGFloat = 0
        
        //Inicializando a grid
        for n in 0 ..< Int(sizeWidth) {
            //Cria a linha para dar append
            var linhaDoGrid = [Cell]()
            for m in 0 ..< Int(sizeLength) {
                //Random para dizer se a linha está viva ou não
//                let randomNumber = Int.random(in: 0 ... 10)
                if (n == 4) || (n == 16) || (n == 34) || (m == 6) || (m == 17) || (m == 32){
                    let cell = Cell(isViva: 1, posX: CGFloat(n), posY: CGFloat(m), cuboTam: 1)
                    linhaDoGrid.append(cell)
                }
                else {
                    let cell = Cell(isViva: 0, posX: CGFloat(n), posY: CGFloat(m), cuboTam: 1)
                    linhaDoGrid.append(cell)
                }
                linhaDoGrid[m].position = SCNVector3((linhaDoGrid[m].cuboTam) / 2 - sizeWidth/2 + spaceX,sizeHeight + linhaDoGrid[m].cuboTam/2, linhaDoGrid[m].cuboTam / 2 - sizeLength/2 + spaceY)
                if (linhaDoGrid[m].isViva == 1) {
                    addChildNode(linhaDoGrid[m])
                }
                spaceX += 1
            }
            gridCell.append(linhaDoGrid)
            spaceY += 1
            spaceX = 0
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func contaVizinhos(posX: Int, posY: Int) -> Int {
        var vizinhos = 0
        
        //Vendo se a linha não é ponta
        if (posY >= 1) && (posY < Int(sizeLength - 1)) {
            if (posX >= 1) && (posX < Int(sizeWidth - 1)) {
                //Linha de cima
                vizinhos += gridCell[posY - 1][posX - 1].isViva
                vizinhos += gridCell[posY - 1][posX].isViva
                vizinhos += gridCell[posY - 1][posX + 1].isViva
                
                //Linha atual
                vizinhos += gridCell[posY][posX - 1].isViva
                vizinhos += gridCell[posY][posX + 1].isViva
                
                //Linha de baixo
                vizinhos += gridCell[posY + 1][posX - 1].isViva
                vizinhos += gridCell[posY + 1][posX].isViva
                vizinhos += gridCell[posY + 1][posX + 1].isViva
            }
            else if (posX == 0){
                //Linha de cima
                vizinhos += gridCell[posY - 1][posX].isViva
                vizinhos += gridCell[posY - 1][posX + 1].isViva
                
                //Linha atual
                vizinhos += gridCell[posY][posX + 1].isViva
                
                //Linha de baixo
                vizinhos += gridCell[posY + 1][posX].isViva
                vizinhos += gridCell[posY + 1][posX + 1].isViva
            }
            else {
                //Linha de cima
                vizinhos += gridCell[posY - 1][posX - 1].isViva
                vizinhos += gridCell[posY - 1][posX].isViva
                
                //Linha atual
                vizinhos += gridCell[posY][posX - 1].isViva
                
                //Linha de baixo
                vizinhos += gridCell[posY + 1][posX - 1].isViva
                vizinhos += gridCell[posY + 1][posX].isViva
            }
        } else if (posY == 0) {
            if (posX >= 1) && (posX < Int(sizeWidth - 1)) {
                //Linha atual
                vizinhos += gridCell[posY][posX - 1].isViva
                vizinhos += gridCell[posY][posX + 1].isViva
                
                //Linha de baixo
                vizinhos += gridCell[posY + 1][posX - 1].isViva
                vizinhos += gridCell[posY + 1][posX].isViva
                vizinhos += gridCell[posY + 1][posX + 1].isViva
            }
            else if (posX == 0){
                //Linha atual
                vizinhos += gridCell[posY][posX + 1].isViva
                
                //Linha de baixo
                vizinhos += gridCell[posY + 1][posX].isViva
                vizinhos += gridCell[posY + 1][posX + 1].isViva
            }
            else {
                //Linha atual
                vizinhos += gridCell[posY][posX - 1].isViva
                
                //Linha de baixo
                vizinhos += gridCell[posY + 1][posX - 1].isViva
                vizinhos += gridCell[posY + 1][posX].isViva
            }
        } else {
            if (posX >= 1) && (posX < Int(sizeWidth - 1)) {
                //Linha de cima
                vizinhos += gridCell[posY - 1][posX - 1].isViva
                vizinhos += gridCell[posY - 1][posX].isViva
                vizinhos += gridCell[posY - 1][posX + 1].isViva
                
                //Linha atual
                vizinhos += gridCell[posY][posX - 1].isViva
                vizinhos += gridCell[posY][posX + 1].isViva
            }
            else if (posX == 0){
                //Linha de cima
                vizinhos += gridCell[posY - 1][posX].isViva
                vizinhos += gridCell[posY - 1][posX + 1].isViva
                
                //Linha atual
                vizinhos += gridCell[posY][posX + 1].isViva
            }
            else {
                //Linha de cima
                vizinhos += gridCell[posY - 1][posX - 1].isViva
                vizinhos += gridCell[posY - 1][posX].isViva
                
                //Linha atual
                vizinhos += gridCell[posY][posX - 1].isViva
            }
        }
        return vizinhos
    }
}
