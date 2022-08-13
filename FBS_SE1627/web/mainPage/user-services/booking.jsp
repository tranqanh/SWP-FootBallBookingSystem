<%@page import="dto.controllers.UserDTO"%>
<%@page import="java.util.List"%>
<%@page import="dto.controllers.SlotDTO"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet">	
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- <link type="text/css" rel="stylesheet" href="css/style.css" /> -->
        <link href="/FBS_SE1627/mainPage/css/booking.css" rel="stylesheet">
        <title>Book A Field</title>
    </head>
    <body>
        <%
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            if (loginUser == null || !loginUser.getRoleID().trim().equals("US")) {
                response.sendRedirect("/FBS_SE1627/login_sigup/login.jsp");
                return;
            }
            String fieldT = request.getParameter("FieldType");
        %>
        <div class="modal fade" role="dialog" id="modalForm">
            <div class="modal-dialog modal-lg" role="content">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">Service Details</h4>
                        <button id="buttonClose" type="button" class="close" data-bs-dismiss="modal">&times;</button>
                    </div>
                    <div class="modal-body">
                        <form>
                            <div class="mb-3">
                                <span class="form-label">Date</span>
                                <input name="dateOder" class="form-control" id="dateService" type="date" required>
                            </div>
                            <div class="mb-3">
                                <span class="form-label d-block">Slot</span>

                                <div id='foo'>
                                    <%
                                        List<SlotDTO> listSlot = (List<SlotDTO>) request.getAttribute("LIST_SLOT");
                                        if (listSlot != null) {
                                            if (listSlot.size() > 0) {
                                    %>

                                    <%
                                        for (SlotDTO slot : listSlot) {
                                    %>
                                    <input type="radio" class="btn-check" name="options-outlined" id="success-outlined" value="<%= slot.getTimeStart()%>-<%= slot.getTimeEnd()%>" onchange="change_Book(this, 'buttonSubmit', 'dateService')">
                                    <label id="slot" class="btn btn-outline-primary" for="success-outlined" ><%= slot.getTimeStart()%> - <%= slot.getTimeEnd()%></label>

                                    <%
                                        }

                                    %>
                                    <%        }
                                        }
                                    %>

                                </div>

                            </div>
                            <div id="slotCatchQ" class="bg-danger text-white mb-2 pl-2"></div>
                            
                            <div class="modal-footer">
                                <button disabled id="buttonSubmit" type="button" class="btn btn-primary" onclick="addLi()">Book Now 1</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>      
        </div>
        <div class='container' id="containerId">
            <div class='window'>
                <div class='order-info'>
                    <div class='order-info-content'>                    
                        <div class='line'></div>
                        <div class="booking-form">
                            <div class="form-header">
                                <h3>Book A Field</h3>
                            </div>
                            <form action="/FBS_SE1627/MainController" method="POST">
                                <div class="row">
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <span class="form-label">Name</span>
                                            <input name="GestName" class="form-control" type="text" placeholder="Enter your name" value="<%=loginUser.getUserName()%>">
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <span class="form-label">Your ID</span>
                                            <input name="UserID" class="form-control" type="text" value="<%= loginUser.getUserID() %>" readonly="">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <span class="form-label">Phone</span>
                                    <input name="phone" class="form-control" type="tel" placeholder="Enter your phone number" value="<%= loginUser.getPhone() %>">
                                </div>
                                <div class="form-group">
                                    <span class="form-label">Address</span>
                                    <input name="Address" class="form-control" type="text" placeholder="Address" value="<%= loginUser.getAddress() %>">
                                </div>
                                <!-- cai nay chinh js lai di sao cho bam vao add more slot thi nos goi ham change_button-->
                                <div class="form-group">
                                    <span class="form-label">Field</span>
                                    <select name="CategoryID" class="form-control" id="field" required onclick="change_button(this, 'buttonService')" >
                                        <option value="<%= fieldT %>"><%= fieldT %></option>
                                    </select>
                                    
                                </div>
                                <input type="hidden" name="RoleID" value="<%= loginUser.getRoleID() %>"/>
                                <div class="form-group">
                                    <span class="form-label">Add your time</span>
                                    <div class="input-group-append">
                                        <button  class="btn btn-success" id="buttonService" type="button" data-bs-toggle="modal" data-bs-target="#modalForm" >Add more slot</button> 
                                    </div>

                                    <hr style="height:2px;border: width 10px;;color:red;background-color:red">
                                    <ul class="ul-list" id="list">
                                        
                                    </ul>
                                    <div id="bookCatch" class="bg-danger text-white mb-2 pl-2"></div>
                                </div>							
                                <div class="form-btn">
                                    <button type="submit"  name="action" value="BookRequest" class="submit-btn">Book Now</button>
                                </div>
                                <div class="form-btn mt-3">
                                    <a href="/FBS_SE1627/mainPage/user.jsp" class="btn btn-danger">
                                        Back Home
                                    </a>
                                </div>
                            </form>
                        </div>
                        <div class='line-total'></div>
                    </div>
                </div>  
            </div>               
        </div>
    </body>
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="/FBS_SE1627/mainPage/js/booking.js"></script>
    <!-- <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script> -->
    <!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script> -->
</html>
