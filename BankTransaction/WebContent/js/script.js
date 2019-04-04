/**
 * 
 */
function validateUsername(fld) {
	var illegalChars = /\W/;
	var value = document.getElementById(fld).value;
	var value1 = document.getElementById(fld);
	if (value == "" || value == null) {
		value1.style.background = '#f6f6d7';
		error = "You didn't enter a username.\n";
		document.getElementById("error").innerHTML = error;
		value1.value = "";

		return false;

	} else if ((value.length < 3)) {
		value1.style.border = 'red';
		error = "The username is the wrong length.\n";
		document.getElementById("error").innerHTML = error;
		// alert(error);
		value1.value = "";
		return false;

	} else if (illegalChars.test(value)) {
		value1.style.background = '#f6f6d7';
		error = "The username contains illegal characters.\n";
		document.getElementById("error").innerHTML = error;
		value1.value = "";
		// alert(error);
		return false;

	} else {
		document.getElementById("error").innerHTML = "";
		value1.style = 'none';
	}
}

function validatePhone(fld) {
	var value = document.getElementById(fld).value;
	var value1 = document.getElementById(fld);
	var error = "";
	var stripped = value1.value.replace(/[\(\)\.\-\ ]/g, '');

	if (value == "") {
		error = "You didn't enter a value.\n";
		value1.style.background = '#f6f6d7';
		document.getElementById("error").innerHTML = error;
		value1.value = "";
		return false;

	} else if (isNaN(parseInt(stripped))) {
		error = "The enter value contains illegal characters. Don't include dash (-)\n";
		value1.style.background = '#f6f6d7';
		document.getElementById("error").innerHTML = error;
		value1.value = "";
		return false;
	} else if (!(stripped.length == 10)) {
		error = "The enter value is the wrong length.";
		value1.style.background = '#f6f6d7';
		document.getElementById("error").innerHTML = error;
		value1.value = "";
		return false;
	} else {
		document.getElementById("error").innerHTML = "";
		value1.style = 'none';
	}
	return true;
}

function ValidateEmail(m) {
	var mail = document.getElementById(m).value;
	var value1 = document.getElementById(m);
	if (/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(mail)) {
		document.getElementById("error").innerHTML = "";
		value1.style = 'none';
		return true;
	}
	document.getElementById("error").innerHTML = "You have entered an invalid email address!";
	value1.value = "";
	value1.style.background = '#f6f6d7';
	return false;
}
