<!DOCTYPE html>
<!--[if lt IE 7 ]><html class="ie ie6" lang="en"> <![endif]-->
<!--[if IE 7 ]><html class="ie ie7" lang="en"> <![endif]-->
<!--[if IE 8 ]><html class="ie ie8" lang="en"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!--><html lang="en"> <!--<![endif]-->
<head>
  <meta charset="utf-8">
  <title>Log In | Chopsticks &amp; Spoon</title>
  <meta name="description" content="">
  <meta name="author" content="">  
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1"> 
  <link rel="stylesheet" href="css/style.css">
  <link rel="icon" href="images/favicon.ico">
</head>
<body id="body_login">
<!--LOGIN START-->
<div class="wrap">
  <div class="wrapLogin">  
    <hgroup>
      <h1>Chopsticks &amp; Spoon</h1>
      <h2>Inventory System</h2>
    </hgroup>
    <div>
      <h3>... please log in ...</h3>
      <form action="LoginServlet" method="POST">
        <ul>
        <li><input required type="text" name="username" placeholder="Username"></li>
        <li><input type="password" name="password" placeholder="Password"></li>
        <li><input type="submit" value="Log In"></li>
        </ul>
      </form>
    </div>
  </div>
</div>
<!--LOGIN END-->
</body>
</html>