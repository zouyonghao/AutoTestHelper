<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <!--Import Google Icon Font-->
    <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <!--Import materialize.css-->
    <link type="text/css" rel="stylesheet" href="resources/materialize/css/materialize.min.css"
          media="screen,projection"/>

    <!--Let browser know website is optimized for mobile-->
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link type="text/css" rel="stylesheet" href="resources/style.css"/>
</head>

<body>

<%-- Layout --%>
<%--
#########################################################
                        Navbar
#########################################################
#            #                                          #
#            #                                          #
#            #                                          #
#            #                                          #
#            #                                          #
#            #                                          #
#            #             Main                         #
#            #            Content                       #
#    Some    #             Main                         #
#   Select   #            Content                       #
#    Item    #             Main                         #
#            #            Content                       #
#            #                                          #
#            #                                          #
#            #                                          #
#            #                                          #
#            #                                          #
#            #                                          #
#            #                                          #
#            #                                          #
#########################################################
--%>

<!-- Navbar goes here -->
<header>
    <nav class="top-nav light-blue">
        <div class="container">
            <div class="nav-wrapper">
                <a class="brand-logo">AutoTestHelper</a>
            </div>
        </div>
    </nav>
</header>
<!-- Page Layout here -->
<div id="main" class="container" style="top: 64px;">
    <div class="row">
        <%-- Left Side --%>
        <div class="col s3">
            <div class="collection">
                <a href="#" class="collection-item waves-effect">
                    URL Test
                </a>
            </div>
        </div>
        <%-- Content --%>
        <div class="col s9">
            <div id="content">

                <table>
                    <thead>
                    <tr>
                        <th data-field="id">id</th>
                        <th data-field="name">URL</th>
                        <th data-field="price">Expect</th>
                    </tr>
                    </thead>

                    <tbody>
                    <tr>
                        <td>0</td>
                        <td>http://abc.com</td>
                        <td>{"a":"value"}</td>
                    </tr>
                    <tr>
                        <td>1</td>
                        <td>http://bcd.com</td>
                        <td>some value</td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>


    <div class="fixed-action-btn" style="bottom: 50px; right: 19px;">
        <a class="btn-floating btn-large">
            <i class="mdi-content-add"></i>
        </a>
    </div>
</div>

<!--Import jQuery before materialize.js-->
<script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
<script type="text/javascript" src="resources/materialize/js/materialize.min.js"></script>
</body>
</html>
