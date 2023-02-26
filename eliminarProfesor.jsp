<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@include file="WEB-INF/jspf/conexion.jspf"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Eliminar Profesor</title>

    <link rel="stylesheet" href="./css/estilos.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Libre+Baskerville:wght@700&family=Source+Serif+Pro&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
</head>

<body class="container d-flex flex-column justify-content-center align-items-center p-4">

    <main class="container d-flex flex-column justify-content-center align-items-center p-4">
        <h1>Sistema Universitario</h1>
        <h3>Eliminar Datos de Profesor</h3>

        <c:if test="${param.id != null}" >
            <sql:update var="result" dataSource="${universidad}">
                delete from profesor
                where id = ${param.id}
            </sql:update>

            <c:if test="${result == 1}">
                <div class="container d-flex flex-column justify-content-center align-items-center">

                    <div class="d-flex justify-content-center flex-column align-items-center p-3 m-3">
                        <h5>Los datos se eliminaron correctamente!!</h5>
    
                        <div class="d-flex justify-content-around">
                            <div><br><a href="index.jsp" class="btn btn-dark">Regresar</a></div>
                        </div>
                    </div>
    
                </div>
            </c:if>
        </c:if>

    </main>    
</body>

</html>