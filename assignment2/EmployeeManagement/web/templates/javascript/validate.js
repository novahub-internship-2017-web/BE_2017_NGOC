function validateUsername(){
    var username = document.getElementById("username").value;
    var usernameError = document.getElementById("usernameError");

    usernameError.innerHTML = "";

    if(username.length == 0){
        usernameError.innerText = "Username không được để trống";
        document.getElementById("username").style.border = "1px solid red";
        return false;
    }

    if(username.length < 6){
        usernameError.innerHTML = "Username phải có ít nhất 6 kí tự";
        document.getElementById("username").style.border = "1px solid red";
        return false;
    }

    if(username.length > 40){
        usernameError.innerHTML = "Username chỉ chứa tối đa 40 kí tự";
        document.getElementById("username").style.border = "1px solid red";
        return false;
    }

    for(i = 0 ; i < username.length; i++) {
        if (!(username.charCodeAt(i) >= 48 && username.charCodeAt(i) <= 57)
            && !(username.charCodeAt(i) >= 65 && username.charCodeAt(i) <= 90)
            && !(username.charCodeAt(i) >= 97 && username.charCodeAt(i) <= 122)) {
            usernameError.innerHTML = "Username chỉ chứa (a-z, A-Z, 0-9)";
            document.getElementById("username").style.border = "1px solid red";
            return false;
        }
    }

    document.getElementById("username").style.border = "";
    return true;
}

function validateCurrentPassword(){
    var currentPassword = document.getElementById("currentPassword").value;
    var currentPasswordError = document.getElementById("currentPasswordError");

    currentPasswordError.innerHTML = "";

    if(currentPassword.length == 0){
        currentPasswordError.innerHTML = "Current Password không được bỏ trống";
        document.getElementById("currentPassword").style.border = "1px solid red";
        return false;
    }

    if(currentPassword.length < 6){
        currentPasswordError.innerHTML = "Current Password phải có ít nhất 6 kí tự";
        document.getElementById("currentPassword").style.border = "1px solid red";
        return false;
    }

    if(currentPassword.length > 20){
        currentPasswordError.innerHTML = "Current Password chỉ chứa tối đa 20 kí tự";
        document.getElementById("currentPassword").style.border = "1px solid red";
        return false;
    }

    for(i = 0 ; i < currentPassword.length; i++) {
        if (!(currentPassword.charCodeAt(i) >= 48 && currentPassword.charCodeAt(i) <= 57)
            && !(currentPassword.charCodeAt(i) >= 65 && currentPassword.charCodeAt(i) <= 90)
            && !(currentPassword.charCodeAt(i) >= 97 && currentPassword.charCodeAt(i) <= 122)) {
            currentPasswordError.innerHTML = "Current Password chỉ chứa (a-z, A-Z, 0-9)";
            document.getElementById("currentPassword").style.border = "1px solid red";
            return false;
        }
    }

    document.getElementById("currentPassword").style.border = "";
    return true;
}

function validatePassword(){
    var password = document.getElementById("password").value;
    var passwordError = document.getElementById("passwordError");

    passwordError.innerHTML = "";

    if(password.length == 0){
        passwordError.innerHTML = "Password không được bỏ trống";
        document.getElementById("password").style.border = "1px solid red";
        return false;
    }

    if(password.length < 6){
        passwordError.innerHTML = "Password phải có ít nhất 6 kí tự";
        document.getElementById("password").style.border = "1px solid red";
        return false;
    }

    if(password.length > 20){
        passwordError.innerHTML = "Password chỉ chứa tối đa 20 kí tự";
        document.getElementById("password").style.border = "1px solid red";
        return false;
    }

    for(i = 0 ; i < password.length; i++) {
        if (!(password.charCodeAt(i) >= 48 && password.charCodeAt(i) <= 57)
            && !(password.charCodeAt(i) >= 65 && password.charCodeAt(i) <= 90)
            && !(password.charCodeAt(i) >= 97 && password.charCodeAt(i) <= 122)) {
            passwordError.innerHTML = "Password chỉ chứa (a-z, A-Z, 0-9)";
            document.getElementById("password").style.border = "1px solid red";
            return false;
        }
    }

    document.getElementById("password").style.border = "";
    return true;
}

