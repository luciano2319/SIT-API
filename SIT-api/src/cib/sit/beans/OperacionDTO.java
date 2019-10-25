package cib.sit.beans;

public class OperacionDTO {

	private int COD_OPERACION, ESTADO;
	private String COD_TARJETA, FECHA_OPERACION, HORA_OPERACION, COD_EQUIPO, COD_PARADERO, TIPO_OPERACION,
			FECHA_HORA_CONFIRMACION, MEDIO_PAGO_OPERACION;
	private double IMPORTE;
	public int getCOD_OPERACION() {
		return COD_OPERACION;
	}
	public void setCOD_OPERACION(int cOD_OPERACION) {
		COD_OPERACION = cOD_OPERACION;
	}
	public int getESTADO() {
		return ESTADO;
	}
	public void setESTADO(int eSTADO) {
		ESTADO = eSTADO;
	}
	public String getCOD_TARJETA() {
		return COD_TARJETA;
	}
	public void setCOD_TARJETA(String cOD_TARJETA) {
		COD_TARJETA = cOD_TARJETA;
	}
	public String getFECHA_OPERACION() {
		return FECHA_OPERACION;
	}
	public void setFECHA_OPERACION(String fECHA_OPERACION) {
		FECHA_OPERACION = fECHA_OPERACION;
	}
	public String getHORA_OPERACION() {
		return HORA_OPERACION;
	}
	public void setHORA_OPERACION(String hORA_OPERACION) {
		HORA_OPERACION = hORA_OPERACION;
	}
	public String getCOD_EQUIPO() {
		return COD_EQUIPO;
	}
	public void setCOD_EQUIPO(String cOD_EQUIPO) {
		COD_EQUIPO = cOD_EQUIPO;
	}
	public String getCOD_PARADERO() {
		return COD_PARADERO;
	}
	public void setCOD_PARADERO(String cOD_PARADERO) {
		COD_PARADERO = cOD_PARADERO;
	}
	public String getTIPO_OPERACION() {
		return TIPO_OPERACION;
	}
	public void setTIPO_OPERACION(String tIPO_OPERACION) {
		TIPO_OPERACION = tIPO_OPERACION;
	}
	public String getFECHA_HORA_CONFIRMACION() {
		return FECHA_HORA_CONFIRMACION;
	}
	public void setFECHA_HORA_CONFIRMACION(String fECHA_HORA_CONFIRMACION) {
		FECHA_HORA_CONFIRMACION = fECHA_HORA_CONFIRMACION;
	}
	public String getMEDIO_PAGO_OPERACION() {
		return MEDIO_PAGO_OPERACION;
	}
	public void setMEDIO_PAGO_OPERACION(String mEDIO_PAGO_OPERACION) {
		MEDIO_PAGO_OPERACION = mEDIO_PAGO_OPERACION;
	}
	public double getIMPORTE() {
		return IMPORTE;
	}
	public void setIMPORTE(double iMPORTE) {
		IMPORTE = iMPORTE;
	}
	
	

}
