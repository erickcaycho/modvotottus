package pe.com.tottus.modvonline.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import pe.com.tottus.modvonline.model.Producto;

@Repository
public class ProductoRepository {
	private JdbcTemplate jdbcTemplate;

	@Autowired
	public void setDataSource(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	public List<Producto> filtrarProductosXNombre(String codigoProducto) {

		String sql = "select * from producto where codigoProducto like ?";

		RowMapper<Producto> mapper = new RowMapper<Producto>() {
			public Producto mapRow(ResultSet rs, int rowNum) throws SQLException {
				Producto producto = new Producto();
				producto.setIdProducto(rs.getInt("idProducto"));
				producto.setCodigoProducto(rs.getString("codigoProducto"));
				producto.setDescripcion(rs.getString("descripcion"));
				producto.setPrecioUnitario(rs.getDouble("precioUnitario"));

				return producto;
			}
		};

		return jdbcTemplate.query(sql, new Object[] { '%' + codigoProducto + '%' }, mapper);

	}

}
