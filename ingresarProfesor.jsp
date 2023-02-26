<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@include file="WEB-INF/jspf/conexion.jspf"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Agregar Profesor</title>

    <link rel="stylesheet" href="./css/estilos.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Libre+Baskerville:wght@700&family=Source+Serif+Pro&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
</head>

<body class="container d-flex flex-column justify-content-center align-items-center p-4">
    <h1>Sistema Universitario</h1>
    <h2>Agregar Profesor</h2>

    <c:if test="${param.nombres == null}">

        <form method="post" class="d-flex flex-column p-5 g-3 needs-validation m-3">

            <h4>Solicitud de datos:</h4>

            <div class="mb-3 form-floating">
                <input type="hidden" class="form-control" name="id" placeholder="Nombre Cliente:" value="${fila.id}">
            </div>

            <div class="mb-3 form-floating">
                <input type="text" class="form-control" name="cedula" placeholder="Cedula:" value="${fila.cedula}">
                <label class="form-label p-3">Cedula: </label>
            </div>

            <div class="mb-3 form-floating">
                <input type="text" class="form-control" name="nombres" placeholder="Nombres:" value="${fila.nombres}">
                <label class="form-label p-3">Nombres: </label>
            </div>

            <div class="mb-3 form-floating">
                <input type="text" class="form-control" name="area" placeholder="Area:" value="${fila.area}">
                <label class="form-label p-3">Area: </label>
            </div>

            <div class="mb-3 form-floating">
                <input type="text" class="form-control" name="telefono" placeholder="Telefono:" value="${fila.telefono}">
                <label class="form-label p-3">Telefono: </label>
            </div>

            <div class="mb-3">
                <sql:query var="rsCategoria" dataSource="${universidad}">
                    select * from categoria
                </sql:query>

                <select name="idCategoria" class="form-select form-select-lg mb-1">
                    <option value="0">Categoria</option>
                    <c:forEach var="item" items="${rsCategoria.rows}">
                        <option value="${item.id}">
                            <c:out value="${item.descripcion}"/>
                        </option>
                    </c:forEach>>
                </select>
            </div>

            <div class="d-flex mb-3">
                <input type="submit" class="form-control btn-outline-dark me-4" value="Enviar">
                <input type="reset" class="form-control btn btn-dark" value="Restablecer">
            </div>

        </form>
    </c:if>

    <c:if test="${param.nombres != null}">
        <sql:update var="result" dataSource="${universidad}">
            insert into 
            profesor (cedula, nombres, area, telefono, idCategoria)
            values ('${param.cedula}','${param.nombres}','${param.area}','${param.telefono}',${param.idCategoria})
        </sql:update>

        <c:if test="${result == 1}">
            <div class="container d-flex flex-column justify-content-center align-items-center">

                <div class="d-flex justify-content-center flex-column align-items-center p-3 m-3">
                    <h5>Se Registro el Nuevo Profesor de Manera Correcta!!</h5>

                    <div class="d-flex justify-content-around">
                        <div><br><a href="index.jsp" class="btn btn-dark">Regresar</a></div>
                    </div>
                </div>

            </div>
        </c:if>
    </c:if>

</body>

</html>