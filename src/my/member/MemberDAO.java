package my.member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class MemberDAO {
	private Connection con;
	private PreparedStatement ps;
	private ResultSet rs;
	
	private String url,user,pass;
	
	public MemberDAO(){
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
		}catch(ClassNotFoundException e){
			e.printStackTrace();
		}
		url="jdbc:oracle:thin:@localhost:1521:xe";
		user="big01";
		pass="big01";
	}
	
	public int inputMember(MemberDTO mdto) throws SQLException{
		int res=0;
		String sql="insert into jsp_member values(member_seq.nextval,?,?,?,?,?,?,?,?,?,sysdate)";
		try{
			con=DriverManager.getConnection(url,user,pass);
			ps=con.prepareStatement(sql);
			ps.setString(1, mdto.getName());
			ps.setString(2, mdto.getId());
			ps.setString(3, mdto.getPasswd());
			res=ps.executeUpdate();
		}finally{
			if(ps!=null)ps.close();
			if(rs!=null)rs.close();
			if(con!=null)con.close();
		}
		return res;
	}
	
	public int checkMember(MemberDTO mdto) throws SQLException{
		int res=0;
		String sql="select count(*) from jsp_member where name=? and ssn1=? and ssn2=?";
		try{
			con=DriverManager.getConnection(url,user,pass);
			ps=con.prepareStatement(sql);
			ps.setString(1, mdto.getName());
			ps.setString(2, mdto.getSsn1());
			ps.setString(3, mdto.getSsn2());
			rs=ps.executeQuery();
			rs.next();
			res=rs.getInt(1);
		}finally{
			if(ps!=null)ps.close();
			if(rs!=null)rs.close();
			if(con!=null)con.close();
		}
		return res;
	}
}