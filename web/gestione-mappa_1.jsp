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
        <link href="static/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/dt-1.10.18/datatables.min.css"/>
        <link href="static/css/full-height.css" rel="stylesheet" type="text/css"/>
        <link href="static/css/fontawesome/fontawesome-all.css" rel="stylesheet" type="text/css"/>
        <script src="static/js/bootbox.min.js" type="text/javascript"></script>
        <script src="static/js/bootstrap.min.js" type="text/javascript"></script>
        <script type="text/javascript" src="https://cdn.datatables.net/v/dt/dt-1.10.18/datatables.min.js"></script>
        <script src="static/js/modal-forms.js" type="text/javascript"></script>
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
                </div>
            </div>
            <!--Bottoni per la gestione dei beacon e dei grafi-->
            <div class="row">
                <c:set var="quota" value="${requestScope.quota}" />
                <div class="col-md-2">
                    <button type="button" class="btn btn-secondary" style="margin-bottom: 20px">
                        <a href="ObjectAccess?obj=piano&nm=${quota}"
                           style="color: inherit; text-decoration: none">
                            < Gestione Piano</a>
                    </button>
                </div>
                <div class="col-md-2">
                    <form action="ObjectAccess" method="POST">
                        <input type="submit" value="Gestione Beacon" class="btn btn-outline-dark"
                               style="font-weight: bold">
                        <input type="hidden" name="obj" value="beacon">
                        <input type="hidden" name="nm" value="${requestScope.id_mappa}">
                    </form>
                </div>
                <div class="col-md-2">
                    <form action="ObjectAccess" method="POST">
                        <input type="submit" value="Gestione Grafo" class="btn btn-outline-dark"
                               style="font-weight: bold">
                        <input type="hidden" name="obj" value="grafo">
                        <input type="hidden" name="nm" value="${nome}">
                    </form>
                </div>
            </div>
            <br>
            
            <!--Immagine della mappa fs:990x1572-->
            <div class="row">
                <c:set var = "url_img" value = "${requestScope.url_immagine}" />
                <div class="col-md-12" style="text-align: center; margin-bottom: 20px">
                    <img src="images/${url_img}" width="990" height="1572">
                </div>
            </div>
        </div>
        
        <!-- Footer -->
        <%@include file="footer.html" %>
    </body>
</html>