<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.Connection,
   java.sql.Connection,
   java.sql.Statement,
   java.io.PrintWriter,
   java.io.IOException,
   java.sql.DriverManager,
   java.sql.ResultSet"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Yudo Todo</title>
	<jsp:include page="links.html"></jsp:include>
</head>

</head>
<body>
	<jsp:include page="header.html"></jsp:include>
	
	
		<%			
			String firstName = request.getParameter("firstName");
			String lastName = request.getParameter("lastName");
			String username = request.getParameter("username");		
			String password = request.getParameter("password");
			Connection con = null;
			String retVal = "";
			if(firstName != null && lastName != null && username != null && password != null)
			{
				try
				{
					Class.forName("com.mysql.jdbc.Driver");
					con = DriverManager.getConnection("jdbc:mysql://localhost:3306/todo","root","");
					Statement insertQuery = con.createStatement();
					insertQuery.executeUpdate("INSERT INTO users(first_name, last_name, username, password) VALUES('"+firstName+"','"+lastName+"', '"+username+"', '"+password+"')");
					retVal = "User Registered Successfully!";
				}
				catch (Exception e) {
					retVal = e.getMessage();
				}
			}
		%>
		
		
	<div class="container">

		<div >
			
				<form action="" method="post">
					<div id="box">
						<%
							if(!retVal.equals(""))
							{
						%>
						<div class="alert alert-success center mt-5" role="alert maxwidth" >
							<p><%=retVal %></p>
						</div>
						<%
							}
						%>
						<div class="card border-danger mb-3 mt-5 maxwidth">
						  <div class="card-header"><h1>Sign Up</h1></div>
							 <div class="card-body">						    
								<div class="form-group">
									<input type="text" class="form-control" id="uname" placeholder="First Name"	name="firstName" required>
								</div>
			
								<div class="form-group">
									<input type="text" class="form-control" id="uname" placeholder="last Name" name="lastName" required>
								</div>
			
								<div class="form-group">
									<input type="text" class="form-control" id="username" placeholder="User Name" name="username" required>
								</div>
			
								<div class="form-group">
									<input type="password" class="form-control" id="password" placeholder="Password" name="password" required>
								</div>
								
								<input type="submit" class="btn btn-lg btn-primary">
						  	</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	<jsp:include page="footer.html"></jsp:include>
</body>
</html>