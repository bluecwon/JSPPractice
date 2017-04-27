package my.shop;

import java.sql.*;
import java.util.*;

import my.db.ConnectionPoolBean;
import my.member.MemberDTO;

public class CategoryBean {
	private Connection con;
	private PreparedStatement ps;
	private ResultSet rs;
	
	private ConnectionPoolBean pool;
	
	public void setPool(ConnectionPoolBean pool) {
		this.pool = pool;
	}
	
	public int inputCategory(CategoryDTO cdto) throws SQLException{
		int res=0;
		String sql="insert into category values(cate_seq.nextval,?,?)";
		try{
			con=pool.getConnection();
			ps=con.prepareStatement(sql);
			ps.setString(1, cdto.getCode());
			ps.setString(2, cdto.getCname());
			res=ps.executeUpdate();
		}finally{
			if(ps!=null)ps.close();
			if(rs!=null)rs.close();
			if(con!=null)pool.returnConnection(con);;
		}
		return res;
	}
	
	public ArrayList<CategoryDTO> listCategory() throws SQLException{
		ArrayList<CategoryDTO> list=null;
		String sql="select * from category";
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
	
	public ArrayList<CategoryDTO> makeArrayList(ResultSet rs) throws SQLException{
		ArrayList<CategoryDTO> list=new ArrayList<CategoryDTO>();
		while(rs.next()){
			CategoryDTO cdto=new CategoryDTO();
			cdto.setCnum(rs.getInt("cnum"));
			cdto.setCode(rs.getString("code"));
			cdto.setCname(rs.getString("cname"));
			list.add(cdto);
		}
		return list;
	}
	
	public int deleteCategory(int cnum)throws SQLException{
		int res=0;
		String sql="delete from category where cnum=?";
		try{
			con=pool.getConnection();
			ps=con.prepareStatement(sql);
			ps.setInt(1, cnum);
			res=ps.executeUpdate();
		}finally{
			if(ps!=null)ps.close();
			if(rs!=null)rs.close();
			if(con!=null)pool.returnConnection(con);;
		}
		return res;
	}
}
