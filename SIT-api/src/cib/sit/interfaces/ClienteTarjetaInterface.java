package cib.sit.interfaces;

import java.util.List;

import cib.sit.beans.ClienteTarjetaDTO;

public interface ClienteTarjetaInterface {
	
	public List<ClienteTarjetaDTO> listarTarjetasXCliente(String COD_CLIENTE);
	
}
