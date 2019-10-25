package cib.sit.interfaces;

import java.util.List;

import cib.sit.beans.OperacionDTO;

public interface OperacionInterface {
	
	public List<OperacionDTO> listarOperacionesXTarjeta(String COD_TARJETA);
	
}
