package cib.sit.interfaces;

import java.util.List;

import cib.sit.beans.EstacionDTO;

public interface EstacionInterface {
	
	public List<EstacionDTO> listarEstacionesXServicio(int COD_SERV);
		
}
