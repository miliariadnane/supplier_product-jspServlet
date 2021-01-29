<%-- 
    Document   : home
    Created on : 28 janv. 2021, 17:26:34
    Author     : MILIARI Adnane
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Nano Project</title>
        <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
    </head>
    <body>
        <div class="jumbotron">
            <div class="container">
                <div class="row">
                    <div class="col-8">
                        <h1 class="display-4">Hello World ^_^</h1>
                        <p class="lead">Try the impossible</p>
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-lg-6 offset-lg-3 mx-auto text-center">
                    <h2>Nano <em>Robot</em> Project</h2>
                    <img src="${pageContext.request.contextPath}/resources/images/bienvenue.gif" alt="robot">
                    <p class="bienvenue">Welcome to this page that propose a crud project in oriented services architectures with JSP, Servlet and Hibernate of suppliers and products moduls ...</p>
                </div>
            </div>
        </div>
        <section class="section" id="call-to-action">
            <div class="container">
                <div class="row">
                    <div class="col-lg-10 offset-lg-1">
                        <div class="cta-content mx-auto">
                            <h2 class="text-center">Don’t <em>think</em>, begin <em>now</em>!</h2>
                            <p></p>
                            <div class="main-button scroll-to-section text-center">
                                <a href="${pageContext.request.contextPath}/supplier/list">Go To DashBoard</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </body>
</html>
