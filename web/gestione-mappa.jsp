<%-- 
    Document   : gestione-mappa
    Created on : 23-mag-2018, 17.56.17
    Author     : Giovanni
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>

<!DOCTYPE html>
<html lang="it-IT">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Breakout - Gestione Mappa</title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <link rel="stylesheet" href="static/bootstrap-4.1.1-dist/css/bootstrap-grid.css" type="text/css">
        <link rel="stylesheet" href="static/bootstrap-4.1.1-dist/css/bootstrap-grid.min.css" type="text/css">
        <link rel="stylesheet" href="static/bootstrap-4.1.1-dist/css/bootstrap-reboot.css" type="text/css">
        <link rel="stylesheet" href="static/bootstrap-4.1.1-dist/css/bootstrap-reboot.min.css" type="text/css">
        <link rel="stylesheet" href="static/bootstrap-4.1.1-dist/css/bootstrap.css" type="text/css">
        <link rel="stylesheet" href="static/bootstrap-4.1.1-dist/css/bootstrap.min.css" type="text/css">
        <link rel="stylesheet" href="static/fontawesome/fontawesome-all.css">
        <link rel="stylesheet" href="static/full-height.css" type="text/css">
        <script src="static/bootstrap-4.1.1-dist/js/bootstrap.bundle.js"></script>
        <script src="static/bootstrap-4.1.1-dist/js/bootstrap.bundle.min.js"></script>
        <script src="static/bootstrap-4.1.1-dist/js/bootstrap.js"></script>
        <script src="static/bootstrap-4.1.1-dist/js/bootstrap.min.js"></script>
        <script src="static/bootstrap-4.1.1-dist/js/bootbox.min.js"></script>
    </head>
    <body>
        <!-- Header -->
        <%@include file="header.jsp" %>

        <!-- Page Content -->
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <c:set var="nome" value="${requestScope.nome}" />
                    <h2>Gestione Mappa ${nome}</h2>
                    <br>
                    <br>
                    <!--Bottoni per la gestione dei beacon e dei grafi-->
                    <div class="row">
                        <div class="col-md-6">
                            <form action="ObjectAccess" method="POST">
                                <input type="submit" value="Gestione Beacon" class="btn btn-outline-dark"
                                       style="font-weight: bold">
                                <input type="hidden" name="obj" value="beacon">
                                <input type="hidden" name="nm" value="${requestScope.id_mappa}">
                            </form>
                        </div>
                        <div class="col-md-6" style="text-align: right">
                            <form action="ObjectAccess" method="POST">
                                <input type="submit" value="Gestione Grafo" class="btn btn-outline-dark"
                                       style="font-weight: bold">
                                <input type="hidden" name="obj" value="grafo">
                                <input type="hidden" name="nm" value="${nome}">
                            </form>
                        </div>
                    </div>
                    <br><br>
                    <!--Tabella dei beacon e dei tronchi presenti nella mappa-->
                    <table class="table table-bordered table-striped" style="text-align: center">
                        <thead>
                            <tr><th>Nome beacon</th><th>Codice Tronco/codice PDI</th></tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${requestScope.al_beacon}" var="beacon">
                                <c:set var="id_beacon" value="${beacon.getID_beacon()}"/>
                                <tr><td>Beacon B${id_beacon}</td><td><i>Codice tronco</i></td></tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    <div style="text-align: right">
                        <button  id="agg-collegamento" type="button" class="btn btn-outline-success"
                                 data-toggle="modal" data-target="#agg-coll">
                            <b>Aggiungi collegamento</b></button>
                    </div>
                    <c:set var="quota" value="${requestScope.quota}" />
                    <div class="row">
                        <div class="col-md-6">
                            <button type="button" class="btn btn-secondary">
                                <a href="ObjectAccess?obj=piano&nm=${quota}"
                                   style="color: inherit; text-decoration: none">
                                    < Gestione Piano</a>
                            </button>
                        </div>
                    </div>
                </div>
                <!--Immagine dell mappa fs:990x1572-->
                <c:set var = "nome_img" value = "${fn:replace(requestScope.nome, '/', '-')}" />
                <div class="col-md-4" >  
                    <img src="/Immagini/${nome_img}.jpg" width="396" height="630">
                </div>
            </div>
            
            
        </div>
        
        <!-- Finestra popup aggiungi collegamento-->
        <div id="agg-coll" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Aggiungi Collegamento</h5>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <div class="modal-body">
                        <div class="col-md-12">
                            <p class="warning">
                                Devono essere compilati tutti i campi, altrimenti l'inserimento
                                non verrà portato a termine.</p>
                        </div>
                        <div class="col-md-12">
                            <form>
                                <!-- Selezione beacon e tronchi che devono essere collegati-->
                                <table class='table table-borderless'>
                                    <tr><td>Seleziona il beacon:</td>
                                        <td><select name='nome-beacon'>
                                            <option selected disabled hidden>Seleziona</option>
                                            <option>Beacon B1</option>
                                            <option>Beacon B2</option>
                                            <option>Beacon B3</option>
                                            <option>Beacon B4</option>
                                            <option>Beacon B5</option>
                                            <option>Beacon B4</option>
                                            <option>Beacon B5</option>
                                            </select></td></tr>
                                    <tr><td>Seleziona il tronco:</td>
                                        <td><select name='codice-tronco'>
                                            <option selected disabled hidden>Seleziona</option>
                                            <option>T150N1</option>
                                            <option>T150N2</option>
                                            <option>T150N3</option>
                                            <option>T150N4</option>
                                            <option>T150N5</option>
                                            </select></td></tr>
                                </table>
                                <div class="modal-footer">
                                <!-- Bottoni per tornare alla schermata precedente o per aggiornare le modifiche-->
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">
                                        Annulla
                                    </button>
                                    <input class="btn btn-outline-success" type='submit' 
                                        style="font-weight: bold" value='Aggiungi collegamento' name='aggiungi-collegamento'>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <!-- Footer -->
        <%@include file="footer.html" %>
    </body>
</html>