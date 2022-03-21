//
//  tablaOpciones.swift
//  practica3
//
//  Created by user214029 on 3/21/22.
//

import UIKit

class tablaOpciones: UIViewController {

    @IBOutlet weak var tabla: UITableView!
    
    let opciones = ["editar cuenta", "logout"]
    override func viewDidLoad() {
        super.viewDidLoad()

        tabla.dataSource = self
        tabla.delegate = self
        
    }
    


}

extension tablaOpciones:UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return opciones.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell (style: .default, reuseIdentifier: "cel")
        cell.accessoryType = .disclosureIndicator
        cell.textLabel?.text = opciones[indexPath.row]
        
        return cell
    }
    
    
}

extension tablaOpciones:UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let alertaError = UIAlertController(title: "Opción", message: opciones[indexPath.row], preferredStyle: .alert)
        alertaError.addAction(UIAlertAction(title:"aceptar", style: .default))
        
        self.present(alertaError, animated: true, completion: nil)
    }
}
