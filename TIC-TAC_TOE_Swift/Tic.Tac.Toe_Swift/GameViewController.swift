//
//  GameViewController.swift
//  VR_450793_Swift
//
//  Created by Silver Gjeka on 03/02/22.
//
//  Per conettere GameViewController con il Assistent sono andato a Main-Show The
//  identity Expetor - classe --> GameViewController
//
//  Qui ho fatto il codice di Tic - Tac - Toe Game
//


import UIKit

class GameViewController: UIViewController {

    
    // Il turno
    @IBOutlet weak var Turn: UILabel!
    
    // Primo Giocatore
    @IBOutlet weak var Name1: UILabel!
    @IBOutlet weak var Score1: UILabel!
    
    // Secondo Giocatore
    @IBOutlet weak var Name2: UILabel!
    @IBOutlet weak var Score2: UILabel!
    
    // Buttons
    @IBOutlet weak var B1: UIButton!
    @IBOutlet weak var B2: UIButton!
    @IBOutlet weak var B3: UIButton!
    @IBOutlet weak var B4: UIButton!
    @IBOutlet weak var B5: UIButton!
    @IBOutlet weak var B6: UIButton!
    @IBOutlet weak var B7: UIButton!
    @IBOutlet weak var B8: UIButton!
    @IBOutlet weak var B9: UIButton!
    
    
    // I nomi che l'utente mette
    var Player1Name : String!
    var Player2Name : String!
    // Il Primo resultato
    var firstScore = 0
    // Il Secondo Resultato
    var secondScore = 0
    
    // Funzione Princiale
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Se Utente non mette un nome metto come nome player1 player2
        if !Player1Name.isEmpty{
            Name1.text = Player1Name
        } else {
            Name1.text = "Player 1"
        }
        if !Player2Name.isEmpty{
            Name2.text = Player2Name
        } else {
            Name2.text = "Player 2"
        }
        
        // Faccio clean di tutto i buttoni
        
