<!DOCTYPE html>
<html lang="en">
<head>
  <title>add new page</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>

<div class="container">
  <h2 align="center">Add new </h2>
  <form class="form-horizontal" action="NewsServlet" method="post">
      <div class="form-group">
      <label class="control-label col-sm-2" for="id">id:</label>
      <div class="col-sm-10">          
        <input type="text" class="form-control" id="id" placeholder="Enter id (int)" name="id">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="tit">Title: </label>
      <div class="col-sm-10">
        <input type="text" class="form-control" id="tit" placeholder="Enter titile" name="tit">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="con">content: </label>
      <div class="col-sm-10">          
          <textarea class="form-control" id="con" placeholder="Enter content" name="con"> </textarea>
          
      </div>
    </div>
   <div class="form-group">
      <label class="control-label col-sm-2" for="au">author</label>
      <div class="col-sm-10">          
        <input type="text" class="form-control" id="au" placeholder="Enter author" name="au">
      </div>
    </div>
      <div class="form-group">
      <label class="control-label col-sm-2" for="date">date</label>
      <div class="col-sm-10">          
        <input type="text" class="form-control" id="date" placeholder="Enter date(year-month-day): " name="date">
      </div>
    </div>
      <div class="form-group">
      <label class="control-label col-sm-2" for="image">image</label>
      <div class="col-sm-10">          
        <input type="text" class="form-control" id="image" placeholder="Enter image's url(C:\test.jpg): " name="image">
      </div>
    </div>
    
    <div class="form-group">        
      <div class="col-sm-offset-2 col-sm-10">
         
        <button type="submit" class="btn btn-default" name="action" value="addnews">Submit</button>
      </div>
    </div>
  </form>
</div>

</body>
</html>
