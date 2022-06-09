<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.Connection,
   java.sql.Connection,
   java.sql.Statement,
   java.io.PrintWriter,
   java.io.IOException,
   java.sql.DriverManager,
   java.sql.ResultSet"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Locale"%>
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
			String action = request.getParameter("action");
			String todoid = request.getParameter("todoid");
			String retVal = "";
			if(action != null && action.equals("Delete"))
			{
				Connection con = null;
				try
				{
					Class.forName("com.mysql.jdbc.Driver");
					con = DriverManager.getConnection("jdbc:mysql://localhost:3306/todo","root","");
					Statement insertQuery = con.createStatement();
					insertQuery.executeUpdate("Delete From todos Where id='"+todoid+"'");
					retVal = "Deleted Successfully!";
				}
				catch (Exception e) {
					retVal = e.getMessage();
				}
			}
	%>
	
		<div id="box">
			<div class="card border-danger mb-3 mt-5 maxwidth">
			  <div class="card-header">
			  	<h1>List of Todos</h1>
			  </div>
				 <div class="card-body">
					<div class="row">
				
						<div class="container">
							<div class="container text-left">
				
								<a href="addtodo.jsp"
									class="btn btn-success">Add Todo</a>
							</div>
							<br>
							<table class="table table-bordered">
								<thead>
									<tr>
										<th>Title</th>
										<th>Target Date</th>
										<th>Todo Status</th>
										<th>Actions</th>
									</tr>
								</thead>
								<tbody>
									<!--   for (Todo todo: todos) {  -->
									
									<%
										SimpleDateFormat ft =  new SimpleDateFormat ("EEEEE dd MMMMM yyyy");
										ResultSet resultset = null;
										Connection con = null;
/* 										try
										{
											session.getAttribute("username").toString();
										}
										catch (Exception e) {
											response.sendRedirect("index.jsp");
										}	 */									
										try
										{
											String username = session.getAttribute("username").toString();
											Class.forName("com.mysql.jdbc.Driver");
											con = DriverManager.getConnection("jdbc:mysql://localhost:3306/todo","root","");
											Statement selectQuery = con.createStatement();
											resultset = selectQuery.executeQuery("SELECT * FROM todos Where username='"+username+"'");
											while(resultset.next())
											{
												String id = resultset.getString("id");
												String description = resultset.getString("description");
												String isdone = resultset.getString("is_done");
												Date targetdate = resultset.getDate("target_date");
												String title = resultset.getString("title");
									%>
												<tr>
													<td><%=title %></td>
													<td><%=ft.format(targetdate) %></td>
													<td><%=isdone %></td>											
													<td>
													<div id="boxsmall">
														<form action="edit.jsp"  method="post">
															<input type="hidden" name="todoid" value="<%=id %>">
															<% if(isdone.equals("Complete")) 
															{ 
																%>
																	<input disabled id="button" type="submit" name="action" value="Edit" class="btn btn-success">
															<%
															}
															else
															{
															%>
																<input id="button" type="submit" name="action" value="Edit" class="btn btn-success">
															<%
															}
															%>															
														</form>
													</div>
													<div id="boxsmall">
														<form action="todolist.jsp"  method="post">
															<input type="hidden" name="todoid" value="<%=id %>">
															<input id="button" type="submit" name="action" value="Delete" class="btn btn-success">
														</form>
													</div>
<%-- 														<a href="edit?id=<%=id %>">Edit</a>&nbsp;&nbsp;&nbsp;&nbsp; 
														<a href="delete?id=<%=id %>">Delete</a> --%>
													</td>
												</tr>
									<%
											}
									}
										catch (Exception e) {
											out.print(e.getMessage());
										}
									%>
									
									
									
									
									<%-- 
									<c:forEach var="todo" items="${listTodo}">
				
										<tr>
											<td><c:out value="${todo.title}" /></td>
											<td><c:out value="${todo.targetDate}" /></td>
											<td><c:out value="${todo.status}" /></td>
				
											<td><a href="edit?id=<c:out value='${todo.id}' />">Edit</a>
												&nbsp;&nbsp;&nbsp;&nbsp; <a
												href="delete?id=<c:out value='${todo.id}' />">Delete</a></td>
				
											<!--  <td><button (click)="updateTodo(todo.id)" class="btn btn-success">Update</button>
				          							<button (click)="deleteTodo(todo.id)" class="btn btn-warning">Delete</button></td> -->
										</tr>
									</c:forEach>
									<!-- } --> --%>
								</tbody>
				
							</table>
						</div>
					</div>
				 	
			  	</div>
			</div>
		</div>
	<jsp:include page="footer.html"></jsp:include>
</body>
</html>
