package pe.com.tottus.modvonline.model.busqueda;

import java.util.List;

import pe.com.tottus.modvonline.model.Producto;

public interface Busqueda {
	public List<Producto> buscarProductos(ParametrosBusqueda parametros);
}
