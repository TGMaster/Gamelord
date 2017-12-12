<!DOCTYPE html>
<html lang="en">
<head>
  <title>news details</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <style>
    /* Set height of the grid so .sidenav can be 100% (adjust if needed) */
    .row.content {height: 1500px}
    
    /* Set gray background color and 100% height */
    .sidenav {
      background-color: #f1f1f1;
      height: 100%;
    }
    
    /* Set black background color, white text and some padding */
    footer {
      background-color: #555;
      color: white;
      padding: 15px;
    }
    
    /* On small screens, set height to 'auto' for sidenav and grid */
    @media screen and (max-width: 767px) {
      .sidenav {
        height: auto;
        padding: 15px;
      }
      .row.content {height: auto;} 
    }
  </style>
</head>
<body>

<div class="container-fluid">
  <div class="row content">
   
     <jsp:useBean id="news" scope="application" class="vn.edu.hcmiu.scse.mypractice.news.news" />
    <div class="col-sm-9">
      <h4 align="center"><small>><</small></h4>
      <hr>
      <h2> <jsp:getProperty name="news" property="titile" /></h2>
      <h5><span class="glyphicon glyphicon-time"></span> Post by <jsp:getProperty name="news" property="author" />, <jsp:getProperty name="news" property="date" />.</h5>
      <h5><button type="submit" class="label label-danger" >dislike</button>  <button type="submit"   class="label label-primary" >Like</button></h5><br>
      <p><jsp:getProperty name="news" property="content" /></p>
    
      <br><br>
   
      

      <h4>Leave a Comment:</h4>
      <form role="form">
        <div class="form-group">
          <textarea class="form-control" rows="3" required></textarea>
        </div>
        <button type="submit" class="btn btn-success">Submit</button>
      </form>
      <br><br>
      
   
    </div>
  </div>
</div>

<footer class="container-fluid">
  <p>xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx</p>
</footer>

</body>
</html>
