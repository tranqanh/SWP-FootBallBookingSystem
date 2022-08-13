<%@page import="error.controllers.ErrorSlot"%>
<%@page import="dto.controllers.SlotDTO"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Slot Management</title>
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
                                <h2>Slot<b> Management</b></h2>
                            </div>
                            <div class="col-sm-7">
                                <a href="/FBS_SE1627/mainPage/admin.jsp" class="btn btn-secondary"><i class="fa fa-chevron-left" aria-hidden="true"></i>
                                    <span>Back</span></a>
                                <button class="btn btn-secondary addField" data-toggle="modal"
                                        data-target="#addSlot-modal"><i class="material-icons">&#xE147;</i> <span>Add New
                                        Slot</span>
                                </button>
                            </div>
                        </div>
                    </div>
                    <%
                        List<SlotDTO> listSlot = (List<SlotDTO>) request.getAttribute("LIST_SLOT");
                        if (listSlot != null) {
                            if (listSlot.size() > 0) {

                    %>
                    <table class="table table-striped table-hover">
                        <thead>
                            <tr>
                                <th>Field Type</th>
                                <th>Slot Name</th>
                                <th>Time Start </th>
                                <th>Time End</th>
                                <th>Price</th>
                                <th>Status</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%                                String statusTrue = "text-success";
                                String statusFalse = "text-danger";
                                String statusDefault = "";
                                String status = "";
                                for (SlotDTO list : listSlot) {
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
                                <td><input name="categoryID" value="<%=list.getCategoryID()%>" style="width: 100px;" readonly=""></td>

                                <td><input name="slotName" value="<%=list.getSlotName()%>" style="width: 100px;" readonly=""></td>

                                <td><input name="timeStart" value="<%=list.getTimeStart()%>" style="width: 100px;"></td>

                                <td><input name="timeEnd" value="<%=list.getTimeEnd()%>" style="width: 100px;"></td>
                                <td><input name="price" value="<%=list.getPrice()%>" style="width: 100px;"></td>

                                <td><span class="status <%=statusDefault%>">&bull;</span> <%=status%></td>
                                <td>
                                    <button class="fa fa-recycle">
                                        <a href="/FBS_SE1627/MainController?action=De_Slot&slotName=<%=list.getSlotName()%>" type="submit" class="Inactive" title="Inactive" data-toggle="tooltip">
                                            Inactive
                                        </a>
                                    </button>
                                    <button  type="submit" id="update" class="fa fa-refresh" title="Update" name="action" value="Up_Slot" data-toggle="tooltip">Update</button>
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
            <!--create new slot-->
            <%
                ErrorSlot error = (ErrorSlot) request.getAttribute("ErrorSlot");
                if (error == null) {
                    error = new ErrorSlot();
                }
            %>
            <div class="modal fade" id="addSlot-modal">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title"><b>Add Slot</b></h4>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <form action="/FBS_SE1627/MainController" method="post">
                                <div class="box-body">

                                    <div class="form-group">
                                        <label for="slotName">Slot Name</label>
                                        <input type="text" id="SlotName" class="form-control" name="slotName"
                                               onblur="mySlotName1()" oninput="mySlotName2()" placeholder="Enter Slot Name">
                                        <p id="errorMessSlotName"></p>
                                        <p style="color: red"><%= error.getSlotName()%></p>
                                    </div>
                                    <div class="form-group">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label for="SlotTimeStart">Slot TimeStart</label>
                                                <input type="time" id="SlotTimeStart" class="form-control" name="SlotTimeStart"
                                                       onblur="mySlotName1()" oninput="mySlotName2()" placeholder="Enter Slot Time Start">
                                                <p id="errorMessSlotTimeStart"></p>
                                            </div>
                                            <div class="col-md-6">
                                                <label for="SlotName">Slot TimeEnd</label>
                                                <input type="time" id="SlotTimeEnd" class="form-control" name="SlotTimeEnd"
                                                       onblur="mySlotName1()" oninput="mySlotName2()" placeholder="Enter Slot Time Start">
                                                <p id="errorMessSlotTimeEnd"></p>
                                            </div>
                                        </div>
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
                                                <label for="SlotPrice">Price</label>
                                                <input type="text" id="SlotPrice" class="form-control" name="price"
                                                       onblur="mySlotPrice1()" oninput="mySlotPrice2()" placeholder="Enter Price of Slot">
                                                <p id="errorMessSlotPrice"></p>
                                                 <p style="color: red"><%= error.getPrice()%></p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-default pull-left"
                                                data-dismiss="modal">Close</button>
                                        <button type="submit" name="action" value="Add_Slot" class="btn btn-primary">Add Slot</button>
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
            checkSlot("${sessionScope.Valid_Slot}");
        </script>
    </body>

</html>