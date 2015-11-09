<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@ page language="java" 
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"  
         import="java.util.Set" 
         import="java.util.Map" 
         import="java.util.TreeMap" 
         import="com.todo.Todo"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>
  </head>
  <body>
    <div class="container">
      <h3>Todos:</h3>
      <% Map<Integer, Todo> todos = 
          (TreeMap<Integer,Todo>) request.getAttribute("todos"); %>
      <% if (todos != null) { %>
      <ul>
        <% Set<Integer> ids = todos.keySet(); %>
        <% for (Integer id : ids) { %>
          <li><a href="<%= "TodosController?getTodos=showTodo&todoID="+id %>">
              <%= todos.get(id).getTitle() %></a></li>
        <% } %>
      </ul>
      <% } %>
      
      <a href="TodosController?getTodos=newTodo"><button>Create New Todo</button></a>
    </div>

  </body>
</html>