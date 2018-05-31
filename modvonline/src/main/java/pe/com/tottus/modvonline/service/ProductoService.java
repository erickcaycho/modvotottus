package pe.com.tottus.modvonline.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import pe.com.tottus.modvonline.model.Producto;
import pe.com.tottus.modvonline.model.busqueda.Busqueda;
import pe.com.tottus.modvonline.model.busqueda.BusquedaFactory;
import pe.com.tottus.modvonline.model.busqueda.ParametrosBusqueda;

@Service
@Transactional
public class ProductoService {

	public List<Producto> buscarProductos(String tipo, ParametrosBusqueda parametros) {
		Busqueda busqueda = BusquedaFactory.crearBusqueda(tipo);
		return busqueda.buscarProductos(parametros);
	}

}
