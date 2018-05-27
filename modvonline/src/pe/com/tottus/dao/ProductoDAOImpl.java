/**
 * 
 */
package pe.com.tottus.dao;

import java.util.List;

import javax.sql.DataSource;
import org.apache.log4j.Logger;
import org.springframework.jdbc.core.JdbcTemplate;

import pe.com.tottus.modelo.Producto;

/**
 * @author ecaycho
 *
 */
public class ProductoDAOImpl implements ProductoDAO {
    protected static Logger log = Logger.getLogger(ProductoDAOImpl.class);

    private JdbcTemplate jdbcTemplate;

    public ProductoDAOImpl(DataSource dataSource) {
        jdbcTemplate = new JdbcTemplate(dataSource);
    }

    
	public List<Producto> listaProducto() {
		// TODO Auto-generated method stub
		return null;
	}


	public List<Producto> obtenerProducto(String codigo) {
		// TODO Auto-generated method stub
		return null;
	}
    
    
}
