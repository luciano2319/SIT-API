package cib.sit.get;

import java.util.List;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import cib.sit.beans.EstacionDTO;
import cib.sit.dao.EstacionDAO;

@Path("/estacionesGet")
public class EstacionGet {
	
	@GET
	@Path("/estaciones/{p_codServ}")
	@Produces(MediaType.APPLICATION_JSON)
	public List<EstacionDTO> obtenerEstacionesXServicio(@PathParam("p_codServ")int COD_SERV) {
		
		EstacionDAO eDAO= new EstacionDAO();
		
		List<EstacionDTO> listaEstaciones=null;
		
		listaEstaciones = eDAO.listarEstacionesXServicio(COD_SERV);
		
		if(listaEstaciones==null) {
			System.out.println("El servicio no existe");
		}
		
		return listaEstaciones;
	}

}
