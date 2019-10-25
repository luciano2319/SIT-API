package cib.sit.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import cib.sit.beans.OperacionDTO;
import cib.sit.interfaces.OperacionInterface;
import utils.SQLConexion;

public class OperacionDAO implements OperacionInterface{

	@Override
	public List<OperacionDTO> listarOperacionesXTarjeta(String COD_TARJETA) {
		List<OperacionDTO> lista=new ArrayList<OperacionDTO>();
		ResultSet rs = null;
		Connection con = null;
		PreparedStatement pst = null;
		try {
			con = SQLConexion.getConexion();
			String sql = "select * from TB_OPERACION where COD_TARJETA=?";
			pst = con.prepareStatement(sql);
			pst.setString(1, COD_TARJETA);
			rs = pst.executeQuery();
			while (rs.next()) {
				OperacionDTO o = new OperacionDTO();
				o.setCOD_OPERACION(rs.getInt(1));
				o.setCOD_TARJETA(rs.getString(2));
				o.setFECHA_OPERACION(rs.getString(3));
			}
		} catch (Exception e) {
			System.out.println("Error en la sentencia listar operaciones x tarjeta: " + e.getMessage());
		} finally {
			try {
				if (pst != null)
					pst.close();
				if (con != null)
					con.close();
			} catch (SQLException e) {
				System.out.println("Error al cerrar la sentencia listar operaciones x tarjeta: " + e.getMessage());
			}
		}
		
		return lista;
	}

}
