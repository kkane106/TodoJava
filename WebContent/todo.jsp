<%@ page language="java" 
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"
         import="com.todo.Todo"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
  	<% Todo todo = (Todo) request.getAttribute("todo"); %>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <% if (todo != null) { %>
      <title><%= todo.getTitle() %></title>
    <% } %>
  </head>
  <body>
    <div class="container">
      <% if (todo != null) { %>
        <h3><%=todo.getTitle() %></h3>
        <p><%=todo.getDescription() %></p>
      <% } %>
      <div>
        <!-- EDIT -->
        <a href="<%= "TodosController?getTodos=editTodo&id="+
              request.getAttribute("id") %>"><button>Edit</button></a>
        <!-- DELETE -->
        <form method="POST" action="TodosController">
          <input type="hidden" name="todo" value="deleteTodo">
          <input type="hidden" name="id" value="<%= request.getAttribute("id") %>">
          <input type="submit" value="Delete">
        </form>
        <!-- RETURN TO TODOS -->
        <a href="TodosController?getTodos=listTodos"><button>List Todos</button></a>
      </div>
    </div>
  </body>
</html>