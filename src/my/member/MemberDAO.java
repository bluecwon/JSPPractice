package my.member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import my.book.BookDTO;
import my.db.ConnectionPoolBean;

public class MemberDAO {
	private Connection con;
	private PreparedStatement ps;
	private ResultSet rs;
	
	private ConnectionPoolBean pool;
	
	public void setPool(ConnectionPoolBean pool) {
		this.pool = pool;
	}

	public MemberDAO(){
		
	}
	
	public int inputMember(MemberDTO mdto) throws SQLException{
		int res=0;
		String sql="insert into jsp_member values(member_seq.nextval,?,?,?,?,?,?,?,?,?,sysdate)";
		try{
			con=pool.getConnection();
			ps=con.prepareStatement(sql);
			ps.setString(1, mdto.getName());
			ps.setString(2, mdto.getId());
			ps.setString(3, mdto.getPasswd());
			ps.setString(4, mdto.getSsn1());
			ps.setString(5, mdto.getSsn2());
			ps.setString(6, mdto.getEmail());
			ps.setString(7, mdto.getHp1());
			ps.setString(8, mdto.getHp2());
			ps.setString(9, mdto.getHp3());
			res=ps.executeUpdate();
		}finally{
			if(ps!=null)ps.close();
			if(rs!=null)rs.close();
			if(con!=null)pool.returnConnection(con);;
		}
		return res;
	}
	
	public int checkMember(MemberDTO mdto) throws SQLException{
		int res=0;
		String sql="select count(*) from jsp_member where name=? and ssn1=? and ssn2=?";
		try{
			con=pool.getConnection();
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
			if(con!=null)pool.returnConnection(con);
		}
		return res;
	}
	
	public boolean loginOk(MemberDTO mdto) throws SQLException{
		boolean res=false;
		String sql="select passwd from jsp_member where id=?";
		try{
			con=pool.getConnection();
			ps=con.prepareStatement(sql);
			ps.setString(1, mdto.getId());
			rs=ps.executeQuery();
			rs.next();
			String passwd =rs.getString("passwd");
			if(passwd.equals(mdto.getPasswd())){
				res=true;
			}else{
				res=false;
			}
		}finally{
			if(ps!=null)ps.close();
			if(rs!=null)rs.close();
			if(con!=null)pool.returnConnection(con);
		}
		return res;
	}
	
	public ArrayList<MemberDTO> listMember() throws SQLException{
		ArrayList<MemberDTO> list=null;
		String sql="select * from jsp_member";
		try{
			con=pool.getConnection();
			ps=con.prepareStatement(sql);
			rs=ps.executeQuery();
			list =makeArrayList(rs);
		}finally{
			if(ps!=null)ps.close();
			if(rs!=null)rs.close();
			if(con!=null)pool.returnConnection(con);
		}
		return list;
	}
	
	public ArrayList<MemberDTO> makeArrayList(ResultSet rs) throws SQLException{
		ArrayList<MemberDTO> list=new ArrayList<MemberDTO>();
		while(rs.next()){
			MemberDTO mdto=new MemberDTO();
			mdto.setNo(rs.getInt("no"));
			mdto.setName(rs.getString("name"));
			mdto.setId(rs.getString("id"));
			mdto.setPasswd(rs.getString("passwd"));
			mdto.setSsn1(rs.getString("ssn1"));
			mdto.setSsn2(rs.getString("ssn2"));
			mdto.setEmail(rs.getString("email"));
			mdto.setHp1(rs.getString("hp1"));
			mdto.setHp2(rs.getString("hp2"));
			mdto.setHp3(rs.getString("hp3"));
			mdto.setJoindate(rs.getString("joindate"));
			list.add(mdto);
		}
		return list;
	}
	
	public int deleteMember(int no) throws SQLException{
		int res=0;
		String sql="delete from jsp_member where no=?";
		try{
			con=pool.getConnection();
			ps=con.prepareStatement(sql);
			ps.setInt(1, no);
			res=ps.executeUpdate();
		}finally{
			if(ps!=null)ps.close();
			if(rs!=null)rs.close();
			if(con!=null)pool.returnConnection(con);
		}
		return res;
	}
	
