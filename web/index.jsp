<%-- 
    Document   : index
    Created on : 19 de out de 2020, 22:21:27
    Author     : cassio
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="db.TasksConnector"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String errorMessage = null;
    if(request.getParameter("insert")!=null){
        try{
            String name = request.getParameter("name");
            TasksConnector.insert(name);
            response.sendRedirect(request.getRequestURI());
        }catch(Exception ex){
            errorMessage = "Erro ao ler dados da tabela"+ex.getMessage();
        }
    }
     if(request.getParameter("delete")!=null){
        try{
            String name = request.getParameter("name");
            TasksConnector.delete(name);
            response.sendRedirect(request.getRequestURI());
        }catch(Exception ex){
            errorMessage = "Erro ao excluir tabela"+ex.getMessage();
        }
    }
    
    ArrayList<String> tasks = new ArrayList<>();
    try{
        tasks = TasksConnector.select();
    }catch(Exception ex){
        errorMessage = "Erro ao ler dados da tabela: "+ex.getMessage();
    }
    %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tasks - SQLite</title>
    </head>
    <body>
        <h1>SQLite</h1>
        <h2>Tarefas</h2>
        <br><br>
        
        <form>
            <input type="text" name="name"/>
            <input type="submit" name="insert" value="ïnserir disciplina"/>
        </form>
        <hr/>
                        <% if(errorMessage !=null){%>
                        <div><<%= errorMessage %></div>
                        <hr/>
                        <%}%>
        <table border="1">
            <tr>
                <th>Nome</th>
                <th>Comando</th>
            </tr>
            <%for(String name: TasksConnector.select()){%>
            <tr>
                <td><%=name%></td>
                <td>
                    <form>
                        <input type="hidden" name="name" value="<%=name%>"/>
                        <input type="submit" name="delete" value="Excluir"/>
                    </form>
                        
                        
                </td>
            </tr>
            <%}%>
        </table>
    
    
    </body>
</html>
