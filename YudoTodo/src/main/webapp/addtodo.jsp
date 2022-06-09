<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

<body>
	<jsp:include page="header2.jsp"></jsp:include>
		<%
			if(session.getAttribute("username") == null)
			{
				response.sendRedirect("index.jsp");
			} 
			String title = request.getParameter("title");
			String description = request.getParameter("description");
			String isDone = request.getParameter("isDone") ;		
			String targetDate = request.getParameter("targetDate");			
			Connection con = null;
			String retVal = "";
			if(title != null && description != null && targetDate != null)
			{
				try
				{
					String username = session.getAttribute("username").toString();
					Class.forName("com.mysql.jdbc.Driver");
					con = DriverManager.getConnection("jdbc:mysql://localhost:3306/todo","root","");
					Statement insertQuery = con.createStatement();
					insertQuery.executeUpdate("INSERT INTO todos(title, description, is_done, target_date, username) VALUES('"+title+"','"+description+"', '"+isDone+"', '"+targetDate+"', '"+username+"')");
					retVal = title + " addedd Successfully!";
				}
				catch (Exception e) {
					retVal = e.getMessage();
				}
			}
		%>
	
	<div class="container col-md-5 mt-5">
		<%
			if(!retVal.equals(""))
			{
		%>
				
		<div class="alert alert-success center mt-5" role="alert">
			<p><%=retVal %></p>
		</div>
		<%
			}
		%>
		<div class="card border-danger">
			<div class="card-header">
			  	<h1>Add new Todo</h1>
			</div>
			<div class="card-body">
				<form action="" method="post">
					<fieldset class="form-group">
						<input type="text" value="" class="form-control" name="title" placeholder="Title" required="required" minlength="5">
					</fieldset>
	
					<fieldset class="form-group">
						<input type="text" value="" class="form-control" name="description" placeholder="Description" required="required" minlength="5">
					</fieldset>
	
					<fieldset class="form-group">
						<label>Todo Status</label> <select class="form-control"
							name="isDone">
							<option value="In Progress">In Progress</option>
							<option value="Complete">Complete</option>
						</select>
					</fieldset>
	
					<fieldset class="form-group">
						<label>Todo Target Date</label> <input type="date"
							value="" class="form-control"
							name="targetDate" required="required">
					</fieldset>
	
					<button type="submit" class="btn btn-success">Save</button>
				</form>
			</div>
		</div>
	</div>

	<jsp:include page="footer.html"></jsp:include>
</body>
</html>
