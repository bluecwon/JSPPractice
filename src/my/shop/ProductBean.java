package my.shop;

import java.sql.*;
import java.util.ArrayList;

import my.db.ConnectionPoolBean;

public class ProductBean {
	private Connection con;
	private PreparedStatement ps;
	private ResultSet rs;
	
	private ConnectionPoolBean pool;
	
	public void setPool(ConnectionPoolBean pool) {
		this.pool = pool;
	}
	
	public int inputProduct(ProductDTO pdto) throws SQLException{
		int res=0;
		String sql="insert into product values(prod_seq.nextval,?,?,?,?,?,?,?,?,?,sysdate)";
		try{
			con=pool.getConnection();
			ps=con.prepareStatement(sql);
			ps.setString(1, pdto.getPname());
			ps.setString(2, pdto.getPcategory_fk());
			ps.setString(3, pdto.getPcompany());
			ps.setString(4, pdto.getPimage());
			ps.setInt(5, pdto.getPqty());
			ps.setInt(6, pdto.getPrice());
			ps.setString(7, pdto.getPspec());
			ps.setString(8, pdto.getPcontents());
			ps.setInt(9, pdto.getPoint());
			res=ps.executeUpdate();
		}finally{
			if(ps!=null)ps.close();
			if(rs!=null)rs.close();
			if(con!=null)pool.returnConnection(con);;
		}
		return res;
	}
	
	public ArrayList<ProductDTO> listProduct() throws SQLException{
		ArrayList<ProductDTO> list=null;
		String sql="select * from Product";
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
	
	public ArrayList<ProductDTO> makeArrayList(ResultSet rs) throws SQLException{
		ArrayList<ProductDTO> list=new ArrayList<ProductDTO>();
		while(rs.next()){
			ProductDTO pdto=new ProductDTO();
			pdto.setPnum(rs.getInt("pnum"));
			pdto.setPcategory_fk(rs.getString("Pcategory_fk"));
			pdto.setPname(rs.getString("pname"));
			pdto.setPimage(rs.getString("pimage"));
			pdto.setPrice(rs.getInt("price"));
			pdto.setPcompany(rs.getString("pcompany"));
			pdto.setPcontents(rs.getString("pcontents"));
			pdto.setPqty(rs.getInt("pqty"));
			pdto.setPoint(rs.getInt("point"));
			pdto.setPspec(rs.getString("pspec"));
			list.add(pdto);
		}
		return list;
	}
	
	public int deleteProduct(int pnum)throws SQLException{
		int res=0;
		String sql="delete from product where pnum=?";
		try{
			con=pool.getConnection();
			ps=con.prepareStatement(sql);
			ps.setInt(1, pnum);
			res=ps.executeUpdate();
		}finally{
			if(ps!=null)ps.close();
			if(rs!=null)rs.close();
			if(con!=null)pool.returnConnection(con);;
		}
		return res;
	}
	
	public int updateProduct(ProductDTO pdto)throws SQLException{
		int res=0;
		String sql="update product set pname=?, pcompany=?, pimage=?, pqty=?, price=?"
				+ ", pspec=?, pcontents=?, point=? where pnum=?";
		try{
			con=pool.getConnection();
			ps=con.prepareStatement(sql);
			ps.setString(1, pdto.getPname());
			ps.setString(2, pdto.getPcompany());
			ps.setString(3, pdto.getPimage());
			ps.setInt(4, pdto.getPqty());
			ps.setInt(5, pdto.getPrice());
			ps.setString(6, pdto.getPspec());
			ps.setString(7, pdto.getPcontents());
			ps.setInt(8, pdto.getPoint());
			ps.setInt(9, pdto.getPnum());
			res=ps.executeUpdate();
		}finally{
			if(ps!=null)ps.close();
			if(rs!=null)rs.close();
			if(con!=null)pool.returnConnection(con);
		}
		return res;
	}
	
	public ProductDTO searchProduct(int pnum)throws SQLException{
		ProductDTO res=null;
		String sql="select * from product where pnum=?";
		try{
			con=pool.getConnection();
			ps=con.prepareStatement(sql);
			ps.setInt(1, pnum);
			rs=ps.executeQuery();
			ArrayList<ProductDTO> list=makeArrayList(rs);
			if(list!=null){
				res=list.get(0);
			}
		}finally{
			if(ps!=null)ps.close();
			if(rs!=null)rs.close();
			if(con!=null)pool.returnConnection(con);
		}
		return res;
	}
	
	public ArrayList<ProductDTO> listSpecProduct(String pspec) throws SQLException{
		ArrayList<ProductDTO> list=null;
		String sql="select * from Product where pspec=?";
		try{
			con=pool.getConnection();
			ps=con.prepareStatement(sql);
			ps.setString(1, pspec);
			rs=ps.executeQuery();
			list =makeArrayList(rs);
		}finally{
			if(ps!=null)ps.close();
			if(rs!=null)rs.close();
			if(con!=null)pool.returnConnection(con);
		}
		return list;
	}
	
	public ArrayList<ProductDTO> listCateProduct(String cate) throws SQLException{
		ArrayList<ProductDTO> list=null;
		String sql="select * from Product where pcategory_fk like '"+cate+"%'";
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
}
