<%@page contentType="text/html;charset=gb2312"%>
<html>
<head>
	<title>登陆</title>
</head>
<body>
<center>
	<h1>登陆范例——用户名及密码固定</h1>
	<hr>
	<br>
	<br>
	<form action="login_conf.jsp" method="post">
	<table>
		<tr>
			<td colspan="2">用户登陆</td>
		</tr>
		<tr>
			<td>用户名：</td>
			<td><input type="text" name="uname"></td>
		</tr>
		<tr>
			<td>密&nbsp;&nbsp;码：</td>
			<td><input type="password" name="upassword"></td>
		</tr>
		<tr>
			<td colspan="2">
			<input type="submit" value="登陆">
			<input type="reset" value="重置">
			</td>
		</tr>
	</table>
	</form>
</center>
</body>
</html>