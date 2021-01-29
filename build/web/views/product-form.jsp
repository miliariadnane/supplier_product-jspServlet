<%--
  Created by IntelliJ IDEA.
  User: MILIARI Adnane
  Date: 24/01/2021
  Time: 21:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <title>Add Product</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link type="text/css" rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootswatch/4.5.2/sketchy/bootstrap.min.css">
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
    <link href="https://cdn.jsdelivr.net/npm/froala-editor@3.1.0/css/froala_editor.pkgd.min.css" rel="stylesheet" type="text/css" />
</head>

<body>
<%@include file="nav.jsp" %>
<div class="container">
    <div class="row">
        <div class="col-10 mx-auto">
            <h3 class="mt-3">Add New Product</h3>
            <form method="POST" action="${pageContext.request.contextPath}/product/add" enctype="multipart/form-data">
                <div class="form-group">
                    <label>Title:</label>
                    <input type="text" class="form-control" name="title" required/>
                </div>
                <div class="form-group">
                    <label>Price:</label>
                    <input type="number" class="form-control" name="price" required/>
                </div>
                <div class="form-group">
                    <label>Photo:</label>
                    <input type="file" class="form-control-file" name="file">
                </div>
                <div class="form-group">
                    <label>Description:</label>
                    <textarea type="text" class="form-control" name="description" rows="3" id="editor" required></textarea>
                </div>
                <button type="submit" value="Save" class="btn btn-success"/>
                <i class="fas fa-location-arrow"></i>
                Save Post
                </button>
            </form>
            <p class="mt-2">
                <a href="${pageContext.request.contextPath}/product/list">
                    <i class="fas fa-arrow-alt-circle-left"></i>
                    Back to List products
                </a>
            </p>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/froala-editor@3.1.0/js/froala_editor.pkgd.min.js"></script>
<script>
    $(function () {
        var editor = new FroalaEditor('#editor')
    });
</script>
</body>
</html>
