import UIKit

var iteracoes: Int = 0
var gridJogo = [[Int]](repeating: [Int](repeating: 0, count: 10), count: 10)
var gridAux = gridJogo

gridJogo[0][0] = 1
gridJogo[1][0] = 1
gridJogo[2][0] = 1
gridJogo[3][4] = 1
gridJogo[3][5] = 0
gridJogo[3][6] = 0
gridJogo[4][4] = 1
gridJogo[4][5] = 0
gridJogo[4][6] = 0
gridJogo[5][4] = 1
gridJogo[5][5] = 1
gridJogo[5][6] = 1
gridJogo[6][5] = 0

func contarVizinhos(posY: Int, posX: Int) -> Int {
    var vizinhos = 0
    let pX = posX
    let pY = posY
    
    //Vendo se a linha não é ponta
    if (pY >= 1) && (pY <= 8) {
        if (pX >= 1) && (pX <= 8) {
            //Linha de cima
            vizinhos += gridJogo[pY - 1][pX - 1]
            vizinhos += gridJogo[pY - 1][pX]
            vizinhos += gridJogo[pY - 1][pX + 1]
            
            //Linha atual
            vizinhos += gridJogo[pY][pX - 1]
            vizinhos += gridJogo[pY][pX + 1]
            
            //Linha de baixo
            vizinhos += gridJogo[pY + 1][pX - 1]
            vizinhos += gridJogo[pY + 1][pX]
            vizinhos += gridJogo[pY + 1][pX + 1]
        }
        else if (pX == 0){
            //Linha de cima
            vizinhos += gridJogo[pY - 1][pX]
            vizinhos += gridJogo[pY - 1][pX + 1]
            
            //Linha atual
            vizinhos += gridJogo[pY][pX + 1]
            
            //Linha de baixo
            vizinhos += gridJogo[pY + 1][pX]
            vizinhos += gridJogo[pY + 1][pX + 1]
        }
        else {
            //Linha de cima
            vizinhos += gridJogo[pY - 1][pX - 1]
            vizinhos += gridJogo[pY - 1][pX]
            
            //Linha atual
            vizinhos += gridJogo[pY][pX - 1]
            
            //Linha de baixo
            vizinhos += gridJogo[pY + 1][pX - 1]
            vizinhos += gridJogo[pY + 1][pX]
        }
    } else if (pY == 0) {
        if (pX >= 1) && (pX <= 8) {
            //Linha atual
            vizinhos += gridJogo[pY][pX - 1]
            vizinhos += gridJogo[pY][pX + 1]
            
            //Linha de baixo
            vizinhos += gridJogo[pY + 1][pX - 1]
            vizinhos += gridJogo[pY + 1][pX]
            vizinhos += gridJogo[pY + 1][pX + 1]
        }
        else if (pX == 0){
            //Linha atual
            vizinhos += gridJogo[pY][pX + 1]
            
            //Linha de baixo
            vizinhos += gridJogo[pY + 1][pX]
            vizinhos += gridJogo[pY + 1][pX + 1]
        }
        else {
            //Linha atual
            vizinhos += gridJogo[pY][pX - 1]
            
            //Linha de baixo
            vizinhos += gridJogo[pY + 1][pX - 1]
            vizinhos += gridJogo[pY + 1][pX]
        }
    } else {
        if (pX >= 1) && (pX <= 8) {
            //Linha de cima
            vizinhos += gridJogo[pY - 1][pX - 1]
            vizinhos += gridJogo[pY - 1][pX]
            vizinhos += gridJogo[pY - 1][pX + 1]
            
            //Linha atual
            vizinhos += gridJogo[pY][pX - 1]
            vizinhos += gridJogo[pY][pX + 1]
        }
        else if (pX == 0){
            //Linha de cima
            vizinhos += gridJogo[pY - 1][pX]
            vizinhos += gridJogo[pY - 1][pX + 1]
            
            //Linha atual
            vizinhos += gridJogo[pY][pX + 1]
        }
        else {
            //Linha de cima
            vizinhos += gridJogo[pY - 1][pX - 1]
            vizinhos += gridJogo[pY - 1][pX]
            
            //Linha atual
            vizinhos += gridJogo[pY][pX - 1]
        }
    }
    return vizinhos
}

func percorreGrid() {
    var vizinhos: Int
    for posY in 0 ..< gridAux.count {
        for posX in 0 ..< gridAux[posY].count {
            vizinhos = contarVizinhos(posY: posY, posX: posX)
            if (gridJogo[posY][posX] == 1) && (vizinhos > 1) && (vizinhos < 4) {
                gridAux[posY][posX] = 1
            } else if (gridJogo[posY][posX] == 0) && (vizinhos == 3) {
                gridAux[posY][posX] = 1
            }
            else {
                gridAux[posY][posX] = 0
            }
        }
    }
    gridJogo = gridAux
}

print("Matriz antes de percorrer\n")
//Imprime a matriz que será utilizada como grid
for n in 0...9 {
    for m in 0...9 {
        print("\(gridJogo[n][m])  ", terminator:"")
    }
    print("\n")
}

while (iteracoes <= 20) {
    print("\n")
    percorreGrid()
    iteracoes += 1
    for n in 0...9 {
        for m in 0...9 {
            print("\(gridJogo[n][m])  ", terminator:"")
        }
        print("\n")
    }
    print("\n")
}
