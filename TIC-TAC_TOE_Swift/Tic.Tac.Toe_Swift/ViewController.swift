//
//  ViewController.swift
//  VR_450793_Swift
//
//  Created by Silver Gjeka on 03/02/22.
//
//  In questa pate faccio semplicemente il disegno dove chiedo per il primo nome
//  del giocatore e il secondo
//
//  funziona per Ihon 11 e su 
//
//
//  

import UIKit

class ViewController: UIViewController {
    
    // Primo Nome
    @IBOutlet weak var PutName1: UITextField!
    // Secondo Nome
    @IBOutlet weak var PutName2: UITextField!
    // Start Button
    @IBOutlet weak var START: UIButton!
    
    
// Principal Function
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // prepare Function fa la connessione tra prima e seconda ViewController
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Conessione con GameViewController dove e la pare del gioco
        if let controller = segue.destination as? GameViewController {
            // Prende i Nomi di giocatori
            controller.Player1Name = PutName1.text
            controller.Player2Name = PutName2.text
            // Quando cambiam ViewController cambia in modo flipHorizontal
            controller.modalTransitionStyle = .flipHorizontal
            // Va a full screen il GameView Controller
            controller.modalPresentationStyle = .fullScreen

        }
    }

}

