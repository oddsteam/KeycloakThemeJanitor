function validatePassword() {
  var username = document.getElementById("username");
  var password = document.getElementById("password");
  var passwordValue = password.value.trim();
  var usernameValue = username.value.trim();
  var invalid_ = document.getElementById("input-error");

  if (passwordValue === "" && usernameValue === "") {
    clearError(["username", "password", "input-error"]);
    ValidateLogin(username, "Please enter your email", true);
    ValidateLogin(password, "Please enter your password", true);
    return false;
  } else {
    clearError(["username", "password", "input-error"]);
    if (usernameValue === "") {
      clearError(["username"]);
      ValidateLogin(username, "Please enter email", true);
      return false;
    }
    if (passwordValue === "") {
      clearError(["password"]);
      ValidateLogin(password, "Please enter password", true);
      return false;
    }
  }

  return true;
}
// custome error message login
document.addEventListener("DOMContentLoaded", function () {
  var password = document.getElementById("password");
  var invalid_ = document.getElementById("input-error");
  if (invalid_) {
    clearError(["username", "password"]);
    invalid_.remove();
    ValidateLogin(password, "Email or Password is incorrect");
  }
});

// onforget password state
if (window.location.href.indexOf("reset-credentials") > -1) {
  document.addEventListener("DOMContentLoaded", function () {
    var emailValidate = document.getElementById("input-error-username");
    var email = document.getElementById("username");
    if (emailValidate) {
      clearError(["username"]);
      emailValidate.remove();
      ValidateLogin(email, "Please enter your email");
    }
  });
}

// on update password state
else if (window.location.href.indexOf("execution=UPDATE_PASSWORD") > -1) {
  document.addEventListener("DOMContentLoaded", function () {
    var passwordLabel = document.querySelector('label[for="password-new"]');
    passwordLabel.textContent = "password";
    passwordLabel.classList.add("set-label-input");

    var header = document.createElement("div");
    header.textContent = "set password";
    header.classList.add("set-password-header");

    var Label = document.createElement("div");
    Label.textContent = "ตั้งรหัสผ่านและยืนยันรหัสผ่าน";
    Label.classList.add("set-password-label");

    header.appendChild(Label);

    passwordLabel.insertAdjacentElement("beforebegin", header);
    var confirmPasswordLabel = document.querySelector(
      'label[for="password-confirm"]'
    );
    confirmPasswordLabel.textContent = "ยืนยันรหัสผ่าน";
    confirmPasswordLabel.classList.add("set-label-input");
  });
  // set placeholder

  document.addEventListener("DOMContentLoaded", function () {
    var passwordInput = document.getElementById("password-new");
    var password_confirmInput = document.getElementById("password-confirm");

    if (passwordInput && password_confirmInput) {
      passwordInput.placeholder = "รหัสผ่าน";
      password_confirmInput.placeholder = "ยืนยันรหัสผ่าน";
    }
  });

  document.addEventListener("DOMContentLoaded", function (event) {
    var submitButton = document.querySelector('input[type="submit"]');
    submitButton.value = "ถัดไป";
    submitButton.addEventListener("click", validatePassword_UpdatePassword);
    var form = document.getElementById("kc-passwd-update-form");
    if (form) {
      form.addEventListener("submit", function (event) {
        if (!validatePassword_UpdatePassword()) {
          event.preventDefault();
        }
      });
    }
  });
}

function validatePassword_UpdatePassword(event) {
  var password = document.getElementById("password-new");
  var passwordConfirm = document.getElementById("password-confirm");
  var passwordValue = password.value.trim();
  var passwordConfirmValue = passwordConfirm.value.trim();
  var errorMessage = "";

  if (passwordValue === "" || passwordConfirmValue === "") {
    clearError(["password-new", "password-confirm"]);
    if (passwordValue === "") {
      errorMessage = "กรุณากรอกรหัสผ่าน";
      showErrorMessage(password, errorMessage, true);
    }
    if (passwordConfirmValue === "") {
      errorMessage = "กรุณากรอกยืนยันรหัสผ่าน";
      showErrorMessage(passwordConfirm, errorMessage, true);
    }
    return false;
  } else if (passwordValue !== passwordConfirmValue) {
    clearError(["password-new", "password-confirm"]);
    errorMessage = "รหัสผ่านและยืนยันรหัสผ่านไม่ตรงกัน";
    showErrorMessage(passwordConfirm, errorMessage, true);
    return false;
  } else if (!formater(passwordValue) || !formater(passwordConfirmValue)) {
    clearError(["password-new", "password-confirm"]);
    errorMessage =
      "รหัสผ่านต้องเป็นภาษาอังกฤษและมีความยาวอย่างน้อย 8 ตัวอักษร ตัวพิมพ์ใหญ่หนึ่งตัว, ตัวพิมพ์เล็กหนึ่งตัว และตัวเลขหนึ่งตัว";
    showErrorMessage(passwordConfirm, errorMessage, true);
    return false;
  } else {
    clearError(["password-new", "password-confirm"]);
    return true;
  }
}

//for setpassword
function showErrorMessage(element, message, withWarningIcon) {
  var errorMessageSpan = document.createElement("span");
  errorMessageSpan.textContent = message;
  errorMessageSpan.textContent = "\u00A0" + message;
  errorMessageSpan.classList.add(
    "pf-c-form__helper-text",
    "pf-m-error",
    "required",
    "kc-feedback-text"
  );
  if (withWarningIcon) {
    var warningIcon = document.createElement("i");
    warningIcon.classList.add("fas", "fa-exclamation-circle", "error-icon");
    errorMessageSpan.insertBefore(warningIcon, errorMessageSpan.firstChild);
  }
  element.insertAdjacentElement("afterend", errorMessageSpan);
}
function clearError(elementIds) {
  elementIds.forEach(function (id) {
    var element = document.getElementById(id);
    if (element && element.nextElementSibling) {
      element.parentNode.removeChild(element.nextElementSibling);
    }
  });
}
// for login
function ValidateLogin(element, message, withWarningIcon) {
  var errorMessageSpan = document.createElement("span");
  errorMessageSpan.textContent = "\u00A0" + message;
  errorMessageSpan.classList.add("login-validate");
  console.log(element.id);
  if (element.id == "username") {
    element = document.getElementById("username-border");
  } else {
    element = document.getElementById("password-border");
  }
  element.insertAdjacentElement("afterend", errorMessageSpan);
}

function formater(password) {
  var hasNumber = /\d/.test(password);
  var hasLowercase = /[a-z]/.test(password);
  var hasUppercase = /[A-Z]/.test(password);
  if (hasNumber && hasLowercase && hasUppercase && password.length >= 8) {
    return true;
  } else {
    return false;
  }
}
