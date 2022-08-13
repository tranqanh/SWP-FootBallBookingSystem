<%@page import="error.controllers.ErrorField"%>
<%@page import="java.util.List"%>
<%@page import="dto.controllers.FieldDTO"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Field Management</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="/FBS_SE1627/mainPage/css/fieldMa.css">

</head>

 <body>
        <div class="container-xl">
            <div class="table-responsive">
                <div class="table-wrapper">
                    <div class="table-title">
                        <div class="row">
                            <div class="col-sm-5">
                                <h2>Field <b>Management</b></h2>
                            </div>
                            <div class="col-sm-7">
                                <a href="/FBS_SE1627/mainPage/admin.jsp" class="btn btn-secondary"><i class="fa fa-chevron-left" aria-hidden="true"></i>
                                    <span>Back</span></a>
                                <button class="btn btn-secondary addField" data-toggle="modal"
                                        data-target="#addField-modal"><i class="material-icons">&#xE147;</i> <span>Add New
                                        Field</span></button>
                                <a href="/FBS_SE1627/MainController?action=Getall_Cate" class="btn btn-secondary"><i class="material-icons">&#xe875;</i> <span>
                                        Category Management</span></a>
                            </div>
                        </div>
                    </div>
                    <%
                        List<FieldDTO> listField = (List<FieldDTO>) request.getAttribute("LIST_FIELD");
                        if (listField != null) {
                            if (listField.size() > 0) {

                    %>
                    <table class="table table-striped table-hover">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Name</th>
                                <th>CategoryID</th>
                                <th>FieldID</th>
                                <th>Status</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%                             int count = 1;
                                String statusTrue = "text-success";
                                String statusFalse = "text-danger";
                                String statusDefault = "";
                                String status = "";
                                for (FieldDTO list : listField) {
                                    if (list.getStatus() == 1) {
                                        statusDefault = statusTrue;
                                        status = "Active";
                                    } else {
                                        statusDefault = statusFalse;
                                        status = "Maintain";
                                    }
                            %>
                        <form action="/FBS_SE1627/MainController" method="post">
                            <tr>
                                <td><%=count++%></td>

                                <td><input name="fieldName" value="<%=list.getFieldName()%>" style="width: 100px;"></td>

                                <td>
                                    <select name="categoryID" style=" width: 90px;">
                                        <option value="F5" style="text-align: center;">Field 5</option>
                                        <option value="F7" style="text-align: center;">Field 7</option>
                                    </select>
                                </td>
                                <td><input name="fieldID" value="<%=list.getFieldID()%>" style="width: 100px;" readonly=""></td>
                                <td><span class="status <%=statusDefault%>">&bull;</span> <%=status%></td>
                                <td>
                                    <button class="fa fa-recycle">
                                        <a href="/FBS_SE1627/MainController?action=De_Field&fieldID=<%=list.getFieldID()%>" type="submit" class="Maintain" title="Maintain" data-toggle="tooltip">
                                            Maintain
                                        </a>
                                    </button>
                                    <button  type="submit" id="update" class="fa fa-refresh" title="Update" name="action" value="Up_Field" data-toggle="tooltip">Update</button>
                                </td>
                            </tr>
                        </form>
                        <%
                            }
                        %>
                        </tbody>
                    </table>
                    <%
                            }
                        }
                    %>
                </div>
            </div>


            <!--create new fieldID-->
            <%            ErrorField error = (ErrorField) request.getAttribute("ErrorField");
            if (error == null) {
                error = new ErrorField();
            }
        %>
            <div class="modal fade" id="addField-modal">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title"><b>Add New Field</b></h4>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <form action="/FBS_SE1627/MainController">
                                <div class="box-body">
                                    <div class="form-group">
                                        <label for="fieldID">Field ID</label>
                                        <input type="text" id="fieldID" class="form-control" name="fieldID"
                                               onblur="myFieldID1()" oninput="myFieldID2()" placeholder="Field ID">
                                        <p id="errorMessField"></p>
                                        <p style="color: red"><%= error.getFieldID()%></p>
                                    </div>
                                    <div class="form-group">
                                        <label for="fieldName">Field Name</label>
                                        <input type="text" id="fieldName" class="form-control" name="fieldName"
                                               onblur="myFieldName1()" oninput="myFieldName2()" placeholder="Enter Field Name">
                                        <p id="errorMessFieldName"></p>
                                        <p style="color: red"><%= error.getFieldName()%></p>
                                    </div>
                                    <div class="form-group">
                                        <div class="row">
                                            <div class="col-md-6"
                                                 <label for="categoryID" style="font-size: medium;">Category ID </label>
                                                <div></div>
                                                <select name="categoryID" style=" width: 100px;">
                                                    <option value="F5" style="text-align: center;">Field 5</option>
                                                    <option value="F7" style="text-align: center;">Field 7</option>
                                                </select>
                                            </div>
                                            <div class="col-md-6">
                                                <label for="imgField" style="font-size: medium;">Image Field</label>
                                                <div></div>
                                                <input type="text" id="imgField" name="imgField" placeholder="Link image"><br><br>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default pull-left"
                                            data-dismiss="modal">Close</button>
                                    <button type="submit" name="action" value="Add_Field" class="btn btn-primary">Add Field</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
        <script src="/FBS_SE1627/mainPage/js/fileMaScripts.js"></script>
        <script>
                                                   $(document).ready(function () {
                                                       $('[data-toggle="tooltip"]').tooltip();
                                                   });
        </script>
        <script>
            checkField("${sessionScope.Valid_Field}");
        </script>
    </body>

</html>