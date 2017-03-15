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
                        <th data-field="action">Action</th>
                    </tr>
                    </thead>

                    <tbody id="testcase-table">
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

    <%-- just a circle --%>
    <div class="preloader-wrapper small active" id="spinner">
        <div class="spinner-layer spinner-blue">
            <div class="circle-clipper left">
                <div class="circle"></div>
            </div><div class="gap-patch">
            <div class="circle"></div>
        </div><div class="circle-clipper right">
            <div class="circle"></div>
        </div>
        </div>

        <div class="spinner-layer spinner-red">
            <div class="circle-clipper left">
                <div class="circle"></div>
            </div><div class="gap-patch">
            <div class="circle"></div>
        </div><div class="circle-clipper right">
            <div class="circle"></div>
        </div>
        </div>

        <div class="spinner-layer spinner-yellow">
            <div class="circle-clipper left">
                <div class="circle"></div>
            </div><div class="gap-patch">
            <div class="circle"></div>
        </div><div class="circle-clipper right">
            <div class="circle"></div>
        </div>
        </div>

        <div class="spinner-layer spinner-green">
            <div class="circle-clipper left">
                <div class="circle"></div>
            </div><div class="gap-patch">
            <div class="circle"></div>
        </div><div class="circle-clipper right">
            <div class="circle"></div>
        </div>
        </div>
    </div>
</div>

<!--Import jQuery before materialize.js-->
<script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
<script type="text/javascript" src="resources/materialize/js/materialize.min.js"></script>

<script>

    $("#spinner").hide();
    $.ajax({
        method: "POST",
        url: "url/list",
        data: {
            pageSize: 10,
            pageNo: 1
        }
    }).success(function (result) {
        result.forEach(function (item) {
            var tr = $("<tr></tr>");
            tr.append($("<td>" + item["id"] + "</td>"));
            tr.append($("<td>" + item["url"] + "</td>"));
            tr.append($("<td>" + item["expectValue"] + "</td>"));
            tr.append($('<td><a href="#" class="testcase-execute">execute</a></td>'));
            $("#testcase-table").append(tr);
        })
    });
    $("#testcase-table").on("click", ".testcase-execute", function () {
        var tr = $(this).parent().parent();
        var id = tr.children()[0].innerHTML;
        var url = tr.children()[1].innerHTML;
        var expect = tr.children()[2].innerHTML;
        $("#spinner").show();
        $.ajax({
            method: "POST",
            url: "url/execute",
            data: {
                id: id
            }
        }).success(function (result) {
            $("#spinner").hide();
            result = JSON.parse(result);
            if (result["realValue"] == expect) {
                Materialize.toast('Test passed!', 4000);
            } else {
                Materialize.toast('Test not passed!', 4000)
            }
        })
    })
</script>

</body>
</html>
