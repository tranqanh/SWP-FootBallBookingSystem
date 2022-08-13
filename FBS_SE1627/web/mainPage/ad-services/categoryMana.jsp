<%@page import="error.controllers.ErrorCategory"%>
<%@page import="dto.controllers.CategoryDTO"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Category Management</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="/FBS_SE1627/mainPage/css/category.css">



</head>
<body>
        <div class="container-xl">
            <div class="table-responsive">
                <div class="table-wrapper">
                    <div class="table-title">
                        <div class="row">
                            <div class="col-sm-5">
                                <h2>Category <b>Management</b></h2>
                            </div>
                            <div class="col-sm-7">
                                <a href="/FBS_SE1627/mainPage/admin.jsp" class="btn btn-secondary"><i class="fa fa-chevron-left" aria-hidden="true"></i>
                                    <span>Back To Home</span></a>
                                <a href="/FBS_SE1627/MainController?action=Getall_Field" class="btn btn-secondary"><i class="material-icons">&#xe875;</i> <span> Field Management</span></a>
                                <button href="/FBS_SE1627/mainPage/ad-services/categoryMana.jsp" class="btn btn-secondary addCate" data-toggle="modal"
                                        data-target="#create-cate-modal"><i class="material-icons">&#xE147;</i> <span>Add New
                                        Category</span></button>						
                            </div>
                        </div>
                    </div>
                    <%
                        List<CategoryDTO> listCate = (List<CategoryDTO>) request.getAttribute("LIST_CATE");
                        if (listCate != null) {
                            if (listCate.size() > 0) {

                    %>
                    <table class="table table-striped table-hover">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Category ID</th>						
                                <th>Category Name</th>
                                <th>Status</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%                                
                                int count = 1;
                                String statusTrue = "text-success";
                                String statusFalse = "text-danger";
                                String statusDefault = "";
                                String status = "";
                                for (CategoryDTO list : listCate) {
                                    if (list.getStatus() == 1) {
                                        statusDefault = statusTrue;
                                        status = "Active";
                                    } else {
                                        statusDefault = statusFalse;
                                        status = "InActive";
                                    }
                            %>
                        <form action="/FBS_SE1627/MainController" method="post">
                            <tr>
                                <td><%=count++%></td>
                                <td><input name="categoryID" value="<%=list.getCategoryID()%>" style="width: 100px;" readonly=""></td>                       
                                <td><input name="categoryName" value="<%=list.getCategoryName()%>" style="width: 100px;"></td>
                                <td>    
                                    <span class="status <%=statusDefault%>">&bull;</span><%=status%></td>
                                <td>
                                    <button class="fa fa-trash-o">
                                    <a href="/FBS_SE1627/MainController?action=De_Cate&categoryID=<%=list.getCategoryID()%>" type="submit" class="inactive" title="Delete" data-toggle="tooltip">
                                    Delete
                                    </a>
                                    </button>
                                    <button  type="submit" id="update" class="fa fa-refresh" title="Update" name="action" value="Up_Cate" data-toggle="tooltip">Update</button>
                       
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
        </div> 
        <!--create category ID-->
        <%            ErrorCategory error = (ErrorCategory) request.getAttribute("ErrorCategory");
            if (error == null) {
                error = new ErrorCategory();
            }
        %>
        <div class="modal fade" id="create-cate-modal">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title"><b>Add New Category</b></h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="/FBS_SE1627/MainController" method="post">
                            <div class="box-body">
                                <div class="form-group">
                                    <label for="catagoryID">Category ID</label>
                                    <input type="text" id="catagoryID" class="form-control" name="catagoryID"
                                           onblur="myCategoryID1()" oninput="myCategoryID2()" placeholder="Category ID">
                                    <p id="errorMess"></p>
                                    <p style="color: red"><%= error.getCategoryIDE()%> </p>
                                </div>
                                <div class="form-group">
                                    <label for="categoryName">Category Name</label>
                                    <input type="text" id="categoryName" class="form-control" name="categoryName"
                                           onblur="myCategoryName1()" oninput="myCategoryName2()"
                                           placeholder="Enter Category Name">
                                    <p id="errorMess1"></p>
                                    <p style="color: red"><%= error.getCategoryNameE()%> </p>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                <button type="submit" name="action" value="Add_Cate" class="btn btn-primary">Add new</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
        <script src="/FBS_SE1627/mainPage/js/category.js"></script>

        <script>
                                               $(document).ready(function () {
                                                   $('[data-toggle="tooltip"]').tooltip();
                                               });
        </script>    
        <script>
            CheckCateGory("${sessionScope.Valid_Cate}");
        </script>
    </body>
</html>