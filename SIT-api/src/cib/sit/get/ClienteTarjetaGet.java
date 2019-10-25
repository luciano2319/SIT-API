package cib.sit.get;

import java.util.List;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import cib.sit.beans.ClienteTarjetaDTO;
import cib.sit.dao.ClienteTarjetaDAO;

@Path("/clienteTarjetasGet")
public class ClienteTarjetaGet {
	
	@GET
	@Path("/tarjetasCliente/{p_cliente}")
	@Produces(MediaType.APPLICATION_JSON)
	public List<ClienteTarjetaDTO> obtenerTarjetasXCliente(@PathParam("p_cliente")String COD_CLIENTE) {
		
		ClienteTarjetaDAO ctDAO= new ClienteTarjetaDAO();
		
		List<ClienteTarjetaDTO> listaTarjetas=null;
		
		listaTarjetas = ctDAO.listarTarjetasXCliente(COD_CLIENTE);
		
		if(listaTarjetas==null) {
			System.out.println("El cliente no existe");
		}
		
		return listaTarjetas;
	}

}
