// validateName function
// name must be more than 3 char, and no number, in case of two word names no extraspace between words
function validate_name(name) {
  var nameArray = name.split(" ");
  for (var i = 0; i < nameArray.length; i++) {
    nameArray[i] = /^[a-z]+$/i.test(nameArray[i]);
  }
  if (name.length > 3) nameArray.push(true);
  else nameArray.push(false);
  if (trueChecker(nameArray)) {
    return;
  } else {
    return false;
  }
}

// validate ssno
// length == 9 and no chars
function validate_ssno(ssno) {
  if (ssno.length == 9 && /^[0-9]+$/i.test(ssno) && Number(ssno)>=100000000) return;
  else return false;
}

// validate age
function validate_age(age) {
  var age = Number(age);
  if (age > 0 && age < 120) return;
  else return false;
}

// validate_address function
function validate_address(address) {

  var nu_space = address.split(" ").length - 1;
  if (address.length - nu_space >= 5) {
    return;
  } else return false;
}

function validate_city(city) {
  if (/^[a-zA-Z ]*$/i.test(city) && city.length > 3) return;
  else return false;
}

function validate_state(state) {
  if (/^[a-zA-Z ]*$/i.test(state) && state.length > 3) return;
  else return false;
}

function validate_patient_id(patient_id) {
  if (Number(patient_id) >= 200000000) return;
  else return false;
}

function validate_quantity(quantity) {
  if (/^[a-z]+$/i.test(quantity)) return false;
  else if (Number(quantity) > 0) return;
  else return false;
}

let trueChecker = (arr) => arr.every((v) => v === true);