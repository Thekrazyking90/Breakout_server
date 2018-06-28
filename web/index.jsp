<%-- 
    Document   : index
    Created on : 15-mag-2018, 14.29.18
    Author     : Giovanni
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="it-IT">
    <head>
        <title>Breakout - Accedi</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <link href="static/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="static/css/datatables.min.css" rel="stylesheet" type="text/css"/>
        <link href="static/css/full-height.css" rel="stylesheet" type="text/css"/>
        <link href="static/css/fontawesome/fontawesome-all.css" rel="stylesheet" type="text/css"/>
        <script src="static/js/bootbox.min.js" type="text/javascript"></script>
        <script src="static/js/bootstrap.min.js" type="text/javascript"></script>
        <script src="static/js/datatables.min.js" type="text/javascript"></script>
        <script src="static/js/jqBootstrapValidation.js" type="text/javascript"></script>
        <script src="static/js/modal-forms.js" type="text/javascript"></script>
        <script src="static/js/scroll-table.js" type="text/javascript"></script>
    </head>
    <body>
        <!-- Header -->
        <%@include file="header.jsp" %>
        
        <!-- Page Content -->
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <h1>Autenticazione</h1>
                    <br>
                    <form method="POST" action="j_security_check">
                        <p style="font-size: xx-large">Username</p>
                        <input type="text" name="j_username"  autofocus="true" size="45"
                               style="height:40px">
                        <br><br>
                        <p style="font-size: xx-large">Password</p> 
                        <input type="password" name="j_password" size="45" style=" height:40px">
                        <br><br>
                        <input type="submit" value="Accedi" class="btn btn-lg btn-outline-success"
                               style="font-weight: bold" name="accedi">
                    </form>
                </div>
            </div>
        </div>
        
        <!-- Footer -->
        <%@include file="footer.html" %>
    </body>
</html>