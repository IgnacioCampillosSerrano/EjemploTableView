import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, ObtenerTarea {

    

    @IBOutlet weak var tablaTareas: UITableView!
    
    var listaTareas: [Tarea]!
    var tarea: Tarea!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        listaTareas = []
        tablaTareas.delegate = self
        tablaTareas.dataSource = self
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        listaTareas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = tableView.dequeueReusableCell(withIdentifier: "CELDA", for: indexPath) as! CeldaTableViewCell //CREAR UNA CELDA REUTILIZABLE CON ID CELDA,EN POSICION indexPath con controlador CeldaTableViewCell
        
        tarea = listaTareas[indexPath.row]
        celda.lbTitulo.text = tarea.titulo
        celda.lbContenido.text = tarea.contenido
        
        
        return celda
    }
    //METODOS REALIZADOS A LA VUELTA DE LOS SEGUE (DELEGATE)
    
    func obtener(dato: Tarea) {
        listaTareas.append(dato)
        tablaTareas.reloadData()
    }
    
    
    func eliminar(posicion: Int) {
        listaTareas.remove(at: posicion)
        tablaTareas.reloadData()
    }
    
    func modificar(posicion: Int, nuevoDato: Tarea) {
        listaTareas[posicion] = nuevoDato
        tablaTareas.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "CREAR"
        {
            let destino = segue.destination as! CrearTareaViewController // ABRE LA ACTIVIDAD
            destino.delegate = self // INDICA QUE EL DELEGATE PARA OBTENER INFORMACION A LA VUELTA DEL SEGUE ES ESTA ACTIVIDAD
        }
        if segue.identifier == "MODIFICAR"
        {
            let destino = segue.destination as! ModificarViewController
            // PONER LA TAREA DEL DESTINO = TAREA DE LA LISTA CON EL INDICE DE LA TAREA PRESIONADA 
            destino.tarea = listaTareas[tablaTareas.indexPathForSelectedRow!.row]
            destino.posicion = tablaTareas.indexPathForSelectedRow!.row
            destino.delegate = self
        }
    }
    
}

