package pe.com.tottus.modvonline.model.busqueda;

public class BusquedaFactory {

	public static Busqueda crearBusqueda(String tipo){
		Busqueda busqueda = null;
		switch(tipo){
			case "basica":
				busqueda = new BusquedaBasica(); 
				break;
			case "qr":
				busqueda = new BusquedaQR();
				break;
			case "imagen":
				busqueda = new BusquedaImagen();
				break;
			default:
				busqueda = new BusquedaBasica();
				break;
		}
		return busqueda;
	}
	
}
