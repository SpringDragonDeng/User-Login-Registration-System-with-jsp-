<%@ page contentType="text/html;charset=gb2312"%>
<%-- ����java.sql������ʾҪʹ�����ݿ���� --%>
<%@ page import="java.sql.*"%>
<html>
<head>
	<title>��½</title>
</head>
<body>
<center>
	<h1>��½���������û���������̶�</h1>
	<hr>
	<br>
	<br>
	<%
		// �������������
		String name = request.getParameter("uname") ;
		String password = request.getParameter("upassword") ;

		// �������������û��ǺϷ��û����򽫴˱�Ǳ�Ϊtrue
		boolean flag = false ;
	%>
	<%
		// �������ݿ�����ĳ���������
		// ���ݿ���������
		final String DBDRIVER	= "oracle.jdbc.driver.OracleDriver" ;
		// ���ݿ����ӵ�ַ
		final String DBURL		= "jdbc:oracle:thin:@localhost:1521:mldn" ;
		// ���ݿ��û���
		final String DBUSER		= "scott" ;
		// ���ݿ���������
		final String DBPASSWORD	= "tiger" ;
		// ����һ�����ݿ����Ӷ���
		Connection conn			= null ;
		// ����һ�����ݿ��������
		PreparedStatement pstmt	= null ;
		// ����һ�����������
		ResultSet rs			= null ;
		// ����һ��SQL���������ڱ���SQL���
		String sql = null ;
	%>
	<%
		// �������ݿ����
		try
		{
			// ��дSQL���
			sql = "SELECT name FROM person WHERE id=? and password=?" ;
			// ������������
			Class.forName(DBDRIVER) ; 
			// �������ݿ�
			conn = DriverManager.getConnection(DBURL,DBUSER,DBPASSWORD) ;
			// ʵ�������ݿ��������
			pstmt = conn.prepareStatement(sql) ;
			// ����pstmt������
			pstmt.setString(1,name) ;
			pstmt.setString(2,password) ;
			// ��ѯ��¼
			rs = pstmt.executeQuery() ;
			// �ж��Ƿ��м�¼
			if(rs.next())
			{
				// ����м�¼����ִ�д˶δ���
				// �û��ǺϷ��ģ����Ե�½
				flag = true ;
			}
			// ���ιر�
			rs.close() ;
			pstmt.close() ;
			conn.close() ;
		}
		catch(Exception e)
		{}
	%>
	<%
		// �ж��û���������
		if(flag)		
		{
			// �Ϸ��û�
	%>
			<jsp:forward page="login_success.jsp"/>
	<%
		}
		else
		{
			// �Ƿ��û�
	%>
			<jsp:forward page="login_failure.jsp"/>
	<%
		}
	%>
</center>
</body>
</html>