        B1.setTitle(" ", for: .normal)
        B2.setTitle(" ", for: .normal)
        B3.setTitle(" ", for: .normal)
        B4.setTitle(" ", for: .normal)
        B5.setTitle(" ", for: .normal)
        B6.setTitle(" ", for: .normal)
        B7.setTitle(" ", for: .normal)
        B8.setTitle(" ", for: .normal)
        B9.setTitle(" ", for: .normal)
    }
    
    // questo funzione va a capire dove l'utente ha fatto click di un buttone
    
    @IBAction func ButtonClicked(_ sender: Any) {
        
        let ButtonPush = sender as! UIButton
        // Il Funzione del Gioco
        GamePlay (ButtonPush : ButtonPush)
    }
    // Ci tocca per prima giocare
    var Player = 1
    // Player1 array per Salvare i resultati
    var Player1 = [Int]()
    var size = 0 // size arrey 1
    // Player array per Salvare i resultati
    var Player2 = [Int]()
    var size2 = 0 // size arrey2
    
    var result = 0 // resultato di tutto l'arrey
    var winner = -1 // Non ha vinto Nessuno

    func GamePlay (ButtonPush: UIButton) {
        
        // Turn O
        if Player == 1 {
            // conta primo arrey
             size = Player1.count
            ButtonPush.setTitle("O", for: .normal)
            // Turn X
            Player = 2
            // Cambio del label Turn X
            Turn.text = "X"
            
            // Salvo i result player1 usando i tag dei buttoni da 1...9
            Player1.append(ButtonPush.tag)
            
        }else{
            // conta secondo arry
            size2 = Player2.count
            // Turn X
            ButtonPush.setTitle("X", for: .normal)
            Player = 1
            // Turn Label = O
            Turn.text = "O"

            // Salvo i resultati Player2
            Player2.append(ButtonPush.tag)
        }
        // somma della lunghezza di 2 arrey
          result = size + size2
        // funzione winner chi ha vinto
        Winner()
        
        // Qui se vanno clicatto tutti i buttoni vado a fare Drow
        // 7 per causa che arrei iniza da 0 il conto --> (o0 + x0) + (o1 + x1) + (o2 + x2) + (o3 + x3) + (o4)  ---> 7
        if ( result == 7){
            // Pulisco quando e un drow
            B1.setTitle(" ", for: .normal)
            B2.setTitle(" ", for: .normal)
            B3.setTitle(" ", for: .normal)
            B4.setTitle(" ", for: .normal)
            B5.setTitle(" ", for: .normal)
            B6.setTitle(" ", for: .normal)
            B7.setTitle(" ", for: .normal)
            B8.setTitle(" ", for: .normal)
            B9.setTitle(" ", for: .normal)
            // Metto la tabella di drow in screen
            let alert = UIAlertController(title: "DRAW!", message: "It's a Draw!", preferredStyle: UIAlertController.Style.alert)
//Button restart
            alert.addAction(UIAlertAction(title: "Restart", style: UIAlertAction.Style.default, handler: {(_) in self.Reset()
            }))

            self.present(alert, animated: true, completion: nil)
           
        }
        // Non si cambia il segno se tocca 2 volte l'utente
        ButtonPush.isEnabled = false
        
    }
    
 
    
    func Winner() {
        
        var winner = -1 // Nessun Vincitore
        
        
        // Righe Winner per Player1 e Player2
        if ( Player1.contains(1) && Player1.contains(2) && Player1.contains(3)){
            winner = 1 // Vince il primo giocatore
        }
        if ( Player2.contains(1) && Player2.contains(2) && Player2.contains(3)){
            winner = 2 // Vince il Secondo giocatore
        }

        if ( Player1.contains(4) && Player1.contains(5) && Player1.contains(6)){
            winner = 1 // Vince il primo giocatore
        }
        if ( Player2.contains(4) && Player2.contains(5) && Player2.contains(6)){
            winner = 2 // Vince il Secondo giocatore
        }

        if ( Player1.contains(7) && Player1.contains(8) && Player1.contains(9)){
            winner = 1 // Vince il primo giocatore
        }
        if ( Player2.contains(7) && Player2.contains(8) && Player2.contains(9)){
            winner = 2 // Vince il Secondo giocatore
        }


        // colon Winner

        if ( Player1.contains(1) && Player1.contains(4) && Player1.contains(7)){
            winner = 1 // Vince il primo giocatore
        }
        if ( Player2.contains(1) && Player2.contains(4) && Player2.contains(7)){
            winner = 2 // Vince il Secondo giocatore
        }

        if ( Player1.contains(2) && Player1.contains(5) && Player1.contains(8)){
            winner = 1 // Vince il primo giocatore
        }
        if ( Player2.contains(2) && Player2.contains(5) && Player2.contains(8)){
            winner = 2 // Vince il Secondo giocatore
        }

        if (Player1.contains(3) && Player1.contains(6) && Player1.contains(9)){
            winner = 1 // Vince il primo giocatore
        }
        if ( Player2.contains(3) && Player2.contains(6) && Player2.contains(9)){
            winner = 2 // Vince il Secondo giocatore
        }


        // X Winner
        if ( Player1.contains(1) && Player1.contains(5) && Player1.contains(9)){
            winner = 1 // Vince il primo giocatore
        }
        if ( Player2.contains(1) && Player2.contains(5) && Player2.contains(9)){
            winner = 2 // Vince il Secondo giocatore
        }
        if ( Player1.contains(3) && Player1.contains(5) && Player1.contains(7)){
            winner = 1 // Vince il primo giocatore
        }
        if ( Player2.contains(3) && Player2.contains(5) && Player2.contains(7)){
            winner = 2 // Vince il Secondo giocatore
        }


        if ( winner != -1 ){

            var msg = ""
          // ha vinto il prio giocatore
            if (winner == 1){
                // vanno a mettere un punto in piu
                firstScore += 1
                 // Stampo chi ha vinto
                msg = Name1.text! + " is the Winner"
            // stessa per il secondo
            }else if (winner == 2) {
                secondScore += 1
                msg = Name2.text! + " is the Winner"
            }
            // Vado a mettere in tabella i score
            Score1.text=String(firstScore)
            Score2.text=String(secondScore)

            
            //pulisco i titoli quando inizio il prossimo gioco
            
            B1.setTitle(" ", for: .normal)
            B2.setTitle(" ", for: .normal)
            B3.setTitle(" ", for: .normal)
            B4.setTitle(" ", for: .normal)
            B5.setTitle(" ", for: .normal)
            B6.setTitle(" ", for: .normal)
            B7.setTitle(" ", for: .normal)
            B8.setTitle(" ", for: .normal)
            B9.setTitle(" ", for: .normal)
            
            // Tablella del vincitore
            
            let alert = UIAlertController(title: "WINNER", message: msg, preferredStyle: UIAlertController.Style.alert)
// Button per far restart il gioco
            alert.addAction(UIAlertAction(title: "Restart", style: UIAlertAction.Style.default, handler: {(_) in self.Reset()
            }))
            self.present(alert, animated: true, completion: nil)
            
        }

    }
    // Funzione che pulisce i buttoni
    func Reset(){
        // clean di buttoni
        B1.setTitle(" ", for: .normal)
        B2.setTitle(" ", for: .normal)
        B3.setTitle(" ", for: .normal)
        B4.setTitle(" ", for: .normal)
        B5.setTitle(" ", for: .normal)
        B6.setTitle(" ", for: .normal)
        B7.setTitle(" ", for: .normal)
        B8.setTitle(" ", for: .normal)
        B9.setTitle(" ", for: .normal)
        //rissetto tutti i buttoni nello stato iniziale (vuoto)
        B1.setTitle(nil, for: .normal)
        B1.isEnabled = true
        B2.setTitle(nil, for: .normal)
        B2.isEnabled = true
        B3.setTitle(nil, for: .normal)
        B3.isEnabled = true
        B4.setTitle(nil, for: .normal)
        B4.isEnabled = true
        B5.setTitle(nil, for: .normal)
        B5.isEnabled = true
        B6.setTitle(nil, for: .normal)
        B6.isEnabled = true
        B7.setTitle(nil, for: .normal)
        B7.isEnabled = true
        B8.setTitle(nil, for: .normal)
        B8.isEnabled = true
        B9.setTitle(nil, for: .normal)
        B9.isEnabled = true
        //rissetto a zero
        result = 0
        size = 0
        size2 = 0
        //chi inizia per primo
        Player = 1
        
        //pulisco l'array
        Player1.removeAll()
        Player2.removeAll()
        
        
    }
    
}
