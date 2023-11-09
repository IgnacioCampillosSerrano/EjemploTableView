import UIKit

class ModificarViewController: UIViewController {

    @IBOutlet weak var txtTitulo: UITextField!
    @IBOutlet weak var txtContenido: UITextField!
    
    var tarea: Tarea!
    var posicion: Int!
    var delegate: ObtenerTarea!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        txtTitulo.text = tarea.titulo
        txtContenido.text = tarea.contenido
        
    }
    
    //Volver ejecutando delegate.eliminar, que hereda de ObtenerTarea.
    @IBAction func btnEliminar(_ sender: Any) {
        delegate.eliminar(posicion: posicion)
        self.dismiss(animated: false, completion: nil)
    }
    
    //Volver ejecutando delegate.modificar, que hereda de ObtenerTarea.
    //En caso de que no hayan datos, sacar una alerta
    @IBAction func btnModificar(_ sender: Any) {
        if txtTitulo.text!.isEmpty || txtContenido.text!.isEmpty{
            let alert = UIAlertController(title: "ERROR", message: "FALTAN DATOS :(", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .destructive, handler: nil))
            self.present(alert,animated: true, completion: nil)
            

            
        }else{

            let nuevaTarea = Tarea(titulo: txtTitulo.text!, contenido: txtContenido.text!)
            delegate.modificar(posicion: posicion, nuevoDato: nuevaTarea)
            self.dismiss(animated: false, completion: nil)
        }

    }
}
