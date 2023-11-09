import Foundation

protocol ObtenerTarea {
    func obtener(dato: Tarea)
    func eliminar(posicion: Int )
    func modificar(posicion: Int, nuevoDato: Tarea)
}
