/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package upeu.rrhh.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import upeu.rrhh.model.Cargadocente;
import upeu.rrhh.util.DataBaseConexion;
/**
 *
 * @author JONATAN
 */
public class CargadocenteDAO extends DataBaseConexion{
    public List<Cargadocente> ReporteCargaDocente()
    {
        List<Cargadocente> report= new ArrayList<Cargadocente>();        
        Cargadocente datos=null;
        try {
            getConexion();
            ps=Conn.prepareStatement("SELECT cd.cargadocenteid,dc.gradoac,dc.nombres,dc.apellidos,cu.nombre AS curso,cu.numhoras AS horas,numcredito,gr.nombre AS grupo,gr.ciclo AS ciclo,cr.nombre AS carrera FROM cargadocente cd,curso cu,periodo pe,grupo gr,docente dc,carrera cr WHERE cu.cursoid=cd.cursoid AND pe.periodoid=cd.periodoid AND gr.grupoid=cd.grupoid AND cr.carreraid=gr.carreraid AND dc.docenteid=cd.docenteid");
            rs=ps.executeQuery();
            while (rs.next()) {                
                datos= new Cargadocente();
                datos.setCargadocenteId(rs.getString("cargadocenteid"));
                datos.setNombres(rs.getString("nombres"));
                datos.setApellidos(rs.getString("apellidos"));
                datos.setGradoAc(rs.getString("gradoac"));
                datos.setCurso(rs.getString("curso"));
                datos.setHoras(rs.getString("horas"));
                datos.setCreditos(rs.getString("numcredito"));
                datos.setEap(rs.getString("carrera"));
                datos.setCiclo(rs.getString("ciclo"));
                datos.setGrupo(rs.getString("grupo"));
                    report.add(datos);
            }
        } catch (SQLException e) {
            System.out.println("Error al Reportar Carga Docente: "+e.getMessage()+" -> "+e.getLocalizedMessage());
            }
        return report;
        }
     public boolean  insertarCargadocente(Cargadocente dato){
    String sql="INSERT INTO cargadocente(cargadocenteid,docenteid,cursoid,periodoid,grupoid,estado,fechaalta) VALUES (?,?,?,?,?,'1',NOW())";
    int i=0;
   String IdC=TriggerIdTable("cargadocente", "cargadocenteid", "CADO") ;
    try {
       getConexion();      
       ps=Conn.prepareStatement(sql);
       ps.setString(++i, IdC);
       ps.setString(++i, dato.getDocenteId());
       ps.setString(++i, dato.getCursoId());
       ps.setString(++i, dato.getPeriodoId());
       ps.setString(++i, dato.getGrupoId());
//       ps.setString(++i, dato.getCADestado());
//       ps.setString(++i, dato.getCADfechaAlta());
       
       return ps.executeUpdate()==1;       
    } catch (SQLException e) { 
        System.out.println("Error al insertar Carga Docente :"+e.getMessage()+" -> "+e.getLocalizedMessage());
        e.getMessage();}
    finally{ closeConexion();}
    return  false;
}


     
     public List<Cargadocente> ReporteCargaDocenteID( String ids)
    {
        List<Cargadocente> report= new ArrayList<Cargadocente>();        
        Cargadocente datos=null;
        try {
            getConexion();
            ps=Conn.prepareStatement("SELECT cd.cargadocenteid,dc.gradoac,dc.nombres,dc.apellidos,cu.nombre AS curso,cu.numhoras AS horas,numcredito,ci.nombre AS ciclo,ci.grupo,cr.nombre AS carrera FROM cargadocente cd,curso cu,periodo pe,ciclo ci,docente dc,carrera cr WHERE cu.cursoid=cd.cursoid AND pe.periodoid=cd.periodoid AND ci.cicloid=cd.cicloid AND cr.carreraid=ci.carreraid AND dc.docenteid=cd.docenteid");
            rs=ps.executeQuery();
            while (rs.next()) {                
                datos= new Cargadocente();
                datos.setCargadocenteId(rs.getString("cargadocenteid"));
                datos.setNombres(rs.getString("nombres"));
                datos.setApellidos(rs.getString("apellidos"));
                datos.setGradoAc(rs.getString("gradoac"));
                datos.setCurso(rs.getString("curso"));
                datos.setHoras(rs.getString("horas"));
                datos.setCreditos(rs.getString("numcredito"));
                datos.setEap(rs.getString("carrera"));
                datos.setCiclo(rs.getString("ciclo"));
                datos.setGrupo(rs.getString("grupo"));
                    report.add(datos);
            }
        } catch (SQLException e) {
            System.out.println("Error al Reportar Carga Docente: "+e.getMessage()+" -> "+e.getLocalizedMessage());
            }
        return report;
        }
}
