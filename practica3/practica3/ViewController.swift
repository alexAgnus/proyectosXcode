//
//  ViewController.swift
//  practica3
//
//  Created by user214029 on 3/16/22.
//

import UIKit

import FirebaseAuth
import FirebaseDatabase

class ViewController: UIViewController {
    
    
    @IBOutlet weak var carrera: UITextField!
    @IBOutlet weak var usuario: UITextField!
    @IBOutlet weak var semestre: UITextField!
    @IBOutlet weak var apellido: UITextField!
    @IBOutlet weak var nombre: UITextField!
    @IBOutlet weak var password: UITextField!
    
    var ref: DatabaseReference!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = Database.database().reference()
       
    }

    @IBAction func creaUsuario(_ sender: Any) {
        
        Auth.auth().createUser(withEmail: "ralejandrobm@gmail.com", password: "alex11") { (resulatado, error) in
            if let res=resulatado, error == nil
            {
                var usuario = Auth.auth().currentUser
                if(usuario != nil)
                {
                    self.ref.child("usuario").child(usuario!.uid).setValue(["nombre":"alejandro"],withCompletionBlock: {(error, snapchop) in
                        if  error == nil
                        {
                            let alertaExito = UIAlertController(title: "Exito", message: "Usuario Registrado "+usuario!.uid, preferredStyle: .alert)
                            alertaExito.addAction(UIAlertAction(title:"aceptar", style: .default))
                            
                            self.present(alertaExito, animated: true, completion: nil)
                        }
                        else
                        {
                            let alertaError = UIAlertController(title: "Error", message: "NO Registrado "+error!.localizedDescription, preferredStyle: .alert)
                            alertaError.addAction(UIAlertAction(title:"aceptar", style: .default))
                            
                            self.present(alertaError, animated: true, completion: nil)
                        }
                    })
                   
                }
                
            }
            else
            {
                let alertaError = UIAlertController(title: "Error", message: "NO Registrado "+error!.localizedDescription, preferredStyle: .alert)
                alertaError.addAction(UIAlertAction(title:"aceptar", style: .default))
                
                self.present(alertaError, animated: true, completion: nil)
                
            }
        }
    }
    
}

