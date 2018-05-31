package pe.com.tottus.modvonline.model.busqueda;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import pe.com.tottus.modvonline.dao.ProductoRepository;
import pe.com.tottus.modvonline.model.Producto;

@Component
public class BusquedaBasica implements Busqueda {

	@Autowired
	ProductoRepository productoRepository;
	
	@Override
	public List<Producto> buscarProductos(ParametrosBusqueda parametros) {
		List<Producto> productos = null;
		try {
			productos = productoRepository.filtrarProductosXNombre(parametros.getCodigoProducto());
		} catch (Exception e){
			e.printStackTrace();
		}
		return productos;
	}

}
