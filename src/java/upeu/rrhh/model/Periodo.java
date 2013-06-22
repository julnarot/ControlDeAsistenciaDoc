package upeu.rrhh.model;

public class Periodo {

    private String periodoid;
    private String nombre;
    private String fechafin;
    private String fechainicio;
    private String estado;

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public String getFechafin() {
        return fechafin;
    }

    public void setFechafin(String fechafin) {
        this.fechafin = fechafin;
    }

    public String getFechainicio() {
        return fechainicio;
    }

    public void setFechainicio(String fechainicio) {
        this.fechainicio = fechainicio;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getPeriodoid() {
        return periodoid;
    }

    public void setPeriodoid(String periodoid) {
        this.periodoid = periodoid;
    }
    
    
    
    
}