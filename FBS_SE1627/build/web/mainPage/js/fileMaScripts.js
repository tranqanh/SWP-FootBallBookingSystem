function myFieldID1() {
    if (document.getElementById("fieldID").value === "") {
        document.getElementById("fieldID").style.border="1px solid red";
        document.getElementById("errorMessField").innerHTML = "Field ID can not be null";
        document.getElementById("errorMessField").style.color = "red";
    }
}
function myFieldID2() {
    document.getElementById("errorMessFieldName").innerHTML = "";
    document.getElementById("fieldID").style.border="";
}

function myFieldName1() {
    if (document.getElementById("fieldName").value === "") {
        document.getElementById("fieldName").style.border="1px solid red";
        document.getElementById("errorMessFieldName").innerHTML = "Field Name can not be null";
        document.getElementById("errorMessFieldName").style.color = "red";
    }
}
function myFieldName2() {
    document.getElementById("errorMessFieldName").innerHTML = "";
    document.getElementById("fieldName").style.border="";
}
function mySlotName1() {
    if (document.getElementById("SlotName").value === "") {
        document.getElementById("SlotName").style.border="1px solid red";
        document.getElementById("errorMessSlotName").innerHTML = "Slot Name can not be null";
        document.getElementById("errorMessSlotName").style.color = "red";
    }
}
function mySlotName2() {
    document.getElementById("errorMessSlotName").innerHTML = "";
    document.getElementById("SlotName").style.border="";
}

function mySlotPrice1() {
    if (document.getElementById("SlotPrice").value === "") {
        document.getElementById("SlotPrice").style.border="1px solid red";
        document.getElementById("errorMessSlotPrice").innerHTML = "Slot Price can not be null";
        document.getElementById("errorMessSlotPrice").style.color = "red";
    }
}
function mySlotPrice2() {
    document.getElementById("errorMessSlotPrice").innerHTML = "";
    document.getElementById("SlotPrice").style.border="";
}

function checkField(fieldInvalid) {
    if (fieldInvalid.includes("Invalid")) {
        $('#addField-modal').modal('show');
    } else {
        $('#addField-modal').modal('hide');
    }
}
function checkSlot(fieldInvalid) {
    if (fieldInvalid.includes("Invalid")) {
        $('#addSlot-modal').modal('show');
    } else {
        $('#addSlot-modal').modal('hide');
    }
}