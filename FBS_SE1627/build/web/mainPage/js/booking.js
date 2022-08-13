
function getValue() {
    // var selectedValue = document.getElementById("selService").text;
    var sel = document.getElementById("field");
    var text = sel.options[sel.selectedIndex].text;

    return text;
}

function getDate() {
    var getDate = document.getElementById("dateService").value;
    return getDate;
}

function change_button(checkbxdc, button_id) {
    var btn = document.getElementById(button_id);
    if (checkbxdc.value == "") {
        btn.disabled = true;
    } else {
        btn.disabled = false;
    }
}

function change_Book(checkbx, button_id, date_id) {
    var btn = document.getElementById(button_id);
    // let service = document.getElementById(service_id).value;
    let date = document.getElementById(date_id).value;
    if (checkbx.value != "" && date != "") {
        btn.removeAttribute("disabled");
    }
    getSlot = checkbx;
}

function getSlotValue() {
    var slotValue = getSlot.value;
    return slotValue;
}

function slotCheck() {
    var today = new Date();
    var dd = String(today.getDate()).padStart(2, "0");
    var mm = String(today.getMonth() + 1).padStart(2, "0");
    var yyyy = today.getFullYear();

    today = yyyy + "-" + mm + "-" + dd;
    $("#dateService").attr("min", today);
    var count = $("body").find(".btn-check").length;
    var todayTime = new Date().toLocaleTimeString("en-GB", {
        hour: "numeric",
        minute: "numeric"
    });

    for (let i = 0; i < count; i++) {
        var timePicked = document.getElementById("success-outlined" + i);
        var timePickedValue = document.getElementById("success-outlined" + i).value;
        var labelPicked = document.getElementById("slot" + i);
        timeSlot = timePickedValue.split("-");
        if (timePicked.disabled === true) {
            timePicked.removeAttribute("disabled");
        }
        if (getDate() !== null) {
            if (getDate() === today) {
                if (timeSlot[0] < todayTime) {
                    timePicked.disabled = true;
                }
            }
        }
    }
}
;

function checkToday() {
    var today = new Date();
    var dd = String(today.getDate()).padStart(2, "0");
    var mm = String(today.getMonth() + 1).padStart(2, "0");
    var yyyy = today.getFullYear();

    today = yyyy + "-" + mm + "-" + dd;
    if (getDate() < today) {
        console.log("ai cho mà nhập ngày này hả quánh giờ");
        return 1;
    }
}

$('#dateService').change(function () {

    var today = new Date();
    var dd = String(today.getDate()).padStart(2, "0");
    var mm = String(today.getMonth() + 1).padStart(2, "0");
    var yyyy = today.getFullYear();
    today = yyyy + "-" + mm + "-" + dd;
    var count = $("body").find(".btn-check").length;
    var todayTime = new Date();
    todayTime.setHours(todayTime.getHours() + 2); // cái này để cho thời gian pick giờ
    var todayTimeString = todayTime.toLocaleTimeString("en-GB", {
        hour: "numeric",
        minute: "numeric",
        //   second: "numeric"
    });
    $('.btn-check').prop("checked", false);
    console.log();
    for (let i = 0; i < count; i++) {
        var timePicked = document.getElementById("success-outlined" + i);
        var timePickedValue = document.getElementById("success-outlined" + i).value;
        timeSlot = timePickedValue.split("-");
        if (timePicked.disabled === true) {
            timePicked.removeAttribute("disabled");
        }
        if (getDate() !== null) {
            if (getDate() === today) {

                if (timeSlot[0] < todayTimeString) {
                    timePicked.disabled = true;
                }
            }
        }
    }
})

