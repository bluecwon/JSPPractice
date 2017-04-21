package my.student;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class StudentDAO {
	private Connection con;
	private PreparedStatement ps;
	private ResultSet rs;
	
	private String url,user,pass;
	
	public StudentDAO(){//jsp : ���� �����ڰ� public�� �� �پ�� �Ѵ�,default �����ڰ� �־�� �Ѵ�.
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
		}catch(ClassNotFoundException e){
			e.printStackTrace();
		}
		url="jdbc:oracle:thin:@localhost:1521:xe";
		user="big01";
		pass="big01";
	}
	
	public int insertStudent(StudentDTO stdto) throws SQLException{//finally������ ���ܰ� �߻��� �� �ֱ� ������ ����
		int res=0;
		String sql="insert into student values(?,?,?)";
		try{
			con=DriverManager.getConnection(url,user,pass);
			ps=con.prepareStatement(sql);
			ps.setString(1, stdto.getId());
			ps.setString(2, stdto.getName());
			ps.setString(3, stdto.getCname());
			res=ps.executeUpdate();
		}finally{
			if(ps!=null)ps.close();
			if(rs!=null)rs.close();
			if(con!=null)con.close();
		}
		return res;
	}
	
	public ArrayList<StudentDTO> listStudent() throws SQLException{
		String sql="select * from student";
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
		ArrayList<StudentDTO> list=new ArrayList<StudentDTO>();
		while(rs.next()){
			StudentDTO sdto=new StudentDTO();
			sdto.setId(rs.getString("id"));
			sdto.setName(rs.getString("name"));
			sdto.setCname(rs.getString("cname"));
			list.add(sdto);
		}
		return list;
	}
	
	public ArrayList<StudentDTO> searchStudent(String name) throws SQLException{
		String sql="select * from student where name=?";
		try{
			con=DriverManager.getConnection(url,user,pass);
			ps=con.prepareStatement(sql);
			ps.setString(1, name);
			rs=ps.executeQuery();
			ArrayList list=makeArrayList(rs);
			return list;
		}finally{
			if(ps!=null)ps.close();
			if(rs!=null)rs.close();
			if(con!=null)con.close();
		}
	}
	
	public int deleteStudent(String id) throws SQLException{
		int res=0;
		String sql="delete from student where id=?";
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
}