function validateRepassword(){
    var repassword = document.getElementById("repassword").value;
    var password = document.getElementById("password").value;
    var repasswordError = document.getElementById("repasswordError");

    repasswordError.innerHTML = "";

    if(repassword != password){
        repasswordError.innerHTML = "2 password không khớp nhau";
        document.getElementById("repassword").style.border = "1px solid red";
        return false;
    }

    document.getElementById("repassword").style.border = "";
    return true;
}

function validateFullname(){
    var fullname = document.getElementById("fullname").value;
    var fullnameError = document.getElementById("fullnameError");

    fullnameError.innerHTML = "";

    if(fullname.length == 0){
        fullnameError.innerHTML = "Họ tên không được bỏ trống";
        document.getElementById("fullname").style.border = "1px solid red";
        return false;
    }

    if(fullname.length < 3){
        fullnameError.innerHTML = "Họ tên phải có ít nhất 3 kí tự";
        document.getElementById("fullname").style.border = "1px solid red";
        return false;
    }

    if(fullname.length > 50){
        fullnameError.innerHTML = "Họ tên chỉ chứa tối đa 50 kí tự";
        document.getElementById("fullname").style.border = "1px solid red";
        return false;
    }


    document.getElementById("fullname").style.border = "";
    return true;
}

function validateYearOfBirth(){
    var yearOfBirth = document.getElementById("yearOfBirth").value;
    var yearOfBirhtError = document.getElementById("yearOfBirthError");

    yearOfBirhtError.innerHTML = "";

    if(yearOfBirth.length == 0){
        yearOfBirhtError.innerHTML = "Năm sinh không được bỏ trống";
        document.getElementById("yearOfBirth").style.border = "1px solid red";
        return false;
    }

    for(i = 0; i < yearOfBirth.length; i++){
        if(!(yearOfBirth.charCodeAt(i) >= 48 && yearOfBirth.charCodeAt(i) <= 57)){
            yearOfBirhtError.innerHTML = "Năm sinh phải là số nguyên";
            document.getElementById("yearOfBirth").style.border = "1px solid red";
            return false;
        }
    }

    var yearOfNow = (new Date()).getFullYear();

    if(yearOfBirth > (yearOfNow - 18)){
        yearOfBirhtError.innerHTML = "Năm sinh không phù hợp";
        document.getElementById("yearOfBirth").style.border= "1px solid red";
        return false;
    }

    document.getElementById("yearOfBirth").style.border = "";
    return true;
}

function validateCountry(){
    var country = document.getElementById("country").value;
    var countryError = document.getElementById("countryError");

    countryError.innerHTML = "";

    if(country.length == 0){
        countryError.innerHTML = "Country không được bỏ trống";
        document.getElementById("country").style.border = "1px solid red";
        return false;
    }

    if(country.length < 3){
        countryError.innerHTML = "Country phải chứa ít nhất 3 kí tự";
        document.getElementById("country").style.border = "1px solid red";
        return false;
    }

    if(country.length > 50){
        countryError.innerHTML = "Country chỉ chứa tối đa 50 kí tự";
        document.getElementById("country").style.border = "1px solid red";
        return false;
    }

    document.getElementById("country").style.border = "";
    return true;
}

function validateDepartment(){
    var department = document.getElementById("department").value;
    var departmentError = document.getElementById("departmentError");

    departmentError.innerHTML = "";

    if(department.length == 0){
        departmentError.innerHTML = "Phòng ban không được bỏ trống";
        document.getElementById("department").style.border = "1px solid red";
        return;
    }

    if(department.length > 50){
        departmentError.innerHTML = "Phòng ban chỉ chứa tối đa 50 kí tự";
        document.getElementById("department").style.border = "1px solid red";
        return;
    }

    document.getElementById("department").style.border = "";
}

