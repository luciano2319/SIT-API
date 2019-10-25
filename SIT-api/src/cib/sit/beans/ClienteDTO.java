package cib.sit.beans;

public class ClienteDTO {
	
	private String USU_CLIENTE, PASS_CLIENTE, MAIL_CLIENTE, FECH_REGISTRO_CLIENTE;
	private int ESTADO;
	public String getUSU_CLIENTE() {
		return USU_CLIENTE;
	}
	public void setUSU_CLIENTE(String uSU_CLIENTE) {
		USU_CLIENTE = uSU_CLIENTE;
	}
	public String getPASS_CLIENTE() {
		return PASS_CLIENTE;
	}
	public void setPASS_CLIENTE(String pASS_CLIENTE) {
		PASS_CLIENTE = pASS_CLIENTE;
	}
	public String getMAIL_CLIENTE() {
		return MAIL_CLIENTE;
	}
	public void setMAIL_CLIENTE(String mAIL_CLIENTE) {
		MAIL_CLIENTE = mAIL_CLIENTE;
	}
	public String getFECH_REGISTRO_CLIENTE() {
		return FECH_REGISTRO_CLIENTE;
	}
	public void setFECH_REGISTRO_CLIENTE(String fECH_REGISTRO_CLIENTE) {
		FECH_REGISTRO_CLIENTE = fECH_REGISTRO_CLIENTE;
	}
	public int getESTADO() {
		return ESTADO;
	}
	public void setESTADO(int eSTADO) {
		ESTADO = eSTADO;
	}
	
}
