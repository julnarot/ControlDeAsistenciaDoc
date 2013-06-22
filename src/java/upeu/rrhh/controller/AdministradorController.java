/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package upeu.rrhh.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import upeu.rrhh.dao.*;
import upeu.rrhh.model.*;


/**
 *
 * @author User07
 */
@WebServlet(name = "AdministradorController", urlPatterns = {"/AdministradorController"})
public class AdministradorController extends HttpServlet {

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int opt = Integer.parseInt(request.getParameter("opt"));
        System.out.println("#:"+opt);
        FacultadDAO facultaManag = new FacultadDAO();
        List<Facultad> listFacultad = new ArrayList<Facultad>();
        Facultad facultad = new Facultad();

        CarreraDAO carrercaManag = new CarreraDAO();
        List<Carrera> listCarrera = new ArrayList<Carrera>();
        Carrera carrera = new Carrera();

        DocenteDAO docenteManag = new DocenteDAO();
        List<Docente> listDocente = new ArrayList<Docente>();
        Docente docente = new Docente();

        CursoDAO cursoMang = new CursoDAO();
        List<Curso> listCurso = new ArrayList<Curso>();
        Curso curso = new Curso();
        //     Objetos y metodos de carga docente 
        CargadocenteDAO CarDocMang=new CargadocenteDAO();
        List<Cargadocente> ListCarDoc = new ArrayList<Cargadocente>();
        Cargadocente carDocModelo=new Cargadocente();
        //Encargado dao y objetos
        EncargadoDAO EncarDAO=new EncargadoDAO();
        Encargado EncargaMOD=new Encargado();
        List<Encargado> ListEncarg = new ArrayList<Encargado>();
        switch (opt) {

            case 1: {

                listFacultad = facultaManag.Report();
                request.getSession().setAttribute("ListFacultad", listFacultad);
                response.sendRedirect("modulos/administrador/contenido/administrador_facultad_report.jsp");

            }
            break;
            case 2: {
                response.sendRedirect("modulos/administrador/contenido/administrador_facultad_form_add.jsp");
            }
            break;
            case 3: {

                facultad.setFacultadid(facultaManag.ObtenerId());
                facultad.setNombre(request.getParameter("nombre"));
                facultad.setNumtel(request.getParameter("numtel"));

                facultaManag.Add(facultad);

                listFacultad = facultaManag.Report();
                request.getSession().setAttribute("ListFacultad", listFacultad);
                response.sendRedirect("modulos/administrador/contenido/administrador_facultad_report.jsp");
            }
            break;

            /*
             * Accions for Carrera and others
             */

            case 4: {
                listCarrera = carrercaManag.Report();
                request.getSession().setAttribute("ListCarrera", listCarrera);

                response.sendRedirect("modulos/administrador/contenido/administrador_carrera_report.jsp");

            }
            break;

            case 5: {
                listFacultad = facultaManag.Report();
                request.getSession().setAttribute("ListFacultad", listFacultad);
                response.sendRedirect("modulos/administrador/contenido/administrador_carrera_form_add.jsp");
            }
            break;
            case 6: {

                carrera.setCarreraid(carrercaManag.ObtenerId());
                carrera.setNombre(request.getParameter("nombre"));
                carrera.setFacultadid(request.getParameter("facultadId"));
                carrercaManag.Add(carrera);

                listCarrera = carrercaManag.Report();
                request.getSession().setAttribute("ListCarrera", listCarrera);

                response.sendRedirect("modulos/administrador/contenido/administrador_carrera_report.jsp");
            }
            break;

            /*
             * Accions for Docente and others
             */

            case 7: {

                listDocente = docenteManag.Report();
                request.getSession().setAttribute("ListDocente", listDocente);
                response.sendRedirect("modulos/administrador/contenido/administrador_docente_report.jsp");
            }
            break;
            case 8: {

                response.sendRedirect("modulos/administrador/contenido/administrador_docente_form_add.jsp");
            }
            break;

            case 9: {
                docente.setDocenteid(docenteManag.ObtenerId());
                docente.setNombres(request.getParameter("nombres"));
                docente.setApellidos(request.getParameter("apellidos"));
                docente.setFechanac(request.getParameter("fechanac"));
                docente.setNumcelular(request.getParameter("numcelular"));
                docente.setEmail(request.getParameter("email"));
                docente.setSexo(request.getParameter("sexo"));
                docente.setGradoac(request.getParameter("gradoac"));
                docente.setDni(request.getParameter("dni"));
                docente.setEstado("Activo");

                docenteManag.Add(docente);


                listDocente = docenteManag.Report();
                request.getSession().setAttribute("ListDocente", listDocente);

                response.sendRedirect("modulos/administrador/contenido/administrador_docente_report.jsp");

            }
            break;


            /*
             * Accions for Cursos and others
             */
            case 10: {
                listCurso = cursoMang.Report();
                request.getSession().setAttribute("ListCurso", listCurso);
                response.sendRedirect("modulos/administrador/contenido/administrador_curso_report.jsp");
            }
            break;
            case 11: {
                response.sendRedirect("modulos/administrador/contenido/administrador_curso_form_add.jsp");
            }
            break;
            case 12: {
                curso.setCursoid(cursoMang.ObtenerId());
                curso.setCodigo(request.getParameter("codigo"));
                curso.setNumcreditos(request.getParameter("numcreditos"));
                curso.setNumhoras(request.getParameter("numhoras"));
                curso.setNombre(request.getParameter("nombre"));
                cursoMang.Add(curso);
                listCurso = cursoMang.Report();
                request.getSession().setAttribute("ListCurso", listCurso);
                response.sendRedirect("modulos/administrador/contenido/administrador_curso_report.jsp");
                
                
            }
            break;
                /*
             * Accions for Carga Docente  and others
             */
                
                case 13:{
                ListCarDoc=CarDocMang.ReporteCargaDocente();
                request.getSession().setAttribute("ListCargaDocente", ListCarDoc);
                response.sendRedirect("modulos/administrador/contenido/administrador_carga_docente_report.jsp");                
                }
               break;
               case 14:{
                CargadocenteDAO cardoc=new CargadocenteDAO();
                Cargadocente dt=new Cargadocente();
                dt.setCargadocenteId(request.getParameter("CargaDocenteIDJ"));
                dt.setDocenteId(request.getParameter("DocenteIDJ"));
                dt.setCursoId(request.getParameter("CursoIDJ"));
                dt.setGrupoId(request.getParameter("GrupoIDJ"));
                dt.setPeriodoId(request.getParameter("PeriodoIDJ"));
                cardoc.insertarCargadocente(dt);
                    
                ListCarDoc=CarDocMang.ReporteCargaDocente();
                request.getSession().setAttribute("ListCargaDocente", ListCarDoc);
                response.sendRedirect("modulos/administrador/contenido/administrador_carga_docente_report.jsp");                   
                }
               break; 
                   /*
             * Accions for Encargado  and others
             */
                 case 40:{
                EncarDAO=new EncargadoDAO();
                EncargaMOD=new Encargado();
//                EncargaMOD.setEncargadoId(request.getParameter("CargaDocenteIDJ"));
                EncargaMOD.setNombre(request.getParameter("NombresJ"));
                EncargaMOD.setApellido(request.getParameter("ApellidosJ"));
                EncargaMOD.setEmail(request.getParameter("EmailJ"));
                EncargaMOD.setNumtel(request.getParameter("NumTelJ"));
                EncarDAO.insertarEncargado(EncargaMOD);
                
                ListEncarg=EncarDAO.ReportEncargados();
                request.getSession().setAttribute("ListEncargados",ListEncarg);
                response.sendRedirect("modulos/administrador/contenido/administrador_encargado_report.jsp");                 
                }
               break; 
                case 41:{
                ListEncarg=EncarDAO.ReportEncargados();
                request.getSession().setAttribute("ListEncargados",ListEncarg);
                response.sendRedirect("modulos/administrador/contenido/administrador_encargado_report.jsp"); 
                }
               break; 
        }


    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
