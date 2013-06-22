/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package upeu.rrhh.util;
import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.*;
import java.sql.SQLException;
/**
 *
 * @author JONATAN
 * 
 */
public class DataBaseConexion {
    public Statement st=null;
    public Connection Conn=null; 
    public PreparedStatement ps = null;
    public ResultSet rs = null;
    public CallableStatement cs = null;
   
    public Connection getConexion(){
          
            if (Conn==null)
            try {
                Class.forName("com.mysql.jdbc.Driver");
//                Db en el Servidor
                    Conn=(Connection)DriverManager.getConnection("jdbc:mysql://ec2-50-19-213-178.compute-1.amazonaws.com/AsistenciaCloud", "Asistencia", "123456");
//               Db local
//                    Conn=(Connection)DriverManager.getConnection("jdbc:mysql://localhost/asistencia", "root", "123456");
                    
                    System.out.println("Conexion Iniciada");
            } catch (Exception e) {
                System.out.println("DBConn.getConnection "+e.getMessage()+" Pruebe Otra Ves ");
            }

        return Conn;

        }
    
    public void closeConexion() {
    	try{
            if(st != null)
                {
                    st.close();
                }
            if(cs != null)
                {
                    cs.close();
                }
            if(rs != null)
                {
                    rs.close();
                }
            if(ps != null)
                {
                    ps.close();
                }
            if(Conn!=null) {
                Conn.close(); Conn=null; 
                
                System.out.println("Conexion Finalizada.");
        }}catch(SQLException e){
        System.out.println("ERROR! al Cerrar la Conexion :"+e);}
}
    
    public  String TriggerIdTable(String Tab,String TabId, String Pref)
    {
        String Id="";
        try {
            getConexion();
            ps=Conn.prepareStatement("SELECT (CASE WHEN MAX(CAST(SUBSTRING("+TabId+",13,4)AS UNSIGNED)) "
                    + "IS NULL THEN CAST(CONCAT(UPPER('"+Pref+"'),CURDATE()+0,'0001')AS CHAR )ELSE"
                    + " (CONCAT(CAST(CONCAT(UPPER('"+Pref+"'),CURDATE()+0)AS CHAR) , "
                    + "LPAD(MAX(CAST( SUBSTRING("+TabId+",13,4)AS UNSIGNED))+1,4,'0'))) "
                    + "END)AS idtab  FROM "+Tab+" ");            
            rs=ps.executeQuery();
            if (rs.next()) {
             Id=rs.getString("idtab");  
            }
        } catch (SQLException e) {
            System.out.println("Error Generando id table: "+e.getMessage()+" -> "+e.getLocalizedMessage());
            }finally{ closeConexion();}
    return Id;
    }
}
