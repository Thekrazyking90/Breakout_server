/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package it.breakout.models;

import java.util.ArrayList;

import it.breakout.resources.NodoResource;
import it.breakout.resources.BeaconResource;

/**
 *
 * @author costantino
 */
public class Scala {
    protected Integer ID;
    private double larghezza_media;
    private double lunghezza;
    private Integer[] nodi_int;
    private ArrayList<Nodo> nodi;
    private Beacon beacon;
    private Integer ID_beacon;
    private float costo_totale;
    protected String codice;

    public Scala() {
        nodi_int = new Integer[2]; 
    }
    
    public Integer otherNode (Integer id){
        Integer other = null;
        Integer[] nodi = this.getNodiInteger();
        if (id==nodi[0]){
            other=nodi[1];
        }else{
            other=nodi[0];
        }
        return other;
    }

    public Integer[] getNodiInteger() {
        return nodi_int;
    }
    
    public String[] getCodiciNodi() {
        
        String[] codici = new String[2];
        NodoResource nodo_resource = new NodoResource();
        
        codici[0] = nodo_resource.findByID(this.nodi_int[0]).getCodice();
        codici[1] = nodo_resource.findByID(this.nodi_int[1]).getCodice();

        return codici;
    }

    public void setNodiInteger(Integer nodo_1, Integer nodo_2) {
        nodi_int[0] = nodo_1;
        nodi_int[1] = nodo_2;
    }

    public ArrayList<Nodo> getNodi() {
        return nodi;
    }

    public void setNodi(ArrayList<Nodo> nodi) {
        this.nodi = nodi;
    }
    
    public Integer getID() {
        return ID;
    }

    public void setID(Integer ID) {
        this.ID = ID;
    }

    public double getLarghezza_media() {
        return larghezza_media;
    }

    public void setLarghezza_media(double larghezza_media) {
        this.larghezza_media = larghezza_media;
    }

    public double getLunghezza() {
        return lunghezza;
    }

    public void setLunghezza(double lunghezza) {
        this.lunghezza = lunghezza;
    }
    
    public Integer getID_beacon() {
        return ID_beacon;
    }

    public void setID_beacon(Integer ID_beacon) {
        this.ID_beacon = ID_beacon;
    }

    public String getCodiceBeacon() {
        
        BeaconResource beacon_resource = new BeaconResource();
        
        return beacon_resource.findByID(this.ID_beacon).getCodice();
    }
    
    public Beacon getBeacon() {
        return beacon;
    }

    public void setBeacon(Beacon beacon) {
        this.beacon = beacon;
    }

    public float getCosto_totale() {
        return costo_totale;
    }

    public void setCosto_totale(float costo_totale) {
        this.costo_totale = costo_totale;
    }
    
    public String getCodice() {
        return codice;
    }
    
    public void setCosto_totale() {
        double LOS = larghezza_media * lunghezza / beacon.getInd_NDC();
        costo_totale = (float) (LOS + beacon.getInd_rischio() + beacon.getInd_fumi() + beacon.getInd_fuoco());
    }

    public void setLarghezza_media() {
        setNodi();
        this.larghezza_media = (nodi.get(0).getLarghezza() + nodi.get(1).getLarghezza()) / 2;
    }

    private void setNodi() {
        NodoResource nodoSrv = new NodoResource();
        nodi.add(nodoSrv.findByID(nodi_int[0]));
        nodi.add(nodoSrv.findByID(nodi_int[1]));
    }
    
    public void setCodice() {
        codice = "S" + ID;
    }
    
}
