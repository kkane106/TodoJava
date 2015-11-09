<%@ page language="java" 
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>New Todo</title>
  </head>
  <body>
	<div class="container">
	  <form method="POST" action="TodosController">
	  	<input type="hidden" name="todo" value="createTodo">
	    <input type="text" name="title" placeholder="Title"><br />
	    <input type="text" name="description" placeholder="Description"><br />
	    <input type="submit" value="Create">
	  </form>
	</div>
  </body>
</html>