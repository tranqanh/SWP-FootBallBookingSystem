function Validator(options) {
    var selectorRules = {};
    function validate(inputElement, rule) {
        var errorMessage;
        var errorElement = inputElement.parentElement.querySelector(options.errorSelector);
        
        var rules = selectorRules[rule.selector]; 
        for(var i = 0; i < rules.length; ++i) {
            errorMessage = rules[i](inputElement.value);
            if(errorMessage) {
                break;
            }
        }
        if(errorMessage) {
            errorElement.innerText = errorMessage;
        }
        else {
            errorElement.innerText = '';
        }

        return !errorMessage; // thành true false 
       
    }
    var formElement = document.querySelector(options.form);
    if(formElement){
        options.rules.forEach(function(rule) {

            // lưu lại các rules cho mỗi input
            if(Array.isArray(selectorRules[rule.selector])) {
                selectorRules[rule.selector].push(rule.test);
            } else {
                 selectorRules[rule.selector] = [rule.test];
            }
           

            var inputElement = formElement.querySelector(rule.selector);
            //xử lý trường hợp nhập xong ô (blur)
            if(inputElement) {
                inputElement.onblur = function () {
                   validate(inputElement, rule);
                }
            }

            //xử lý mỗi khi người dùng nhập vào input
            inputElement.oninput = function() {
                var errorElement = inputElement.parentElement.querySelector('.form-message');
                errorElement.innerText = '';
            }
        }); 
    }
}
function checkDuplicate(){
    const oldPassword = document.getElementById("oldPass").value;
    const checkPass = document.getElementById("password").value;
    if(checkPass != oldPassword) {
        document.querySelector("#checkOldPass").style.display='block';
    }
    else {
        document.querySelector("#checkOldPass").style.display='none';
    }
}

Validator.minLength = function(selector, min, message) {
    return {
        selector: selector,
        test: function(value) {
            return value.length >= min ? undefined : message ;
        }
    };
}

Validator.isConfirmed = function(selector, getConfirmValue, message) {
    return {
        selector: selector,
        test: function(value) {
            return value === getConfirmValue() ? undefined : message;
        }
    };
}
