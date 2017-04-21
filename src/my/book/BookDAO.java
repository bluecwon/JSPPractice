package my.book;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import my.student.StudentDTO;

public class BookDAO {
	
	private Connection con;
	private PreparedStatement ps;
	private ResultSet rs;
	
	private String url,user,pass;
	
	public BookDAO(){
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
		}catch(ClassNotFoundException e){
			e.printStackTrace();
		}
		url="jdbc:oracle:thin:@localhost:1521:xe";
		user="big01";
		pass="big01";
	}
	
	public int insertBook(String name, String writer, String publisher) throws SQLException{//finally에서도 예외가 발생할 수 있기 때문에 전가
		int res=0;
		String sql="insert into book values(?,?,?,sysdate)";
		try{
			con=DriverManager.getConnection(url,user,pass);
			ps=con.prepareStatement(sql);
			ps.setString(1, name);
			ps.setString(2, writer);
			ps.setString(3, publisher);
			res=ps.executeUpdate();
		}finally{
			if(ps!=null)ps.close();
			if(rs!=null)rs.close();
			if(con!=null)con.close();
		}
		return res;
	}
	
	public ArrayList<BookDTO> listBook() throws SQLException{
		String sql="select * from book";
		try{
			con=DriverManager.getConnection(url,user,pass);
			ps=con.prepareStatement(sql);
			rs=ps.executeQuery();
			ArrayList list=makeArrayList(rs);
			return list;
		}finally{
			if(ps!=null)ps.close();
			if(rs!=null)rs.close();
			if(con!=null)con.close();
		}
	}
	
	public ArrayList makeArrayList(ResultSet rs) throws SQLException{
		ArrayList<BookDTO> list=new ArrayList<BookDTO>();
		while(rs.next()){
			BookDTO sdto=new BookDTO();
			sdto.setName(rs.getString("name"));
			sdto.setWriter(rs.getString("writer"));
			sdto.setPublisher(rs.getString("publisher"));
			sdto.setIndate(rs.getString("indate"));
			list.add(sdto);
		}
		return list;
	}
	
	public ArrayList<BookDTO> searchBook(String search,String searchString) throws SQLException{
		String sql="select * from book where "+search+"=?";
		try{
			con=DriverManager.getConnection(url,user,pass);
			ps=con.prepareStatement(sql);
			ps.setString(1, searchString);
			rs=ps.executeQuery();
			ArrayList list=makeArrayList(rs);
			return list;
		}finally{
			if(ps!=null)ps.close();
			if(rs!=null)rs.close();
			if(con!=null)con.close();
		}
	}
	
	//public int modifyBook(String name){}
	
	public int checkBook(String name) throws SQLException{
		String sql="select count(*) from book where name=?";
		try{con=DriverManager.getConnection(url,user,pass);
		ps=con.prepareStatement(sql);
		ps.setString(1, name);
		ResultSet rs=ps.executeQuery();
		rs.next();
		return rs.getInt(1);
		}finally{
			if(ps!=null)ps.close();
			if(rs!=null)rs.close();
			if(con!=null)con.close();
		}
	}
	
	public int deleteBook(String id) throws SQLException{
		int res=0;
		String sql="delete from book where id=?";
		try{
			con=DriverManager.getConnection(url,user,pass);
			ps=con.prepareStatement(sql);
			ps.setString(1, id);
			res=ps.executeUpdate();
		}finally{
			if(ps!=null)ps.close();
			if(rs!=null)rs.close();
			if(con!=null)con.close();
		}
		return res;
	}
	
	public int modifyBook(String name, String writer, String publisher) throws SQLException{
		int res=0;
		String sql = "update book set writer=?, publisher=? where name=?";
		try{
			con=DriverManager.getConnection(url,user,pass);
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, writer);
			ps.setString(2, publisher);
			ps.setString(3, name);
			res=ps.executeUpdate();
		}finally{
			if(ps!=null)ps.close();
			if(rs!=null)rs.close();
			if(con!=null)con.close();
		}
		return res;
	}
}
