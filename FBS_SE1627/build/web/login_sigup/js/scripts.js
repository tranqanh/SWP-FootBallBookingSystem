const loginText = document.querySelector(".title-text .login");
const loginForm = document.querySelector("form.login");
const loginBtn = document.querySelector("label.login");
const signupBtn = document.querySelector("label.signup");
const signupLink = document.querySelector("form .signup-link a");
signupBtn.onclick = (() => {
    loginForm.style.marginLeft = "-50%";
    loginText.style.marginLeft = "-50%";
});
loginBtn.onclick = (() => {
    loginForm.style.marginLeft = "0%";
    loginText.style.marginLeft = "0%";
});
signupLink.onclick = (() => {
    signupBtn.click();
    return false;
});
function CheckURL(check) {
    if(check.includes("Invalid")){
        signupLink.onclick();
    } else if(check.includes("Valid")){
        alert("Register success");
    }
}
// Hàm Validator
function Validator(options) {
    var selectorRules = {};
    // hàm thực hiện xác nhận lỗi 
    function validate(inputElement, rule) {
        var errorMessage;
        var errorElement = inputElement.parentElement.querySelector(options.errorSelector);
        
        //lấy ra các rule của selector 
        var rules = selectorRules[rule.selector];

        //lập ra từng rule và kiểm tra 
        //nếu có lỗi thì dừng việc kiểm tra 
        for(var i = 0; i < rules.length; ++i) {
            errorMessage = rules[i](inputElement.value);
            if(errorMessage) {
                break;
            }
        }
        if(errorMessage) {
            errorElement.innerText = errorMessage;
            inputElement.parentElement.classList.add('invalid');
        }
        else {
            errorElement.innerText = '';
            inputElement.parentElement.classList.remove('invalid');
        }

        return !errorMessage; // thành true false 
       
    }
    // lấy element của form cần để validate 
    var formElement = document.querySelector(options.form);
//    if(formElement) {
//        //khi submit form
//        formElement.onsubmit = function(e) {
//            e.preventDefault(); // không cho submit form
//            var isFormValid = true 
//            // lập qua các rule và check tất cả 
//            options.rules.forEach(function (rule) {
//                var inputElement = formElement.querySelector(rule.selector);
//                var isValid = validate(inputElement, rule);
//                if(!isValid) {
//                    isFormValid = false;
//                }
//            });
//
//            // nếu mọi thứ ok thì cho submit
//            if(isFormValid) {
//                formElement.submit();
//            } 
//        }
//    }
    
    //xử lý lập qua mỗi rule
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
                inputElement.parentElement.classList.remove('invalid');
            }
        }); 
    }

}
// định nghĩa rules cho form
Validator.isRequired = function(selector, message) {
    return {
        selector: selector,
        test: function(value) {
            return value.trim() ? undefined : message || 'Vui lòng nhập vào ô này';
        }
    };
}

Validator.isEmail = function(selector, message) {
    return {
        selector: selector,
        test: function(value) {
            var regax = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
            return regax.test(value) ? undefined : message;
        }
    };
}

Validator.isPhone = function(selector, message) {
    return {
        selector: selector,
        test: function(value) {
            var regax = /^(0[2345679][0-9]{8}|1[89]00[0-9]{4})$/ ;
            return regax.test(value) ? undefined : message;
        }
    };
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