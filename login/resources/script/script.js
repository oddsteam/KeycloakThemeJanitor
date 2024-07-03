function validatePassword() {
  var username = document.getElementById("username");
  var password = document.getElementById("password");
  var passwordValue = password.value.trim();
  var usernameValue = username.value.trim();
  var invalid_ = document.getElementById("input-error");

  if (passwordValue === "" && usernameValue === "") {
    clearError(["username-border", "password-border", "input-error"]);
    ValidateLogin(username, "Please enter your email", true);
    ValidateLogin(password, "Please enter your password", true);
    return false;
  } else {
    clearError(["username-border", "password-border", "input-error"]);
    if (usernameValue === "") {
      clearError(["username-border"]);
      ValidateLogin(username, "Please enter email", true);
      return false;
    }
    if (passwordValue === "") {
      clearError(["password-border"]);
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
    clearError(["username-border", "password-border"]);
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
      clearError(["username-border"]);
      emailValidate.remove();
      ValidateLogin(email, "Please enter your email");
    }
  });
}

// on update password state
else if (window.location.href.indexOf("execution=UPDATE_PASSWORD") > -1) {
  document.addEventListener("DOMContentLoaded", function () {
    var passwordLabel = document.querySelector('label[for="password-new"]');

    var header = document.createElement("div");
    header.textContent = "Set new password";
    header.classList.add("reset-new-password");

    var Label = document.createElement("div");
    Label.classList.add("set-password-label");

    header.appendChild(Label);

    passwordLabel.insertAdjacentElement("beforebegin", header);
    var confirmPasswordLabel = document.querySelector(
      'label[for="password-confirm"]'
    );

    passwordLabel.textContent = "New Password";
    passwordLabel.classList.add("new-password-label-input");

    confirmPasswordLabel.textContent = "Confirm Password";
    confirmPasswordLabel.classList.add("new-password-label-input");

    // Create validation labels
    var form = document.getElementById("kc-passwd-update-form");
    var validationContainer = document.createElement("div");
    validationContainer.id = "password-validation";
    validationContainer.style.display = "none";
    validationContainer.style.width = "100%";
    validationContainer.style.backgroundColor = "#fafafa";
    validationContainer.style.border = "1px solid #ddd";
    validationContainer.style.borderRadius = "12px";
    validationContainer.style.padding = "10px";
    validationContainer.style.marginBottom = "8px";
    validationContainer.style.paddingLeft = "20px"
    validationContainer.style.fontSize = "14px"



    var criteria = [
      { id: "english-only", text: "Password must be in English or _!@&%$*#" },
      { id: "min-length", text: "Have at least 8 letters" },
      { id: "uppercase", text: "1 uppercase" },
      { id: "lowercase", text: "1 lowercase" },
      { id: "number", text: "1 number" }
    ];

    criteria.forEach(function (criterion) {
      var label = document.createElement("div");
      label.id = criterion.id;
      label.textContent = criterion.text;
      label.style.color = "#c3c3c3";  // Start with red color

      validationContainer.appendChild(label);
    });

    confirmPasswordLabel.insertAdjacentElement("beforebegin", validationContainer);

    var passwordInput = document.getElementById("password-new");
    passwordInput.addEventListener("focus", showValidationContainer);
    passwordInput.addEventListener("input", updateValidationLabels);


  });
  // set placeholder

  document.addEventListener("DOMContentLoaded", function () {
    var passwordInput = document.getElementById("password-new");
    var password_confirmInput = document.getElementById("password-confirm");

    if (passwordInput && password_confirmInput) {
      passwordInput.placeholder = "Password";
      password_confirmInput.placeholder = "Password";
    }
  });

  document.addEventListener("DOMContentLoaded", function (event) {
    var submitButton = document.querySelector('input[type="submit"]');
    submitButton.value = "Set Password";
    submitButton.classList.add("button-login");
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
      errorMessage = "Please enter your password";
      showErrorMessage(password, errorMessage, true);
    }
    if (passwordConfirmValue === "") {
      errorMessage = "Please confirm your password";
      showErrorMessage(passwordConfirm, errorMessage, true);
    }
    return false;
  } else if (passwordValue !== passwordConfirmValue) {
    clearError(["password-new", "password-confirm"]);
    errorMessage = "Passwords are not matched";
    showErrorMessage(passwordConfirm, errorMessage, true);
    return false;
  } else if (!formater(passwordValue) || !formater(passwordConfirmValue)) {
    clearError(["password-new", "password-confirm"]);
    errorMessage =
      "Invalid password format";
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
  return (
    /^[A-Za-z\d!+=\-_@&^%$#]*$/.test(password) &&
    password.length >= 8 &&
    hasNumber &&
    hasLowercase &&
    hasUppercase
  );
}

function updateValidationLabels() {
  var password = document.getElementById("password-new").value;
  var validationContainer = document.getElementById("password-validation");

  if (validationContainer) {
    validationContainer.style.display = "block";
  }

  document.getElementById("min-length").style.color = password.length >= 8 ? "green" : "#F43A29";
  document.getElementById("english-only").style.color = password.length > 0 && /^[A-Za-z\d!+=\_!@&%$*#/]*$/.test(password) ? "green" : "#F43A29";
  document.getElementById("uppercase").style.color = /[A-Z]/.test(password) ? "green" : "#F43A29";
  document.getElementById("lowercase").style.color = /[a-z]/.test(password) ? "green" : "#F43A29";
  document.getElementById("number").style.color = /\d/.test(password) ? "green" : "#F43A29";
}
function showValidationContainer() {
  var validationContainer = document.getElementById("password-validation");
  if (validationContainer) {
    validationContainer.style.display = "block";
  }
}

function hideValidationContainer() {
  var validationContainer = document.getElementById("password-validation");
  if (validationContainer) {
    validationContainer.style.display = "none";
  }
}
