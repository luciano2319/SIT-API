package cib.sit.get;

import java.util.List;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import cib.sit.beans.ServicioDTO;
import cib.sit.dao.ServicioDAO;


@Path("/serviciosGet")
public class ServicioGet {
	
	@GET
	@Path("/servicios")
	@Produces(MediaType.APPLICATION_JSON)
	public List<ServicioDTO> obtenerGrupo() {
		System.out.println("Entró al método listar servicios");
		//simular acceso de datos
		ServicioDAO sDAO= new ServicioDAO();
		
		List<ServicioDTO> lista=sDAO.listarServicios();
		
		return lista;
	}


}
