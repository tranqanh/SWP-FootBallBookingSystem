<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet">	
	    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- <link type="text/css" rel="stylesheet" href="css/style.css" /> -->
        <link href="/FBS_SE1627/mainPage/css/booking.css" rel="stylesheet">
        <title>Direct Booking</title>
    </head>
    <body>
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
                                <input class="form-control" id="dateService" type="date" required>
                            </div>
                            <div class="mb-3">
                                <span class="form-label d-block">Slot</span>
                                
                                <div id='foo'>
                                    <input type="radio" class="btn-check" name="options-outlined" id="success-outlined" value="07:00-08:00" onchange="change_Book(this,'buttonSubmit','dateService')">
                                    <label id="slot" class="btn btn-outline-primary" for="success-outlined" >07:00 - 08:00</label>

                                    <input type="radio" class="btn-check" name="options-outlined" id="success-outlined" value="08:00-09:00" onchange="change_Book(this,'buttonSubmit','dateService')">
                                    <label id="slot" class="btn btn-outline-primary" for="success-outlined">08:00 - 09:00</label>

                                    <input type="radio" class="btn-check" name="options-outlined" id="success-outlined" value="09:00-10:00" onchange="change_Book(this,'buttonSubmit','dateService')">
                                    <label id="slot" class="btn btn-outline-primary" for="success-outlined">09:00 - 10:00</label>

                                    <input type="radio" class="btn-check" name="options-outlined" id="success-outlined" value="10:00-11:00" onchange="change_Book(this,'buttonSubmit','dateService')">
                                    <label id="slot" class="btn btn-outline-primary" for="success-outlined">10:00 - 11:00</label>

                                    <input type="radio" class="btn-check" name="options-outlined" id="success-outlined" value="01:00-04:00" onchange="change_Book(this,'buttonSubmit','dateService')">
                                    <label id="slot" class="btn btn-outline-primary" for="success-outlined">01:00 - 04:00</label>

                                    <input type="radio" class="btn-check" name="options-outlined" id="success-outlined" value="00:00-01:00" onchange="change_Book(this,'buttonSubmit','dateService')">
                                    <label id="slot" class="btn btn-outline-primary" for="success-outlined">00:00 - 04:00</label>

                                    <input type="radio" class="btn-check" name="options-outlined" id="success-outlined" value="07:00-08:00" onchange="change_Book(this,'buttonSubmit','dateService')">
                                    <label id="slot" class="btn btn-outline-primary" for="success-outlined" >05:00 - 06:00</label>

                                    <input type="radio" class="btn-check" name="options-outlined" id="success-outlined" value="18:00-19:00" onchange="change_Book(this,'buttonSubmit','dateService')">
                                    <label id="slot" class="btn btn-outline-primary" for="success-outlined" >16:00 - 18:00</label>
                                </div>
                                
                            </div>
                            <div id="slotCatchQ" class="bg-danger text-white mb-2 pl-2"></div>
                            <div class="modal-footer">
                                <button disabled id="buttonSubmit" type="button" class="btn btn-primary" onclick="addLi()">Book Now</button>
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
                                <h3>Direct Booking</h3>
                            </div>
                            <form>
                                <div class="row">
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <span class="form-label">Name</span>
                                            <input class="form-control" type="text" placeholder="Enter your name">
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <span class="form-label">Email</span>
                                            <input class="form-control" type="email" placeholder="Enter your email">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <span class="form-label">Phone</span>
                                    <input class="form-control" type="tel" placeholder="Enter your phone number">
                                </div>
                                <div class="form-group">
                                    <span class="form-label">Address</span>
                                    <input class="form-control" type="text" placeholder="Address">
                                </div>
                                <div class="form-group">
                                    <span class="form-label">Field</span>
                                    <select class="form-control" id="field" required onclick="change_button(this,'buttonService')" >
                                        <option value="" selected hidden>Please choose your type of filed</option>
                                        <option value="1">Field 5</option>
                                        <option value="2">Field 7</option>
                                        <option value="3">Field 3</option>
                                        <option value="4">Field 4</option>
                                        <option value="5">Field 5</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <span class="form-label">Add your time</span>
                                    <div class="input-group-append">
                                        <button  class="btn btn-success" id="buttonService" type="button" data-bs-toggle="modal" data-bs-target="#modalForm" disabled>Add more slot</button>
                                    </div>
                                    <hr style="height:2px;border: width 10px;;color:gray;background-color:red">
                                    <ul class="ul-list" id="list">
                                    </ul>
                                    <div id="bookCatch" class="bg-danger text-white mb-2 pl-2"></div>
                                </div>							
                                <div class="form-btn">
                                    <button class="submit-btn" name="">Book Now</button>
                                   
                                </div>
                                <div class="form-btn mt-3">
                                    <a href="/FBS_SE1627/mainPage/admin.jsp" class="btn btn-danger">
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
    <script src="FBS_SE1627/mainPage/js/booking.js"></script>
    <!-- <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script> -->
    <!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script> -->
</html>