$("#buttonService").on("click", function () {
    var co = $("#foo").find("*").length;
    console.log(co);

    for (var i = 0; i <= co / 2; i++) {
        $("#success-outlined").attr("id", "success-outlined" + i);
        $("#slot").attr("for", "success-outlined" + i);
        $("#slot").attr("id", "slot" + i);
    }
})
index2=0;
index = 0;
index3 = 0;
timeService = 0;
checkDate = 0;
const dateArray = [];
function addLi() {
    
    var txtVal = getValue();
    var txtDate = getDate();
    var txtSlot = getSlotValue();
    listNode = document.getElementById("list");
    liNode = document.createElement("li");
    var lenghtLi = document
            .getElementById("list")
            .getElementsByTagName("li").length;
    input = document.createElement("input");
    input2 = document.createElement("input");
    input3 = document.createElement("input");
    const countDay = {};
    console.log(getValue());
    slotCheck();
    if (checkToday() == 1) {
        document.getElementById("slotCatchQ").innerHTML =
                "Please choose another date";
        return;
    }
    console.log("alo");
    if (index > 0) {
        for (let i = 0; i < index2; i++) {
            if (
                    document.getElementById("date" + i) !== null ||
                    document.getElementById("lot" + i) !== null
                    // ||
                    // document.getElementById("service" + i) !== null
                    ) {
                if (getDate() === document.getElementById("date" + i).value) {
                    // if (getValue() === document.getElementById("service" + i).value) {
                    //   document.getElementById("slotCatchQ").innerHTML =
                    //     "Please choose another service";
                    //   return;
                    // } else 
                    if (
                            getSlotValue() === document.getElementById("lot" + i).value
                            ) {
                        document.getElementById("slotCatchQ").innerHTML =
                                "Please choose another slot";
                        return;
                    }
                }
            }
        }
    }

    //them ngay vao chuoi
    console.log(dateArray[checkDate]);
    if (dateArray[checkDate] == null) {
        dateArray[checkDate] = getDate();
        // console.log(dateArray[checkDate]);
        checkDate++;
    }
    console.log(dateArray[checkDate]);

    for (const element of dateArray) {
        if (countDay[element]) {
            countDay[element] += 1;
        } else {
            countDay[element] = 1;
        }
    }

    if (countDay[getDate()] > 4) {
        dateArray.pop();
        // console.log(dateArray);
        document.getElementById("slotCatchQ").innerHTML =
                "Only can choose 4 service per day";
        return;
    }

    // console.log(dateArray);
    // console.log(countDay);

    for (var i = 0; i <= index2; i++) {
        liNode.setAttribute("id", i);
        input2.setAttribute("id", "lot" + i);
        input3.setAttribute("id", "date" + i);
        input2.setAttribute("name", "slot" +i);
        input3.setAttribute("name", "date" +i);
        
    }

    txtNode = document.createTextNode(
            txtVal + " on " + txtDate + " at " + txtSlot
            );
    liNode.appendChild(txtNode);

    //create input
    input.setAttribute("type", "hidden");
    input.setAttribute("value", txtVal);


    input2.setAttribute("type", "hidden");
    input2.setAttribute("value", txtSlot);


    input3.setAttribute("type", "hidden");
    input3.setAttribute("value", txtDate);


    //create button
    var button = document.createElement("button");
    button.innerHTML = "&times;";
    button.setAttribute("class", "btn btn-danger deleData");
    button.setAttribute("onclick", "removeLi()");
    button.setAttribute("aria-label", "Close");
    button.setAttribute("style", "float: right");
    button.setAttribute("id", txtDate);
    // button.setAttribute("class","deleData");
    liNode.appendChild(input2);
    liNode.appendChild(input);
    liNode.appendChild(input3);
    liNode.appendChild(button);

    listNode.appendChild(liNode);
    document
            .getElementById("field")
            .setAttribute("onfocus", "this.setAttribute('data-value', this.value)");
    document
            .getElementById("field")
            .setAttribute("onchange", "this.value = this.getAttribute('data-value');");
    index++;
    index2++;
    index3++;
    timeService++;
    document.getElementById("slotCatchQ").innerHTML = "";
    $("#modalForm").modal("hide");
}

$(function () {
    var todayTime = new Date().toLocaleTimeString("en-GB", {
        hour: "numeric",
        minute: "numeric",
    });
});

$("#buttonService").on("click", function () {
    if (index3 >= 5) {
        document.getElementById("bookCatch").innerHTML =
                "Only can choose 5 service per appointment";
        return;
    }
});

$("#buttonSubmit").on("click", function () {
    if (index3 >= 5) {
        var element = document.getElementById("modalForm");
        element.setAttribute("id", "modalForm2");
        return;
    }
});

function removeLi() {
    $("body").unbind("click").on("click", ".deleData", function () {
        var a = $(this).attr("id");
        // console.log(a);
        var b = dateArray.indexOf(a);
        dateArray.splice(b, 1);
        $(this).parent().remove();
        index3--;
        console.log(index3);
        document.getElementById("bookCatch").innerHTML = "";
        var element = document.getElementById("modalForm2");
        element.setAttribute("id", "modalForm");
    });
}




