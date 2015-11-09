package com.controller;

import java.io.IOException;
import java.util.Map;
import java.util.TreeMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.todo.Todo;

@WebServlet("/TodosController")
public class TodosController extends HttpServlet {
	private Map<Integer,Todo> todos;
	
	@Override
	public void init() {
		todos = new TreeMap<Integer,Todo>();
		todos.put(1, new Todo());
		todos.put(2, new Todo());
		todos.put(3, new Todo());
		todos.put(4, new Todo());
	}
	
    public TodosController() {
        super();
    }
    
    @Override
    public void doGet(HttpServletRequest req, HttpServletResponse res) 
    		throws ServletException, IOException {
//    	INDEX --> TODOS
    	if (req.getParameter("getTodos").equals("listTodos")) {
    		req.setAttribute("todos", todos);
    		forwardToJSP(req, res, "/todos.jsp");
//    	SHOW --> TODO/ID	
    	} else if (req.getParameter("getTodos").equals("showTodo")) {
    		Integer todoId = Integer.parseInt(req.getParameter("todoID"));
    		req.setAttribute("todo", todos.get(todoId));
    		req.setAttribute("id", todoId);
    		forwardToJSP(req, res, "/todo.jsp");
//    	NEW --> TODO/NEW
    	} else if (req.getParameter("getTodos").equals("newTodo")) {
    		forwardToJSP(req, res, "/newTodo.jsp");
//      EDIT --> TODO/ID/EDIT
    	} else if (req.getParameter("getTodos").equals("editTodo")) {
    		Integer todoId = Integer.parseInt(req.getParameter("id"));
    		req.setAttribute("todo", todos.get(todoId));
    		req.setAttribute("id", todoId);
    		forwardToJSP(req, res, "/editTodo.jsp");
    	}

    	
	}
    
    @Override
    public void doPost(HttpServletRequest req, HttpServletResponse res) 
    		throws ServletException, IOException {
//    	CREATE --> TODO/ID
    	if (req.getParameter("todo").equals("createTodo")) {
    		Todo newTodo = new Todo(req.getParameter("title"), req.getParameter("description"));
    		Integer newTodoId = todos.size()+1; 
    		todos.put(newTodoId, newTodo);
    		req.setAttribute("todo", newTodo);
    		req.setAttribute("id", newTodoId);
    		forwardToJSP(req, res, "/todo.jsp");
//    	UPDATE --> TODO/ID
    	} else if (req.getParameter("todo").equals("updateTodo")) {
    		Todo updatedTodo = new Todo(req.getParameter("title"), req.getParameter("description"));
    		Integer todoId = Integer.parseInt(req.getParameter("id"));
    		todos.put(todoId, updatedTodo);
    		req.setAttribute("todo", updatedTodo);
    		req.setAttribute("id", todoId);
    		forwardToJSP(req, res, "/todo.jsp");
//    	DELETE --> TODO/ID
    	} else if (req.getParameter("todo").equals("deleteTodo")) {
    		todos.remove(Integer.parseInt(req.getParameter("id")));
    		req.setAttribute("todos", todos);
    		forwardToJSP(req, res, "/todos.jsp");
    	}
    }
    
	/*
	 * Add RequestDispatcher
	 */
	private void forwardToJSP(HttpServletRequest request,
			HttpServletResponse response, String jsp) 
					throws ServletException, IOException {
		
		ServletContext context = getServletContext();
		RequestDispatcher dispatcher = context.getRequestDispatcher(jsp);
		dispatcher.forward(request, response);
	}
}
