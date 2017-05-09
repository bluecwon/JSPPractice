package my.shop.mall;

import java.sql.*;
import java.util.ArrayList;
import java.util.Hashtable;

import my.db.ConnectionPoolBean;
import my.shop.ProductDTO;

public class CartBean {
	ProductDTO p,p2;
	ProductList pl;
	private Connection con;
	private PreparedStatement ps;
	private ResultSet rs;
	
	Hashtable<String,ProductDTO> ht;
	
	private ConnectionPoolBean pool;
	
	public void setPool(ConnectionPoolBean pool) {
		this.pool = pool;
	}
	public void setPl(ProductList pl){
		this.pl=pl;
	}
	
	public CartBean(){
		p=new ProductDTO();
		p2=new ProductDTO();
		ht=new Hashtable<String,ProductDTO>();
	}
	
	public boolean cartAdd(String key,int pnum,int qty) throws SQLException{	
		ArrayList<ProductDTO> list=pl.getHt().get(key);
		for(ProductDTO dto:list){
			if(dto.getPnum()==pnum){
				if(ht.get(String.valueOf(pnum))==null){
					dto.setPqty(qty);
					ht.put(String.valueOf(pnum), dto);
					return true;
				}else{
					int pqty=ht.get(String.valueOf(pnum)).getPqty();
					dto.setPqty(pqty+qty);
					ht.put(String.valueOf(pnum), dto);
					return true;
				}
			}
		}
		return false;
	}
	
	public Hashtable<String, ProductDTO> listCart() {
		return ht;
	}
	
	public boolean cartEdit(int pnum,int qty)throws SQLException{	
		ht.get(String.valueOf(pnum)).setPqty(qty);
		if(qty==ht.get(String.valueOf(pnum)).getPqty()){
	    return true;
		}else{
		return false;
		}
	}
	
	public boolean cartDelete(int pnum)throws SQLException{	
		ht.remove(String.valueOf(pnum));
		if(ht.get(String.valueOf(pnum))==null){
	    return true;
		}else{
		return false;
		}
	}
	
	
	
	
}
