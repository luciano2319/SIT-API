package cib.sit.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import cib.sit.beans.EstacionDTO;
import cib.sit.interfaces.EstacionInterface;
import utils.SQLConexion;

public class EstacionDAO implements EstacionInterface{

	@Override
	public List<EstacionDTO> listarEstacionesXServicio(int COD_SERV) {
		List<EstacionDTO> lista = new ArrayList<EstacionDTO>();
		ResultSet rs = null;
		Connection con = null;
		PreparedStatement pst = null;
		try {
			con = SQLConexion.getConexion();
			String sql = "select * from TB_Estacion where COD_SERV=?";
			pst = con.prepareStatement(sql);
			pst.setInt(1, COD_SERV);
			rs = pst.executeQuery();

			while (rs.next()) {
				EstacionDTO e = new EstacionDTO();
				e.setCOD_ESTACION(rs.getString(1));
				e.setNOM_ESTACION(rs.getString(2));
				e.setCOD_SERV(rs.getInt(3));
				e.setCOD_TIPO_ESTACION(rs.getString(4));
				lista.add(e);
			}
		} catch (Exception e) {
			System.out.println("Error en la sentencia listar estación x servicio: " + e.getMessage());
		} finally {
			try {
				if (pst != null)
					pst.close();
				if (con != null)
					con.close();
			} catch (SQLException e) {
				System.out.println("Error al cerrar la sentencia listar estación x servicio: " + e.getMessage());
			}
		}
		return lista;
	}

}
