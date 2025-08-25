<%@include file="header.html"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<style>
img{
  width:100%;
  height:609px;
}
</style>
</head>
<body>
<br>
<div style="max-width:100%">
  <img class="mySlides" src="welcome.jpg" >
  <img class="mySlides" src="slide1.jpg" >
  <img class="mySlides" src="slide2.png" >
</div>

<script>
var myIndex = 0;
carousel();
function carousel() {
    var i;
    var x = document.getElementsByClassName("mySlides");
    for (i = 0; i < x.length; i++) {
       x[i].style.display = "none";  
    }
    myIndex++;
    if (myIndex > x.length) {myIndex = 1}    
    x[myIndex-1].style.display = "block";  
    setTimeout(carousel, 2000); // Change image every 2 seconds
}
</script>

<br>
<%
  String msg=request.getParameter("msg");
  if("valid".equals(msg)) {
%>
   <center><font color="green" size="5">Form Submitted Successfully. You will get notified within 6 hours.</font></center>
<%
  } else if("invalid".equals(msg)) {
%>
   <center><font color="red" size="5">Invalid Data, try again</font></center>
<%
  }
%>

<center><h1>Enter Your Details to Request For Blood</h1></center>
<form action="indexFormAction.jsp" method="post">
 <center>
   <input type="text" name="name" placeholder="Enter Name" required>
   <input type="text" name="mobilenumber" placeholder="Enter Mobile Number" required>
   <input type="mail" name="email" placeholder="Enter Email Address" required>
   <input type="text" name="bloodgroup" placeholder="Enter Blood Group" required>
   <br><br>
   <button class="button1" type="submit"><span>Submit</span></button>
 </center>
</form>

<br><br>
<h3><center>All Right Reserved @2025</center></h3>
</body>
</html>
