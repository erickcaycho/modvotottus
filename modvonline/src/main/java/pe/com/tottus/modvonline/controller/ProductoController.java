package pe.com.tottus.modvonline.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import pe.com.tottus.modvonline.model.Producto;
import pe.com.tottus.modvonline.service.ProductoService;

@Controller
public class ProductoController {

	@Autowired
	private ProductoService productoService;

	@GetMapping("/")
	public String home(HttpServletRequest request) {
		return "index";
	}

	@GetMapping("/consultar")
	public String consultarProductos(@RequestParam String codigoProducto, HttpServletRequest request) {

		List<Producto> productos = productoService.filtrarProductosXNombre(codigoProducto);
		request.setAttribute("productos", productoService.filtrarProductosXNombre(codigoProducto));
		if (productos.size() == 0) {
			request.setAttribute("modo", "MODO_VACIO");
		} else {
			request.setAttribute("modo", "MODO_CONSULTA");
		}

		return "index";
	}

}
