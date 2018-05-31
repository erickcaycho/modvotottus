package pe.com.tottus.modvonline.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pe.com.tottus.modvonline.dao.ProductoRepository;
import pe.com.tottus.modvonline.model.Producto;

@Service
@Transactional
public class ProductoService {

	@Autowired
	ProductoRepository productoRepository;

	public List<Producto> filtrarProductosXNombre(String codigoProducto) {

		return productoRepository.filtrarProductosXNombre(codigoProducto);
	}

}
