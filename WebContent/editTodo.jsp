<%@ page language="java" 
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"
         import="com.todo.Todo"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <% Todo todo = (Todo) request.getAttribute("todo"); %>
    <% if (todo != null) { %>
      <title><%= todo.getTitle() %></title>
    <% } %>
  </head>
  <body>
    <div class="container">
      <form method="POST" action="TodosController">
        <input type="hidden" name="todo" value="updateTodo">
        <input type="hidden" name="id" value="<%= request.getAttribute("id") %>">
        <input type="text" name="title" value="<%= todo.getTitle() %>"><br />
        <input type="text" name="description" value="<%= todo.getDescription() %>"><br />
        <input type="submit" value="Update">
      </form>
    </div>
  </body>
</html>