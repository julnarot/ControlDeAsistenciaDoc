package upeu.rrhh.dao;


import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import upeu.rrhh.model.Docente;
import upeu.rrhh.util.DataBaseConexion;

public class DocenteDAO extends DataBaseConexion{

   

    public List<Docente> Report() {
        List<Docente> docentes = new ArrayList<Docente>();
        try {
            getConexion();
             st = Conn.createStatement();
            //ResultSet rs = statement.executeQuery("INSERT INTO  facultad ( facultadid , numtel , nombre ) VALUES ( ? , ?, ? )");
            rs = st.executeQuery(" SELECT * FROM docente");

            while (rs.next()) {
                Docente docente = new Docente();
                docente.setDocenteid(rs.getString("docenteid"));
                docente.setNombres(rs.getString("nombres"));
                docente.setApellidos(rs.getString("apellidos"));
                docente.setFechanac(rs.getString("fechanac"));
                docente.setNumcelular(rs.getString("numcelular"));
                docente.setEmail(rs.getString("email"));
                docente.setSexo(rs.getString("sexo"));
                docente.setGradoac(rs.getString("gradoac"));
                docente.setDni(rs.getString("dni"));
                docente.setEstado(rs.getString("estado"));
                docentes.add(docente);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Error DocenteDAO: "+e.getMessage()+" --> "+e.getLocalizedMessage());
        }finally{closeConexion();}

        return docentes;
    }

    public void Add(Docente docente) {
        try {
            getConexion();
            ps =
                    Conn.prepareStatement(
                    "  INSERT INTO docente ( docenteid , nombres , apellidos , fechanac , numcelular"
                    + " , email , sexo , gradoac , dni , estado ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ? );");

            ps.setString(1, docente.getDocenteid());
            ps.setString(2, docente.getNombres());
            ps.setString(3, docente.getApellidos());
            ps.setString(4, docente.getFechanac());
            ps.setString(5, docente.getNumcelular());
            ps.setString(6, docente.getEmail());
            ps.setString(7, docente.getSexo());
            ps.setString(8, docente.getGradoac());
            ps.setString(9, docente.getDni());
            ps.setString(10, docente.getEstado());

            ps.executeUpdate();
            
        } catch (SQLException e) {
            e.printStackTrace();
        }finally{closeConexion();}


    }

    public String ObtenerId() {

        java.util.Date ahora = new java.util.Date();
        SimpleDateFormat formateador = new SimpleDateFormat("ddMMyyyy");
        DocenteDAO trabManager = new DocenteDAO();
        int a = trabManager.Report().size();
        return formateador.format(ahora) + "facultad" + (a + 1);

    }

    public Docente finById(String idDetallePeriodoAlumno) {
        Docente docente = new Docente();

        try {
            getConexion();
            ps = Conn.prepareStatement("select * from docente where docenteid=?");
            ps.setString(1, idDetallePeriodoAlumno);
            rs = ps.executeQuery();

            if (rs.next()) {


                docente.setDocenteid(rs.getString("docenteid"));
                docente.setNombres(rs.getString("nombres"));
                docente.setApellidos(rs.getString("apellidos"));
                docente.setFechanac(rs.getString("fechanac"));
                docente.setNumcelular(rs.getString("numcelular"));
                docente.setEmail(rs.getString("email"));
                docente.setSexo(rs.getString("sexo"));
                docente.setGradoac(rs.getString("gradoac"));
                docente.setDni(rs.getString("dni"));
                docente.setEstado(rs.getString("estado"));


            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally{closeConexion();}

        return docente;
    }
}