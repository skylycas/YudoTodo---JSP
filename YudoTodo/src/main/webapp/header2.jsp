<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
	<header>
	<%
		String name=(String)session.getAttribute("firstname");
		if(name == null)
		{
			response.sendRedirect("index.jsp");
		}
		else{
		name = "Welcome back ( " + name + " )";
		}
	%>
		<nav class="navbar navbar-expand-md navbar-dark"
			style="background-color: tomato">
			<div>
				<a href="" class="navbar-brand"> Yudo Todo</a>
			</div>
			<ul class="navbar-nav">
				<li><a href="todolist.jsp" class="nav-link">View Todos</a></li>
			</ul>
			
			<ul class="navbar-nav navbar-collapse justify-content-end">
				<li style="color: white; margin-right: 20px; text-transform: capitalize;"><%=name %></li>
				<li><a href="logout.jsp" class="nav-link">Logout</a></li>
				<li><a href="contact.jsp" class="nav-link">Contact</a></li>
			</ul>
		</nav>
	</header>