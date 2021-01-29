<!DOCTYPE html>
<html>

<head>
    <title>Add Supplier</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link type="text/css" rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootswatch/4.5.2/sketchy/bootstrap.min.css">
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
</head>

<body>
<%@include file="nav.jsp" %>
<div class="container">
    <div class="row">
        <div class="col-10 mx-auto">
            <h3 class="mt-3">Add New Supplier</h3>
            <form name="addSupplier" action="${pageContext.request.contextPath}/supplier/add" method="post">
                <label>
                    <input type="text" name="supplierId" value="${supplier.id}" hidden>
                </label>
                <div class="form-group">
                    <label>First name:</label>
                    <input type="text" class="form-control" name="firstName" value="${supplier.firstName}" required/>
                </div>
                <div class="form-group">
                    <label>Last name:</label>
                    <input type="text" class="form-control" name="lastName" value="${supplier.lastName}" required/>
                </div>
                <div class="form-group">
                    <label>Email:</label>
                    <input type="email" class="form-control" name="email" value="${supplier.email}" required/>
                </div>
                <div class="form-group">
                    <label>Phone:</label>
                    <input type="text" class="form-control" name="phone" value="${supplier.phone}" required/>
                </div>
                <div class="form-group">
                    <label>Address:</label>
                    <input type="text" class="form-control" name="address" value="${supplier.address}" required/>
                </div>
                <button type="submit" value="Save" class="btn btn-success"/>
                    <i class="fas fa-location-arrow"></i>
                    Save Supplier
                </button>
            </form>
            <p class="mt-2">
                <a href="${pageContext.request.contextPath}/supplier/list">
                    <i class="fas fa-arrow-alt-circle-left"></i>
                    Back to List suppliers
                </a>
            </p>
        </div>
    </div>
</div>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
</html>










