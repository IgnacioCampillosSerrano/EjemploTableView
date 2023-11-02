import UIKit

class CrearTareaViewController: UIViewController {

    @IBOutlet weak var txtTitulo: UITextField!
    @IBOutlet weak var txtContenido: UITextField!
    
    var delegate: ObtenerTarea?
    //? No vas a darle valor al principio y puede ser vacio
    //! No se si hay algo, pero usalo
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func btnInsertarTarea(_ sender: Any) {
        let titulo = txtTitulo.text!
        let contenido = txtContenido.text!
        
        if !titulo.isEmpty && !contenido.isEmpty{
            let tarea = Tarea(titulo: titulo, contenido: contenido)
            
            delegate?.obtener(dato: tarea)
            self.dismiss(animated: true, completion: nil)
        }
    }
}
