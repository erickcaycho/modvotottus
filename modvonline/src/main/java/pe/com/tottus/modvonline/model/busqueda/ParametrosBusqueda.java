package pe.com.tottus.modvonline.model.busqueda;

public class ParametrosBusqueda {
	
	private String codigoProducto;

	public String getCodigoProducto() {
		return codigoProducto;
	}

	public ParametrosBusqueda codigoProducto(String codigoProducto) {
		this.codigoProducto = codigoProducto;
		return this;
	}
	
}
