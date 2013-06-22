package upeu.rrhh.dao;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import upeu.rrhh.model.Curso;
import upeu.rrhh.util.DataBaseConexion;

public class CursoDAO extends DataBaseConexion{

 

    public List<Curso> Report() {

        List<Curso> cursos = new ArrayList<Curso>();

        try {

            getConexion();
            st = Conn.createStatement();
            rs = st.executeQuery(" SELECT * FROM curso");

            while (rs.next()) {


                Curso curso = new Curso();

                curso.setCursoid(rs.getString("cursoid"));
                curso.setCodigo(rs.getString("codigo"));
//                curso.setNumcreditos(rs.getString("numcreditos"));
                curso.setNumhoras(rs.getString("numhoras"));
                curso.setNombre(rs.getString("nombre"));

                cursos.add(curso);
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Error reporte Cursos: "+e.getMessage()+" -> "+e.getLocalizedMessage());
        }finally{closeConexion();}

        return cursos;
    }

    public void Add(Curso curso) {
        try {
            getConexion();
            ps=Conn.prepareStatement(
                    "  INSERT INTO curso ( cursoid , codigo , numcreditos , numhoras , nombre  ) VALUES (?, ?, ?, ?, ? ) ");

            ps.setString(1, curso.getCursoid());
            ps.setString(2, curso.getCodigo());
            ps.setString(3, curso.getNumcreditos());
            ps.setString(4, curso.getNumhoras());
            ps.setString(5, curso.getNombre());


            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }finally{closeConexion();}


    }

    public String ObtenerId() {

        java.util.Date ahora = new java.util.Date();
        SimpleDateFormat formateador = new SimpleDateFormat("ddMMyyyy");
        CursoDAO trabManager = new CursoDAO();
        int a = trabManager.Report().size();
        return formateador.format(ahora) + "curso" + (a + 1);

    }

    public Curso finById(String idDetallePeriodoAlumno) {
        Curso curso = new Curso();
        try {
            getConexion();
            ps = Conn.prepareStatement("select * from curso where cursoid=?");
            ps.setString(1, idDetallePeriodoAlumno);
            rs = ps.executeQuery();

            if (rs.next()) {



                curso.setCursoid(rs.getString("cursoid"));
                curso.setCodigo(rs.getString("codigo"));
                curso.setNumcreditos(rs.getString("numcreditos"));
                curso.setNumhoras(rs.getString("numhoras"));
                curso.setNombre(rs.getString("nombre"));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }finally{closeConexion();}

        return curso;
    }
}