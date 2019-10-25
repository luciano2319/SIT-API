package cib.sit.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import java.util.ArrayList;
import java.util.List;

import cib.sit.beans.ServicioDTO;
import cib.sit.interfaces.ServicioInterface;
import utils.SQLConexion;

public class ServicioDAO implements ServicioInterface{

	@Override
	public List<ServicioDTO> listarServicios() {
		List<ServicioDTO> lista = new ArrayList<ServicioDTO>();
		ResultSet rs = null;
		Connection con = null;
		PreparedStatement pst = null;
		try {
			con = SQLConexion.getConexion();
			String sql = "select * from TB_Servicio";
			pst = con.prepareStatement(sql);
			rs = pst.executeQuery();

			while (rs.next()) {
				ServicioDTO s = new ServicioDTO();
				s.setCOD_SER(rs.getInt(1));
				s.setDESC_SERV(rs.getString(2));
				s.setTIPO_SERV(rs.getString(3));
				s.setESTADO_SERV(rs.getInt(4));
				lista.add(s);
			}
		} catch (Exception e) {
			System.out.println("Error en la sentencia listar servicio: " + e.getMessage());
		} finally {
			try {
				if (pst != null)
					pst.close();
				if (con != null)
					con.close();
			} catch (SQLException e) {
				System.out.println("Error al cerrar la sentencia listar servicio: " + e.getMessage());
			}
		}
		return lista;
	}

	
}
