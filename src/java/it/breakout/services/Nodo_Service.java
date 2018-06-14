/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package it.breakout.services;

import it.breakout.models.Nodo;
import it.breakout.models.Pdi;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author costantino
 */
public class Nodo_Service {
    
    private PreparedStatement st = null;
    private Connection conn = null;
    
    public static final String TBL_NAME = "nodo";
    public static final String FIELD_ID = "id_nodo";
    public static final String FIELD_CODICE = "codice";
    public static final String FIELD_ID_MAPPA = "id_mappa";
    public static final String FIELD_IS_PDI = "is_pdi";
    public static final String FIELD_COORD_X = "coordinata_x";
    public static final String FIELD_COORD_Y = "coordinata_y";
    public static final String FIELD_WIDTH = "larghezza";
    
    private void open() throws SQLException {
        conn = DriverManager.getConnection("jdbc:derby://localhost:1527/breakout1", "app", "app");
    }
    
    private void close() {
        try {
            if (conn != null) {
                conn.close();
            }
            if (st != null) {
                st.close();
            }
        } catch (SQLException e) {
                e.getMessage();
        }
    }
    
    public ArrayList<Nodo> findAllNodes() {
        ResultSet rs = null;
        ArrayList<Nodo> nodi = new ArrayList<>();
        try {
            open();
            
            String query = "select * from " + TBL_NAME + " where " + FIELD_IS_PDI + "=false order by codice";
            st = conn.prepareStatement(query);
            rs = st.executeQuery();
            while(rs.next()) {
                Nodo nodo = new Nodo();
                nodo.setCodice(rs.getString("codice"));
                nodo.setCoord_X(rs.getFloat("coordinata_x"));
                nodo.setCoord_Y(rs.getFloat("coordinata_y"));
                nodo.setLarghezza(rs.getFloat("larghezza"));
                nodi.add(nodo);
            }
        } 
        catch (SQLException e) {
        	e.getMessage();
        }
        finally {
            close();
        }
        
        return nodi;
    }

    public ArrayList<Pdi> findAllPois() {
        ResultSet rs = null;
        ArrayList<Pdi> pdis = new ArrayList<>();
        try {
            open();
            
            String query = "select * from " + TBL_NAME + " where " + FIELD_IS_PDI + "=true order by codice";
            st = conn.prepareStatement(query);
            rs = st.executeQuery();
            while(rs.next()) {
                Pdi pdi = new Pdi();
                pdi.setCodice(rs.getString("codice"));
                pdi.setCoord_X(rs.getFloat("coordinata_x"));
                pdi.setCoord_Y(rs.getFloat("coordinata_y"));
                pdi.setLarghezza(rs.getFloat("larghezza"));
                pdi.setTipo(rs.getString("tipo"));
                pdis.add(pdi);
            }
        } 
        catch (SQLException e) {
        	e.getMessage();
        }
        finally {
            close();
        }
        
        return pdis;
    }
    
    private Integer[] getStar_Integer(Integer id_nodo) {
        Tronco_Service troncoSrv = new Tronco_Service();
        return troncoSrv.getArcsByNode_Integer(id_nodo);
    }

    

    public Nodo findById(Integer Id){

        ResultSet rs = null;

        Nodo nodo = new Nodo();

        try {

            open();
            
            String query = "select * from " + TBL_NAME + " where " + FIELD_ID + "= ?";
            st = conn.prepareStatement(query);
            st.setInt(1, Id);
            rs = st.executeQuery();

            while(rs.next()) {
                nodo.setID(Id);
                nodo.setCodice(rs.getString(FIELD_CODICE));
                nodo.setCoord_X(rs.getFloat(FIELD_COORD_X));
                nodo.setCoord_Y(rs.getFloat(FIELD_COORD_Y));
                nodo.setID_mappa(rs.getInt(FIELD_ID_MAPPA));
                nodo.setTronchi_stella_int(getStar_Integer(Id));
                nodo.setLarghezza(rs.getFloat(FIELD_WIDTH));
            }
        } 

        catch (SQLException e) {
        	e.getMessage();
        }
        finally {
            close();
        }
       
        return nodo;
    }
    
    public ArrayList<Nodo> findByIDMappa(Integer search_id) {
        ResultSet rs = null;
        ArrayList<Nodo> nodi = new ArrayList<>();
        try {
            open();
            
            String query = "select * from " + TBL_NAME + " where " + FIELD_ID_MAPPA + "=? AND "
                    + FIELD_IS_PDI + "=false order by codice";
            st = conn.prepareStatement(query);
            st.setInt(1, search_id);
            rs = st.executeQuery();
            while(rs.next()) {
                Nodo nodo = new Nodo();
                nodo.setCodice(rs.getString("codice"));
                nodo.setCoord_X(rs.getFloat("coordinata_x"));
                nodo.setCoord_Y(rs.getFloat("coordinata_y"));
                nodo.setLarghezza(rs.getFloat("larghezza"));
                nodi.add(nodo);
            }
        } 
        catch (SQLException e) {
        	e.getMessage();
        }
        finally {
            close();
        }
        
        return nodi;
    }
    
    public ArrayList<Pdi> findPoisByIDMappa(Integer search_id) {
        ResultSet rs = null;
        ArrayList<Pdi> pdis = new ArrayList<>();
        try {
            open();
            
            String query = "select * from " + TBL_NAME + " where " + FIELD_ID_MAPPA + "=? AND "
                    + FIELD_IS_PDI + "=true order by codice";
            st = conn.prepareStatement(query);
            st.setInt(1, search_id);
            rs = st.executeQuery();
            while(rs.next()) {
                Pdi pdi = new Pdi();
                pdi.setCodice(rs.getString("codice"));
                pdi.setCoord_X(rs.getFloat("coordinata_x"));
                pdi.setCoord_Y(rs.getFloat("coordinata_y"));
                pdi.setLarghezza(rs.getFloat("larghezza"));
                pdis.add(pdi);
            }
        } 
        catch (SQLException e) {
        	e.printStackTrace();
        }
        finally {
            close();
        }
        
        return pdis;
    }
}
