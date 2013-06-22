package upeu.rrhh.model;

public class Observacion {

    private String observacionid;
    private String descripcion;
    private String prioridadid;
    private String controlasistenciaid;

    public String getControlasistenciaid() {
        return controlasistenciaid;
    }

    public void setControlasistenciaid(String controlasistenciaid) {
        this.controlasistenciaid = controlasistenciaid;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getObservacionid() {
        return observacionid;
    }

    public void setObservacionid(String observacionid) {
        this.observacionid = observacionid;
    }

    public String getPrioridadid() {
        return prioridadid;
    }

    public void setPrioridadid(String prioridadid) {
        this.prioridadid = prioridadid;
    }
    
    
    
    
}