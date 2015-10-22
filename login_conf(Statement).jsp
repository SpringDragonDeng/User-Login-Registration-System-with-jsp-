<%@ page contentType="text/html;charset=gb2312"%>
<%-- 导入java.sql包，表示要使用数据库操作 --%>
<%@ page import="java.sql.*"%>
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
	<%
		// 接收请求的内容
		String name = request.getParameter("uname") ;
		String password = request.getParameter("upassword") ;

		// 定义变量，如果用户是合法用户，则将此标记变为true
		boolean flag = false ;
	%>
	<%
		// 定义数据库操作的常量、对象
		// 数据库驱动程序
		final String DBDRIVER	= "oracle.jdbc.driver.OracleDriver" ;
		// 数据库连接地址
		final String DBURL		= "jdbc:oracle:thin:@localhost:1521:mldn" ;
		// 数据库用户名
		final String DBUSER		= "scott" ;
		// 数据库连接密码
		final String DBPASSWORD	= "tiger" ;
		// 声明一个数据库连接对象
		Connection conn			= null ;
		// 声明一个数据库操作对象
		Statement stmt			= null ;
		// 声明一个结果集对象
		ResultSet rs			= null ;
		// 声明一个SQL变量，用于保存SQL语句
		String sql = null ;
	%>
	<%
		// 进行数据库操作
		try
		{
			// 加载驱动程序
			Class.forName(DBDRIVER) ; 
			// 连接数据库
			conn = DriverManager.getConnection(DBURL,DBUSER,DBPASSWORD) ;
			// 实例化数据库操作对象
			stmt = conn.createStatement() ;
			// 编写SQL语句
			sql = "SELECT name FROM person WHERE id='"+name+"' and password='"+password+"'" ;
			System.out.println(sql) ;
			// 查询记录
			rs = stmt.executeQuery(sql) ;
			// 判断是否有记录
			if(rs.next())
			{
				// 如果有记录，则执行此段代码
				// 用户是合法的，可以登陆
				flag = true ;
			}
			// 依次关闭
			rs.close() ;
			stmt.close() ;
			conn.close() ;
		}
		catch(Exception e)
		{}
	%>
	<%
		// 判断用户名及密码
		if(flag)		
		{
			// 合法用户
	%>
			<jsp:forward page="login_success.jsp"/>
	<%
		}
		else
		{
			// 非法用户
	%>
			<jsp:forward page="login_failure.jsp"/>
	<%
		}
	%>
</center>
</body>
</html>