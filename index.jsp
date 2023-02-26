
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@include file="WEB-INF/jspf/conexion.jspf"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="Content-Type" content="text/html">
        <title>Sistema Universitario</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">


        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Libre+Baskerville:wght@700&family=Source+Serif+Pro&display=swap" rel="stylesheet">

    </head>

    <body class="container d-flex flex-column justify-content-center align-items-center">

        <br>
        <h1><center> Sistema Universitario </center></h1>
        <h2><center> Datos de profesores </center></h2>
        <br>

        <sql:query var="result" scope="request" dataSource="${universidad}">
            select profesor.id, profesor.cedula as cedula, profesor.nombres as nombres, profesor.area as area, profesor.telefono as telefono,
            categoria.descripcion as descripcion
            from profesor
            left join categoria
            on profesor.idCategoria=categoria.id; 
        </sql:query>

        <div class="container p-2">
            <table border="1" class="table table-striped">
                <thead>
                    <tr>
                        <th>Cedula</th>
                        <th>Nombre</th>
                        <th>Area</th>
                        <th>Telefono</th>
                        <th>Categoria</th>
                        <th colspan="2"> Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="fila" items="${result.rows}">
                        <tr>
                            <td> <c:out value="${fila.cedula}"/> </td>
                            <td> <c:out value="${fila.nombres}"/> </td>
                            <td> <c:out value="${fila.area}"/> </td>
                            <td> <c:out value="${fila.telefono}"/> </td>
                            <td> <c:out value="${fila.descripcion}"/> </td>
                            <td>
                                <a href="eliminarProfesor.jsp?id=${fila.id}">
                                    <i class="material-icons">&#xE92B;</i>
                                </a>
                                <a href="actualizarProfesor.jsp?id=${fila.id}" >
                                    <i class="material-icons">&#xE254;</i>
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
    
            <div class="d-flex justify-content-around">
                <div><br><a href="ingresarProfesor.jsp" class="btn btn-dark">Nuevo Profesor</a></div>
    
            </div>
        </div>

    </body>
</html>