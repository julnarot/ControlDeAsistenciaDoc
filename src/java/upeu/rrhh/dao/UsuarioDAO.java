/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package upeu.rrhh.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import upeu.rrhh.util.DataBaseConexion;
import upeu.rrhh.model.Usuario;
/**
 *
 * @author @JONATAN
 */
public class UsuarioDAO extends DataBaseConexion{

    public List<Usuario> ValidarUser(String user,String llave)
    {
        Usuario model= new Usuario();        
        List lista=new ArrayList<Object>();
        try {
            getConexion();
            ps=Conn.prepareStatement("select * from usuario where alias=? and clave=? ");
            ps.setString(1, user);
            ps.setString(2, llave);
            rs=ps.executeQuery();
            if(rs.next()){
            model.setUsuario(rs.getString("alias"));    
            model.setClave(rs.getString("clave")); 
            model.setPagina(rs.getString("pagina")); 
            model.setUsuarioId(rs.getString("usuarioid"));          
            lista.add(model);
            }
            }catch (SQLException e) {
            System.out.println("DAO Error al Validar Usuarios : "+e.getMessage()+" -> "+e.getLocalizedMessage());
            }finally{closeConexion();
           }
        return lista;
        }
}
