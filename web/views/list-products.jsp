<%--
  Created by IntelliJ IDEA.
  User: MILIARI Adnane
  Date: 26/01/2021
  Time: 20:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Products</title>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link type="text/css" rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootswatch/4.5.2/sketchy/bootstrap.min.css">
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.23/css/jquery.dataTables.min.css"/>
</head>

<body>
<%@include file="nav.jsp" %>
<div class="container">
    <div class="row">
        <div class="col-12">

            <a class="btn btn-info mt-5 mb-2 text-white" type="button" onclick="window.location.href='add'">
                <i class="fas fa-shopping-bag"></i>
                Add New Product
            </a>
            <table class="table rounded table-bordered mb-2" id="tableProduct">
                <thead>
                <tr>
                    <th class="text-dark">Photo</th>
                    <th class="text-dark">Title</th>
                    <th class="text-dark">Description</th>
                    <th class="text-dark">Price</th>                   
                    <th class="text-dark">Actions</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="productInfo" items="${products}">
                    
                    <c:url var="deleteLink" value="/product/delete">
                        <c:param name="productId" value="${productInfo.id}" />
                    </c:url>
                    <tr>
                        <td class="text-dark text-center">
                            <c:choose>
                            <c:when test="${productInfo.photo !=null}">
                                <img src="${pageContext.request.contextPath}/extractImageServlet?productId=${productInfo.getId()}"
                                     class="img-fluid"
                                     alt="Product image" width="75px" height="75px"
                                >
                            </c:when>
                            <c:when test="${productInfo.photo==null}">
                                <img src="${pageContext.request.contextPath}/resources/images/product.png"
                                     class="img-fluid rounded"
                                     alt="Default image" width="75px" height="75px"
                                >
                            </c:when>
                            </c:choose>
                        </td>
                        <td class="text-dark"> ${productInfo.title} </td>
                        <td class="text-dark"> ${productInfo.description} </td>
                        <td class="text-dark"> ${productInfo.price} Dhs</td>
                        <td class="text-center">
                            <a href="${pageContext.request.contextPath}/extractImageServlet?productId=${productInfo.getId()}">
                                <i class="fas fa-eye btnShow mr-3"></i>
                            </a>

                            <a href="${deleteLink}" class="remove-item"
                               onclick="if (!(confirm('Are you sure that you want to delete this product definitly ?'))) return false"
                            >
                                <i class="fas fa-trash btnDelete"></i>
                            </a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="https://cdn.datatables.net/1.10.23/js/jquery.dataTables.min.js"></script>
<script>
    $(function () {
        var table = $('#tableProduct').DataTable();
    });
</script>
</body>
</html>
