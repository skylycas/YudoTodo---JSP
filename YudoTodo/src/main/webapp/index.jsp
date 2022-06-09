<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@page import="java.sql.Connection,
   java.sql.Connection,
   java.sql.Statement,
   java.io.PrintWriter,
   java.io.IOException,
   java.sql.DriverManager,
   java.sql.ResultSet"%>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Yudo Todo</title>
	<jsp:include page="links.html"></jsp:include>
</head>
<body>

	<jsp:include page="header.html"></jsp:include>
	

		<%
			ResultSet resultset = null;
			Connection con = null;
			String retVal = "";
			String username = request.getParameter("username");		
			String password = request.getParameter("password");
			if(username != null && password != null)
			{
				try
				{
					Class.forName("com.mysql.jdbc.Driver");
					con = DriverManager.getConnection("jdbc:mysql://localhost:3306/todo","root","");
					Statement selectQuery = con.createStatement();
					resultset = selectQuery.executeQuery("SELECT * FROM users Where username='"+username+"' and password='"+password+"'");
					if(resultset.next())
					{
						session.setAttribute("username", resultset.getString("username"));
						session.setAttribute("firstname", resultset.getString("first_name"));
						response.sendRedirect("todolist.jsp");
					}
					else
					{
						retVal = "Invalid username or password";
					}
				}
				catch (Exception e) {
					out.print(e.getMessage());
				}
			}			
		%>
	
	
	<div class="container" style="overflow: auto">
		
		<form action="" method="post">
			<div id="box">
				<%
					if(!retVal.equals(""))
					{
				%>
				<div class="alert alert-success center mt-5 maxwidth" role="alert">
					<p><%=retVal %></p>
				</div>
				<%
					}
				%>
				<div class="card border-danger mb-3 mt-5 maxwidth">
				  <div class="card-header">
				  	<h1>Login</h1>
				  </div>
					 <div class="card-body">
					    <!-- <h4 class="card-title">Danger card title</h4> -->
						<div class="form-group">
							<input type="text" class="form-control" id="username" placeholder="User Name" name="username" required>
						</div>
			
						<div class="form-group">
							<input type="password" class="form-control" id="password" placeholder="Password" name="password" required>
						</div>
						
						<input type="submit" class="btn btn-lg btn-primary" value="login">
				  	</div>
				</div>
			</div>
		</form>
	</div>
	<jsp:include page="footer.html"></jsp:include>
</body>
</html>