package my.shop.mall;
import java.util.*;
import java.sql.*;

import my.db.ConnectionPoolBean;
import my.shop.ProductDTO;

public class ProductList {
	
	ArrayList<ProductDTO> p_list,p_list2;
	Hashtable<String,ArrayList<ProductDTO>> ht;
	Connection con;
	PreparedStatement ps;
	ResultSet rs;
	
	private ConnectionPoolBean pool;
	
	public ProductList(){
		p_list=new ArrayList<ProductDTO>();
		p_list2=new ArrayList<ProductDTO>();
		ht=new Hashtable<String,ArrayList<ProductDTO>>();
	}
	
	public ConnectionPoolBean getPool(){
		return pool;
	}
	public void setPool(ConnectionPoolBean pool){
		this.pool=pool;
	}
	
	public ArrayList<ProductDTO> listSpecProduct(String pspec) throws SQLException{
		p_list=null;
		String sql="select * from Product where pspec=?";
		try{
			con=pool.getConnection();
			ps=con.prepareStatement(sql);
			ps.setString(1, pspec);
			rs=ps.executeQuery();
			p_list =makeArrayList(rs);
			ht.put(pspec,p_list);
		}finally{
			if(ps!=null)ps.close();
			if(rs!=null)rs.close();
			if(con!=null)pool.returnConnection(con);
		}
		return p_list;
	}
	
	public ArrayList<ProductDTO> listCateProduct(String cate) throws SQLException{
		p_list=null;
		String sql="select * from Product where pcategory_fk like '"+cate+"%'";
		try{
			con=pool.getConnection();
			ps=con.prepareStatement(sql);
			rs=ps.executeQuery();
			p_list =makeArrayList(rs);
			ht.put(cate,p_list);
		}finally{
			if(ps!=null)ps.close();
			if(rs!=null)rs.close();
			if(con!=null)pool.returnConnection(con);
		}
		return p_list;
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
	
	public ProductDTO searchProduct(String str,int pnum){
		p_list2=ht.get(str);
		for(ProductDTO pdto:p_list2){
			if(pdto.getPnum()==pnum){
				return pdto;
			}
		}
		return null;
	}

	public Hashtable<String, ArrayList<ProductDTO>> getHt() {
		return ht;
	}
}
