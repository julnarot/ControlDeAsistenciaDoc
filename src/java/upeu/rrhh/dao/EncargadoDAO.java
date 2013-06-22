package upeu.rrhh.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import upeu.rrhh.model.Encargado;
import upeu.rrhh.util.DataBaseConexion;

public class EncargadoDAO extends DataBaseConexion{
    
    public List<Encargado> ReportEncargados()
    {
        List<Encargado> report= new ArrayList<Encargado>();        
        Encargado datos=null;
        try {
            getConexion();
            ps=Conn.prepareStatement("SELECT * FROM encargado");
            rs=ps.executeQuery();
            while (rs.next()) {                
                datos= new Encargado();
                datos.setEncargadoId(rs.getString("encargadoid"));
                datos.setNombre(rs.getString("nombre"));
                datos.setApellido(rs.getString("apellidos"));
                datos.setEmail(rs.getString("email"));
                datos.setNumtel(rs.getString("numtel"));                
                    report.add(datos);
            }
        } catch (SQLException e) {
            System.out.println("Error al Reportar Encargados "+e.getMessage()+" -> "+e.getLocalizedMessage());
            }
    finally{ closeConexion();}
        return report;
        }
     public boolean  insertarEncargado(Encargado dato){
    String sql="INSERT INTO encargado(encargadoid,numtel,email,apellidos,nombre)VALUES(?,?,?,?,?)";
    int i=0;
    String idN=TriggerIdTable("encargado", "encargadoid", "enca");
    /* TriggerIdTable("encargado", "encargadoid", "ENC") ;
    Donde:
    encargado->nombre real de la tabla
    encargadoid->nombre de pk columna real de la tabla (id)
    ENC-> prefijo si y solo si de 4 digitos no importa */
    try {
       getConexion();      
       ps=Conn.prepareStatement(sql);
       ps.setString(++i, idN);
       ps.setString(++i, dato.getNumtel());
       ps.setString(++i, dato.getEmail());
       ps.setString(++i, dato.getApellido());
       ps.setString(++i, dato.getNombre());
       return ps.executeUpdate()==1;       
    } catch (SQLException e) { 
        System.out.println("Error al insertar Encargado :"+e.getMessage()+" -> "+e.getLocalizedMessage());
        e.getMessage();}
    finally{ closeConexion();}
    return  false;
    }
 
}
