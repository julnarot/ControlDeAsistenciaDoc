/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package upeu.rrhh.model;

/**
 *
 * @author @JONATAN
 */
public class Usuario {
   String UsuarioId,Usuario,Clave,foto,Pagina,EnCargadoId;

    public String getClave() {
        return Clave;
    }

    public void setClave(String Clave) {
        this.Clave = Clave;
    }

    public String getEnCargadoId() {
        return EnCargadoId;
    }

    public void setEnCargadoId(String EnCargadoId) {
        this.EnCargadoId = EnCargadoId;
    }

    public String getPagina() {
        return Pagina;
    }

    public void setPagina(String Pagina) {
        this.Pagina = Pagina;
    }

    public String getUsuario() {
        return Usuario;
    }

    public void setUsuario(String Usuario) {
        this.Usuario = Usuario;
    }

    public String getUsuarioId() {
        return UsuarioId;
    }

    public void setUsuarioId(String UsuarioId) {
        this.UsuarioId = UsuarioId;
    }

    public String getFoto() {
        return foto;
    }

    public void setFoto(String foto) {
        this.foto = foto;
    }

}