function validateDaysOfWork(){
    var daysOfWork = document.getElementById("daysOfWork").value;
    var daysOfWorkError = document.getElementById("daysOfWorkError");

    daysOfWorkError.innerHTML = "";

    if(daysOfWork.length == 0){
        daysOfWorkError.innerHTML = "Số ngày công không được bỏ trống";
        document.getElementById("daysOfWork").style.border = "1px solid red";
        return false;
    }

    for(i = 0; i < daysOfWork.length; i++){
        if(!(daysOfWork.charCodeAt(i) >= 48 && daysOfWork.charCodeAt(i) <= 57)){
            daysOfWorkError.innerHTML = "Số ngày công phải là số nguyên";
            document.getElementById("daysOfWork").style.border = "1px solid red";
            return false;
        }
    }

    document.getElementById("daysOfWork").style.border = "";
    return true;
}

function validateMajor(){
    var major = document.getElementById("major").value;
    var majorError = document.getElementById("majorError");

    majorError.innerHTML = "";

    if(major.length == 0){
        majorError.innerHTML = "Khoa không được để trống";
        document.getElementById("major").style.border = "1px solid red";
        return false;
    }

    if(major.length > 50){
        majorError.innerHTML = "Khoa chỉ chứa tối đa 50 kí tự";
        document.getElementById("major").style.border = "1px solid red";
        return false;
    }

    document.getElementById("major").style.border = "";
    return true;
}

function validateNumberOfLessons() {
    var numberOfLessons = document.getElementById("numberOfLessons").value;
    var numberOfLessonsError = document.getElementById("numberOfLessonsError");

    numberOfLessonsError.innerHTML = "";

    if(numberOfLessons.length == 0){
        numberOfLessonsError.innerHTML = "Số tiết  không được bỏ trống";
        document.getElementById("numberOfLessons").style.border = "1px solid red";
        return false;
    }

    for(i = 0; i < numberOfLessons.length; i++){
        if(!(numberOfLessons.charCodeAt(i) >= 48 && numberOfLessons.charCodeAt(i) <= 57)){
            numberOfLessonsError.innerHTML = "Số tiết dạy phải là số nguyên";
            document.getElementById("numberOfLessons").style.border = "1px solid red";
            return false;
        }
    }

    document.getElementById("numberOfLessons").style.border = "";
    return true;
}

function validateCoefficientsSalary() {
    var coefficientsSalary = document.getElementById("coefficientsSalary").value;
    var coefficientsSalaryError = document.getElementById("coefficientsSalaryError");

    coefficientsSalaryError.innerHTML = "";

    if(coefficientsSalary.length == 0){
        coefficientsSalaryError.innerHTML = "Hệ số lương không được bỏ trống";
        document.getElementById("coefficientsSalary").style.border = "1px solid red";
        return false;
    }

    var numberOfDoc = 0;

    for(i = 0; i < coefficientsSalary.length; i++){
        if(coefficientsSalary.charCodeAt(i) == 46){
            numberOfDoc++;
        }
    }

    if(numberOfDoc > 1){
        coefficientsSalaryError.innerText = "Hệ số lương phải là số";
        document.getElementById("coefficientsSalary").style.border = "1px solid red";
        return false;
    }
    else if(numberOfDoc == 1){
        if(coefficientsSalary.charCodeAt(0) == 46 || coefficientsSalary.charCodeAt(coefficientsSalary.length - 1) == 46){
            coefficientsSalaryError.innerText = "Hệ số lương phải là số";
            document.getElementById("coefficientsSalary").style.border = "1px solid red";
            return false;
        }
        else{
            for(i = 0; i < coefficientsSalary.length; i++){
                if(!(coefficientsSalary.charCodeAt(i) >= 48 && coefficientsSalary.charCodeAt(i) <= 57)
                    && !(coefficientsSalary.charCodeAt(i) == 46)){
                    coefficientsSalaryError.innerText = "Hệ số lương phải là số";
                    document.getElementById("coefficientsSalary").style.border = "1px solid red";
                    return false;
                }
            }
        }
    }
    else{
        for(i = 0; i < coefficientsSalary.length; i++){
            if(!(coefficientsSalary.charCodeAt(i) >= 48 && coefficientsSalary.charCodeAt(i) <= 57)){
                coefficientsSalaryError.innerText = "Hệ số lương phải là số";
                document.getElementById("coefficientsSalary").style.border = "1px solid red";
                return false;
            }
        }
    }

    document.getElementById("coefficientsSalary").style.border = "";
    return true;
}