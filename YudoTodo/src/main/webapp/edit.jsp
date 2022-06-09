<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.Connection,
   java.sql.Connection,
   java.sql.Statement,
   java.io.PrintWriter,
   java.io.IOException,
   java.sql.DriverManager,
   java.sql.ResultSet"%>
<html>
<head>
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
			
			String action = request.getParameter("action");
			String todoid = request.getParameter("todoid");
			Connection con = null;
			String retVal = "";
			ResultSet resultset = null;
			
			if(action != null && action.equals("Update"))
			{
				String title = request.getParameter("title");
				String description = request.getParameter("description");
				String isDone = request.getParameter("isDone") ;		
				String targetDate = request.getParameter("targetDate");				
				todoid = request.getParameter("todoid");
				if(title != null && description != null && targetDate != null)
				{
					try
					{
						String username = session.getAttribute("username").toString();
						Class.forName("com.mysql.jdbc.Driver");
						con = DriverManager.getConnection("jdbc:mysql://localhost:3306/todo","root","");
						Statement insertQuery = con.createStatement();
						insertQuery.executeUpdate("Update todos Set is_done='"+isDone+"' Where id='"+todoid+"'");
						retVal = title + " Updated Successfully!";
						response.sendRedirect("todolist.jsp");
					}
					catch (Exception e) {
						retVal = e.getMessage();
					}
				}
			}
			
		%>
	
	<div class="container col-md-5 mt-5">
		<div class="alert alert-success center mt-5" role="alert">
			<p><%=retVal %></p>
		</div>
		<div class="card border-danger">
			<div class="card-header">
			  	<h1>Update Todo</h1>
			</div>
			<div class="card-body">
				<%
					if (action != null && action.equals("Edit"))
					{
						try
						{
							Class.forName("com.mysql.jdbc.Driver");
							con = DriverManager.getConnection("jdbc:mysql://localhost:3306/todo","root","");
							Statement selectQuery = con.createStatement();
							resultset = selectQuery.executeQuery("SELECT * FROM todos where id='"+todoid+"'");
							if(resultset.next())
							{
								String title = resultset.getString("title");
								String description = resultset.getString("description");
								String targetDate = resultset.getString("target_date");
				%>
								
								<form action="" method="post">
									<fieldset class="form-group">
										<input readonly="readonly" type="text" value="<%=title %>" class="form-control" name="title" placeholder="Title" required="required" minlength="5">
									</fieldset>
					
									<fieldset class="form-group">
										<input readonly="readonly" type="text" value="<%=description %>" class="form-control" name="description" placeholder="Description" required="required" minlength="5">
									</fieldset>
					
									<fieldset class="form-group">
										<label>Todo Status</label> <select class="form-control"
											name="isDone">
											<option value="In Progress">In Progress</option>
											<option value="Complete">Complete</option>
										</select>
									</fieldset>
					
<%-- 									<fieldset class="form-group">
										<label>Todo Target Date</label> <input type="date"
											value="<%=targetDate %>" class="form-control"
											name="targetDate" required="required">
									</fieldset> --%>
										<input type="hidden" name="todoid" value="<%=todoid %>">
<!-- 									<button type="submit" class="btn btn-success" name="Update"> Save</button> -->
									<input id="button" type="submit" name="action" value="Update" class="btn btn-success">
								</form>
								
				<%
							}
						}
						catch (Exception e) {
							retVal = e.getMessage();
						}
					}					
				%>
			</div>
		</div>
	</div>

	<jsp:include page="footer.html"></jsp:include>
</body>
</html>
