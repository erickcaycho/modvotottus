package pe.com.tottus.dao;

import java.util.List;

import pe.com.tottus.modelo.Producto;

public interface ProductoDAO {
	
    public List<Producto> listaProducto();
    public List<Producto> obtenerProducto(String codigo);
    
}
