package cib.sit.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import cib.sit.beans.ClienteTarjetaDTO;
import cib.sit.interfaces.ClienteTarjetaInterface;
import utils.SQLConexion;

public class ClienteTarjetaDAO implements ClienteTarjetaInterface{

	@Override
	public List<ClienteTarjetaDTO> listarTarjetasXCliente(String COD_CLIENTE) {

		List<ClienteTarjetaDTO> lista = new ArrayList<ClienteTarjetaDTO>();
		ResultSet rs = null;
		Connection con = null;
		PreparedStatement pst = null;
		try {
			con = SQLConexion.getConexion();
			String sql = "select * from TB_CLIENTE_TARJETA where USU_CLIENTE=?";
			pst = con.prepareStatement(sql);
			pst.setString(1, COD_CLIENTE);
			rs = pst.executeQuery();

			while (rs.next()) {
				ClienteTarjetaDTO ct = new ClienteTarjetaDTO();
				ct.setUSU_CLIENTE(rs.getString(1));
				ct.setCOD_TARJETA(rs.getString(2));
				lista.add(ct);
			}
		} catch (Exception e) {
			System.out.println("Error en la sentencia listar tarjetas por cliente: " + e.getMessage());
		} finally {
			try {
				if (pst != null)
					pst.close();
				if (con != null)
					con.close();
			} catch (SQLException e) {
				System.out.println("Error al cerrar la sentencia listar tarjetas por cliente: " + e.getMessage());
			}
		}
		
		return lista;
	}

}
