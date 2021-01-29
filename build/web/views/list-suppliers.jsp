<%--
  Created by IntelliJ IDEA.
  User: MILIARI Adnane
  Date: 24/01/2021
  Time: 21:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Suppliers</title>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link type="text/css" rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootswatch/4.5.2/sketchy/bootstrap.min.css">
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.23/css/jquery.dataTables.min.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/10.13.1/sweetalert2.min.css" integrity="sha512-EeZYT52DgUwGU45iNoywycYyJW/C2irAZhp2RZAA0X4KtgE4XbqUl9zXydANcIlEuF+BXpsooxzkPW081bqoBQ==" crossorigin="anonymous" />
</head>

<body>
<%@include file="nav.jsp" %>
<div class="container">
    <div class="row">
        <div class="col-12">

            <a class="btn btn-info mt-5 mb-2 text-white" type="button" onclick="window.location.href='add'">
                <i class="fas fa-user-plus"></i>
                Add New Supplier
            </a>
            <table class="table rounded table-bordered mb-2" id="tableSupplier">
                <thead>
                    <tr>
                        <th class="text-dark">First Name</th>
                        <th class="text-dark">Last Name</th>
                        <th class="text-dark">Email</th>
                        <th class="text-dark">Phone</th>
                        <th class="text-dark">Address</th>
                        <th class="text-dark">Actions</th>
                    </tr>
                </thead>
                <tbody>
                <c:forEach var="supplierInfo" items="${suppliers}">

                    <c:url var="updateLink" value="/supplier/update">
                        <c:param name="supplierId" value="${supplierInfo.id}" />
                    </c:url>

                    <c:url var="deleteLink" value="/supplier/delete">
                        <c:param name="supplierId" value="${supplierInfo.id}" />
                    </c:url>

                    <tr>
                        <td class="text-dark"> ${supplierInfo.firstName} </td>
                        <td class="text-dark"> ${supplierInfo.lastName} </td>
                        <td class="text-dark"> ${supplierInfo.email} </td>
                        <td class="text-dark"> ${supplierInfo.phone} </td>
                        <td class="text-dark"> ${supplierInfo.address} </td>
                        <td class="text-center">
                            <a href="${updateLink}">
                                <i class="fas fa-highlighter btnEdit mr-3"></i>
                            </a>

                            <a href="${deleteLink}" class="remove-item"
                               onclick="if (!(confirm('Are you sure that you want to delete this supplier definitly ?'))) return false"
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
            var table = $('#tableSupplier').DataTable();
        });
    </script>
</body>
</html>









