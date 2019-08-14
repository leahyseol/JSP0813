<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>register a new member</title>
<script>
	function check() {
		if (frm.id.value == '') {
			alert('Put ID');
			frm.id.focus();
			return false;
		}

		if (!(frm.id.value.length >= 3 && frm.id.value.length <= 13)) {
			alert('Make sure it is at least 3 characters and less than 13 characters');
			frm.id.select();
			return false;
		}
		if (frm.passwd.value == '') {
			alert('You must put password');
			frm.passwd.focus();
			return false;
		}
		if (frm.name.value == '') {
			alert('You must put your name');
			frm.name.focus();
			return false;
		}

		return true;

	}
</script>
</head>
<body>
	<h1>register a new member</h1>
	<form name="frm" action="joinProcess.jsp" method="post"
		onsubmit="return check();">

		<fieldset>
			<legend>mandatory</legend>
			ID: <input type="text" name="id" /><br> PW: <input
				type="password" name="passwd" /><br> Name: <input type="text"
				name="name" /><br>
		</fieldset>

		<fieldset>
			<legend>selected </legend>
			Age: <input type="text" name="age" /><br> Gender: <input
				type="radio" name="gender" value="M" />MALE <input type="radio"
				name="gender" value="F" />FEMALE<br> Email: <input
				type="email" name="email" /><br>

		</fieldset>

		<button type="submit">get a membership</button>

		</from>
</body>
</html>

