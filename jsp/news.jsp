


<%@page import="java.util.ArrayList"%>
<%@page import="vn.edu.hcmiu.scse.mypractice.news.news"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>news today</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <style>
    /* Remove the navbar's default rounded borders and increase the bottom margin */ 
    .navbar {
      margin-bottom: 50px;
      border-radius: 0;
    }
    
    /* Remove the jumbotron's default bottom margin */ 
     .jumbotron {
      margin-bottom: 0;
    }
   
    /* Add a gray background color and some padding to the footer */
    footer {
      background-color: #f2f2f2;
      padding: 25px;
    }
  </style>
</head>
<body>

    <%
       ArrayList<news> ln = (ArrayList<news>) session.getAttribute("ln");
    %>

<div class="jumbotron">
  <div class="container text-center">
    <h1>FEATURED POSTS</h1>      
    
  </div>
</div>


<div class="container">    
  <div class="row">
   
      <% 
    if(ln!=null)  for(int i = 0 ; i < ln.size() ; i ++)
      {
      %>
      <div class="col-sm-4">
      <div class="panel panel-primary">
          <div class="panel-heading">title <%=ln.get(i).getTitile()  %> </div>
        <div class="panel-body"><img src="<%=ln.get(i).getIm()  %>" class="img-responsive" style="width:100%" alt="Image"></div>
        <div class="panel-footer"><%=ln.get(i).getDate()%></div>
        <form>
            <input type="hidden" name="gotonews" value="<%=i%>">
        <button type="submit" name="action" value="readmore" >read more </button> 
        </form>
      </div>
    </div>
      
      <% } 
else {  
      
      %>
            run serverlet first <% } %>
 </div>
</div>
      
      <br>



</body>
</html>
