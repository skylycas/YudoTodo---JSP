<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.Connection,
   java.sql.Connection,
   java.sql.Statement,
   java.io.PrintWriter,
   java.io.IOException,
   java.sql.DriverManager,
   java.sql.ResultSet, java.io.*, java.util.*, javax.mail.*, javax.mail.internet.*,com.sun.mail.smtp.*"%>
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
	<jsp:include page="header2.jsp"></jsp:include>
	
		<%
			String retVal= "";
			String to = "yudotestmail@gmail.com";
			String from = request.getParameter("email");
			String subject = request.getParameter("Subject");
			String message = request.getParameter("message");
			
			if(from != null && !from.equals(""))
			{
			
				/* String host= "smtp.gmail.com";
				String user= "yudotestmail@gmail.com";
				String pass = "Godwithus1";
				
				
				Properties prop = new Properties();
				
				prop.put("mail.smtp.host", host);
				
				
	/* 			String host="", user="", pass="";
				host = "smtp.gmail.com"; user = "sugam.k.sharma@gmail.com"; //"
				YourEmailId@gmail.com" // email id to send the emails */
				/* String SSL_FACTORY = "javax.net.ssl.SSLSocketFactory"; */
				/* String to = "something@gmail.com"; // out going email id
				String from = "something@gmail.com"; //Email id of the recipient */
				/* String subject = subject; */
				/* String messageText = message;//messageString; */
				/* String fileAttachment = ""; */
				/* boolean WasEmailSent ;
				boolean sessionDebug = true;
				Properties props = System.getProperties();
				props.put("mail.host", host);
				props.put("mail.transport.protocol.", "smtp");
				props.put("mail.smtp.auth", "true");
				props.put("mail.smtp.", "true");
				props.put("mail.smtp.port", "465");
				props.put("mail.smtp.socketFactory.fallback", "false");
				props.put("mail.smtp.socketFactory.class", SSL_FACTORY);
				Session mailSession = Session.getDefaultInstance(props, null);
				mailSession.setDebug(sessionDebug);
				Message msg = new MimeMessage(mailSession);
				msg.setFrom(new InternetAddress(from));
				InternetAddress[] address = {new InternetAddress(to)};
				msg.setRecipients(Message.RecipientType.TO, address);
				msg.setSubject(subject);
				msg.setContent(messageText, "text/html") */; // use setText if you want to send text
				/* DataSource source = new FileDataSource(fileAttachment); */
				/* msg.setDataHandler(new DataHandler(source)); */
				/* msg.setFileName("Sugam.txt"); */
				/* Transport transport = mailSession.getTransport("smtp");
				transport.connect(host, user, pass);
				retVal = "Message Sent";
				try {
				transport.sendMessage(msg, msg.getAllRecipients());
				WasEmailSent = true; // assume it was sent
				}
				catch (Exception err) {
				WasEmailSent = false; 
				}
				transport.close();  */
				
				retVal = "Message Sent!";
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
						  <div class="card-header"><h1>Contact us</h1></div>
							 <div class="card-body">						    
								<div class="form-group">
									<input type="text" class="form-control" id="fullname" placeholder="Full Name"	name="fullname" required>
								</div>
			
								<div class="form-group">
									<input type="text" class="form-control" id="email" placeholder="Email" name="email" required>
								</div>
			
								<div class="form-group">
									<input type="text" class="form-control" id="subject" placeholder="Subject" name="subject" required>
								</div>
			
								<div class="form-group">
									<textarea class="form-control" rows="7" placeholder="Message" name="message"></textarea>
								</div>
								
								<input type="submit" class="btn btn-lg btn-primary" name="action" value="send">
						  	</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	<jsp:include page="footer.html"></jsp:include>
</body>
</html>