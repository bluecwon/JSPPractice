package my.board;

import java.sql.*;
import java.util.*;
import my.db.ConnectionPoolBean;

public class BoardDataBean {
	ArrayList<BoardDBBean> b_list,b_list2;
	Hashtable<String,ArrayList<BoardDBBean>> ht;
	private Connection con;
	private PreparedStatement ps;
	private ResultSet rs;
	private int key=0;
	
	private ConnectionPoolBean pool;
	
	public BoardDataBean(){
		ht=new Hashtable<String,ArrayList<BoardDBBean>>();
	}
	
	public void setPool(ConnectionPoolBean pool) {
		this.pool = pool;
	}
	
	public int getKey(){
		return key;
	}
	
	public Hashtable<String, ArrayList<BoardDBBean>> getHt() {
		return ht;
	}

	public ArrayList<BoardDBBean> listBoard() throws SQLException{
		b_list=null;
		String sql="select * from board order by re_step asc";
		try{
			con=pool.getConnection();
			ps=con.prepareStatement(sql);
			rs=ps.executeQuery();
			b_list =makeArrayList(rs);
			if(key>0){
				ht.remove(key);
			}
			key++;
			if(b_list.size()!=0){
				ht.put(String.valueOf(key),b_list);
			}else{
				return null;
			}
		}finally{
			if(ps!=null)ps.close();
			if(rs!=null)rs.close();
			if(con!=null)pool.returnConnection(con);
		}
		return b_list;
	}
	
	public ArrayList<BoardDBBean> makeArrayList(ResultSet rs) throws SQLException{
		ArrayList<BoardDBBean> list=new ArrayList<BoardDBBean>();
		while(rs.next()){
			BoardDBBean pdb=new BoardDBBean();
			pdb.setNum(rs.getInt("num"));
			pdb.setWriter(rs.getString("writer"));
			pdb.setEmail(rs.getString("email"));
			pdb.setSubject(rs.getString("subject"));
			pdb.setPasswd(rs.getString("passwd"));
			pdb.setReg_date(rs.getString("reg_date"));
			pdb.setReadcount(rs.getInt("readcount"));
			pdb.setContent(rs.getString("content"));
			pdb.setIp(rs.getString("ip"));
			pdb.setRe_step(rs.getInt("re_step"));
			pdb.setRe_level(rs.getInt("re_level"));
			list.add(pdb);
		}
		return list;
	}
	
	public int inputBoard(BoardDBBean bdbb)throws SQLException{
		int res=0;
		String sql=null;
		if(bdbb.getRe_level()!=0){
			sql="update board set re_step=re_step+1 where re_step >"+bdbb.getRe_step();
			bdbb.setRe_step(bdbb.getRe_step()+1);
		}else{
			sql="update board set re_step=re_step+1";
		}
		try{
			con=pool.getConnection();
			ps=con.prepareStatement(sql);
			res=ps.executeUpdate();
			sql="insert into board values(board_seq.nextval,?,?,?,?,sysdate,default,?,?,?,?)";
			ps=con.prepareStatement(sql);
			ps.setString(1, bdbb.getWriter());
			ps.setString(2, bdbb.getEmail());
			ps.setString(3, bdbb.getSubject());
			ps.setString(4, bdbb.getPasswd());
			ps.setString(5, bdbb.getContent());
			ps.setString(6, bdbb.getIp());
			ps.setInt(7, bdbb.getRe_step());
			ps.setInt(8, bdbb.getRe_level());
			res=ps.executeUpdate();
		}finally{
			if(ps!=null)ps.close();
			if(rs!=null)rs.close();
			if(con!=null)pool.returnConnection(con);;
		}
		return res;
	}
	
	public BoardDBBean detailView(int num){
		ArrayList<BoardDBBean> list=ht.get(String.valueOf(key));
		for(BoardDBBean bdbb:list){
			if(bdbb.getNum()==num){
				return bdbb;
			}
		}
		return null;
	}
	
	public boolean checkPass(int num,String passwd){
		ArrayList<BoardDBBean> list=ht.get(String.valueOf(key));
		for(BoardDBBean bdbb:list){
			if(bdbb.getNum()==num){
				if(bdbb.getPasswd().equals(passwd)){
						return true;
				}
			}
		}
		return false;
	}
	
	public int deleteBoard(int num)throws SQLException{
		int res=0;
		String sql="delete from board where num=?";
		try{
			con=pool.getConnection();
			ps=con.prepareStatement(sql);
			ps.setInt(1, num);
			res=ps.executeUpdate();
		}finally{
			if(ps!=null)ps.close();
			if(rs!=null)rs.close();
			if(con!=null)pool.returnConnection(con);;
		}
		return res;
	}
	
	public void updateCount(int num)throws SQLException{
		String sql="update board set readcount=readcount+1 where num=?";
		try{
			con=pool.getConnection();
			ps=con.prepareStatement(sql);
			ps.setInt(1, num);
			ps.executeUpdate();
		}finally{
			if(ps!=null)ps.close();
			if(con!=null)pool.returnConnection(con);;
		}
	}
	
	public int updateBoard(BoardDBBean bdbb)throws SQLException{
		int res=0;
		String sql="update board set subject=?, email=?, content=? where num=?";
		try{
			con=pool.getConnection();
			ps=con.prepareStatement(sql);
			ps.setString(1, bdbb.getSubject());
			ps.setString(2, bdbb.getEmail());
			ps.setString(3, bdbb.getContent());
			ps.setInt(4, bdbb.getNum());
			res=ps.executeUpdate();
		}finally{
			if(ps!=null)ps.close();
			if(rs!=null)rs.close();
			if(con!=null)pool.returnConnection(con);;
		}
		return res;
	}
}
