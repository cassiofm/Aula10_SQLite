package db;

import java.util.ArrayList;
import java.sql.*;


/**
 *
 * @author cassio
 */
public class TasksConnector {
private static final String CLASS_NAME = "org.sqlite.JDBC";    
private static final String URL = "jdbc:sqlite:C:\\Users\\cassio\\GitHub\\tasks.db";    
public static ArrayList<String> select() throws ClassNotFoundException, SQLException{
    ArrayList<String> list = new ArrayList<>();
    Class.forName(CLASS_NAME);
    try (Connection con = DriverManager.getConnection(URL)) {
        Statement stmt = con.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT * FROM Tasks");
        while(rs.next()){
            list.add(rs.getString("name"));
        }
        rs.close();
        stmt.close();
    }
    return list;
}

public static void insert(String name) throws Exception{
    Class.forName(CLASS_NAME);
    try (Connection con = DriverManager.getConnection(URL)) {
        Statement stmt = con.createStatement();
        stmt.execute("insert into Tasks values('"+name+"')");
        stmt.close();
    }
    
}
   

public static void delete(String name) throws Exception{
    Class.forName(CLASS_NAME);
    try (Connection con = DriverManager.getConnection(URL)) {
        Statement stmt = con.createStatement();
        stmt.execute("delete from Tasks where name = ('"+name+"')");
        stmt.close();
    }
    
}
}
