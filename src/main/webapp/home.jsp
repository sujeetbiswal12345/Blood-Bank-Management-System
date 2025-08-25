<%@include file="header.html"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<style>
  body {
    margin: 0;
    min-height: 100vh;
    display: flex;
    flex-direction: column;
    font-family: Arial, sans-serif;
    background: #f9f9f9;
  }
  .content {
    flex: 1;
  }
  img {
    width:100%;
    height:609px;
    object-fit: cover;
  }
  h1, p {
    margin: 10px 0;
  }
  .footer {
    text-align: center;
    padding: 15px;
    background: #333;
    color: white;
    font-size: 14px;
    border-top: 3px solid #4CAF50;
  }
</style>
</head>
<body>
<div class="content">
  <br>
  <div style="max-width:100%">
    <img class="mySlides" src="welcome.jpg" >
    <img class="mySlides" src="admin.png" >
    <img class="mySlides" src="slide1.jpg" >
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
      setTimeout(carousel, 2000);
  }
  </script>

  <br>
  <center><h1>Welcome to the Blood Bank</h1></center>
  <center><p>Your one-stop portal to request blood, manage donors, and monitor stock.</p></center>
</div>

<div class="footer">All Right Reserved @2025</div>
</body>
</html>