	public int editMember(MemberDTO mdto) throws SQLException{
		int res=0;
		String sql="update jsp_member set passwd=?, email=?, hp1=?, hp2=?, hp3=? where no=?";
		try{
			con=pool.getConnection();
			ps=con.prepareStatement(sql);
			ps.setString(1, mdto.getPasswd());
			ps.setString(2, mdto.getEmail());
			ps.setString(3, mdto.getHp1());
			ps.setString(4, mdto.getHp2());
			ps.setString(5, mdto.getHp3());
			ps.setInt(6, mdto.getNo());
			res=ps.executeUpdate();
		}finally{
			if(ps!=null)ps.close();
			if(rs!=null)rs.close();
			if(con!=null)pool.returnConnection(con);
		}
		return res;
	}
	
	public MemberDTO memberInfo(int no) throws SQLException{
		String sql="select * from jsp_member where no=?";
		MemberDTO mdto=new MemberDTO();
		try{
			con=pool.getConnection();
			ps=con.prepareStatement(sql);
			ps.setInt(1, no);
			rs=ps.executeQuery();
			rs.next();
			mdto.setNo(rs.getInt("no"));
			mdto.setName(rs.getString("name"));
			mdto.setId(rs.getString("id"));
			mdto.setPasswd(rs.getString("passwd"));
			mdto.setSsn1(rs.getString("ssn1"));
			mdto.setSsn2(rs.getString("ssn2"));
			mdto.setEmail(rs.getString("email"));
			mdto.setHp1(rs.getString("hp1"));
			mdto.setHp2(rs.getString("hp2"));
			mdto.setHp3(rs.getString("hp3"));
			mdto.setJoindate(rs.getString("joindate"));
		}finally{
			if(ps!=null)ps.close();
			if(rs!=null)rs.close();
			if(con!=null)pool.returnConnection(con);
		}
		return mdto;
	}
	
	public ArrayList<MemberDTO> findMember(String search,String searchString) throws SQLException{
		String sql="select * from jsp_member where "+search+"=?";
		try{
			con=pool.getConnection();
			ps=con.prepareStatement(sql);
			ps.setString(1, searchString);
			rs=ps.executeQuery();
			ArrayList<MemberDTO> list=makeArrayList(rs);
			return list;
		}finally{
			if(ps!=null)ps.close();
			if(rs!=null)rs.close();
			if(con!=null)pool.returnConnection(con);
		}
	}
	
	public String searchId(MemberDTO mdto) throws SQLException{
		String res=null;
		String sql="select * from jsp_member where name=? and ssn1=? and ssn2=?";
		try{
			con=pool.getConnection();
			ps=con.prepareStatement(sql);
			ps.setString(1, mdto.getName());
			ps.setString(2, mdto.getSsn1());
			ps.setString(3, mdto.getSsn2());
			rs=ps.executeQuery();
			if(rs.next()){
				res=rs.getString("passwd");
			}
		}finally{
			if(ps!=null)ps.close();
			if(rs!=null)rs.close();
			if(con!=null)pool.returnConnection(con);
		}
		return res;
	}
	
	public String searchPw(MemberDTO mdto) throws SQLException{
		String res=null;
		String sql="select passwd from jsp_member where name=? and ssn1=? and ssn2=? and id=?";
		try{
			con=pool.getConnection();
			ps=con.prepareStatement(sql);
			ps.setString(1, mdto.getName());
			ps.setString(2, mdto.getSsn1());
			ps.setString(3, mdto.getSsn2());
			ps.setString(4, mdto.getId());
			rs=ps.executeQuery();
			if(rs.next()){
			res=rs.getString("passwd");
			}
		}finally{
			if(ps!=null)ps.close();
			if(rs!=null)rs.close();
			if(con!=null)pool.returnConnection(con);
		}
		return res;
	}
}
