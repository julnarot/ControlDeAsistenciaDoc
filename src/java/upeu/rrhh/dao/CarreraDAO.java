package upeu.rrhh.dao;


import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import upeu.rrhh.model.Carrera;

import upeu.rrhh.util.DataBaseConexion;

public class CarreraDAO extends DataBaseConexion{

    

    public List<Carrera> Report() {

        List<Carrera> carreras = new ArrayList<Carrera>();

        try {

            getConexion();
            st = Conn.createStatement();
            //ResultSet rs = statement.executeQuery("INSERT INTO  facultad ( facultadid , numtel , nombre ) VALUES ( ? , ?, ? )");
            rs = st.executeQuery(" SELECT * FROM carrera");

            while (rs.next()) {


                Carrera carrera = new Carrera();
                carrera.setFacultadid(rs.getString("facultadid"));
                carrera.setNombre(rs.getString("nombre"));
                carrera.setCarreraid(rs.getString("carreraid"));


                carreras.add(carrera);
            }

           
        } catch (SQLException e) {
            e.printStackTrace();
        }finally{closeConexion();}

        return carreras;
    }

    public void Add(Carrera carrera) {
        try {
            getConexion();
            ps =Conn.prepareStatement(
                    "  INSERT INTO carrera ( carreraid , nombre , facultadid ) VALUES ( ? , ? , ? )");

            ps.setString(1, carrera.getCarreraid());
            ps.setString(2, carrera.getNombre());
            ps.setString(3, carrera.getFacultadid());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }


    }

    public String ObtenerId() {

        java.util.Date ahora = new java.util.Date();
        SimpleDateFormat formateador = new SimpleDateFormat("ddMMyyyy");
        CarreraDAO trabManager = new CarreraDAO();
        int a = trabManager.Report().size();
        return formateador.format(ahora) + "carrera" + (a + 1);

    }

    public Carrera finById(String idDetallePeriodoAlumno) {
        Carrera carrera = new Carrera();

        try {
            getConexion();
            ps = Conn.prepareStatement("select * from carrera where facultadid=?");
            ps.setString(1, idDetallePeriodoAlumno);
            rs = ps.executeQuery();

            if (rs.next()) {


                carrera.setFacultadid(rs.getString("facultadid"));
                carrera.setNombre(rs.getString("nombre"));
                carrera.setCarreraid(rs.getString("carreraid"));


            }

           
        } catch (SQLException e) {
            e.printStackTrace();
        }finally{closeConexion();}

        return carrera;
    }
}