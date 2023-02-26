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
    <title>Actualizar Profesor</title>

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
        <h3>Actualizar Datos de Profesor</h3>

        <c:if test="${param.modifica == null}">
            <sql:query var="profesores" dataSource="${universidad}">
                select * from profesor where id = ?
                <sql:param value="${param.id}"></sql:param>
            </sql:query>
            
            <form method="post" class="d-flex flex-column p-5 g-3 needs-validation m-3">

                <c:forEach var="itema" items="${profesores.rows}">

                    <h4>Datos:</h4>
        
                    <div class="mb-3 form-floating">
                        <input type="hidden" class="form-control" name="id" value="${itema.id}">
                    </div>
        
                    <div class="mb-3 form-floating">
                        <input type="text" class="form-control" name="cedula" placeholder="Cedula:" value="${itema.cedula}">
                        <label class="form-label p-3">Cedula: </label>
                    </div>
        
                    <div class="mb-3 form-floating">
                        <input type="text" class="form-control" name="nombres" placeholder="Nombres:" value="${itema.nombres}">
                        <label class="form-label p-3">Nombres: </label>
                    </div>
        
                    <div class="mb-3 form-floating">
                        <input type="text" class="form-control" name="area" placeholder="Area:" value="${itema.area}">
                        <label class="form-label p-3">Area: </label>
                    </div>
        
                    <div class="mb-3 form-floating">
                        <input type="text" class="form-control" name="telefono" placeholder="Telefono:" value="${itema.telefono}">
                        <label class="form-label p-3">Telefono: </label>
                    </div>
        
                    <div class="mb-3">
                        <sql:query var="rsCategoria" dataSource="${universidad}">
                            select * from categoria
                        </sql:query>
        
                        <select name="idCategoria" class="form-select form-select-lg mb-1">
                            <option value="0">Categoria</option>

                            <c:forEach var="categoria" items="${rsCategoria.rows}">

                                <option value="${categoria.id}" 
                                    <c:if test="${categoria.id == itema.idCategoria}" >
                                        selected
                                    </c:if>
                                    >
                                    <c:out value="${categoria.descripcion}" />
                                </option>
                            </c:forEach>
                        </select>

                    </div>
                </c:forEach>
                <br>
                <div class="d-flex mb-3">
                    <input type="submit" class="form-control btn-outline-dark me-4" name="modifica" value="Actualizar">
                    <input type="reset" class="form-control btn btn-dark" value="Restablecer">
                </div>
    
            </form>

        </c:if>

        <c:if test="${param.modifica != null}">
            <sql:update var="result" dataSource="${universidad}">
                update profesor
                set cedula = '${param.cedula}',
                nombres = '${param.nombres}',
                area = '${param.area}',
                telefono = '${param.telefono}',
                idCategoria = ${param.idCategoria}
                where id = ${param.id}
            </sql:update>

            <c:if test="${result == 1}">
                <div class="container d-flex flex-column justify-content-center align-items-center">

                    <div class="d-flex justify-content-center flex-column align-items-center p-3 m-3">
                        <h5>Se actualizaron los datos del Profesor de manera correcta!!</h5>
    
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

