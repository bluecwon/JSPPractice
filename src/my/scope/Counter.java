package my.scope;

public class Counter {
	private int num;
	
	public Counter(){
		System.out.println("Counter() °´Ã¼ »ı¼º!!");
	}
	
	public void setCount(int i){
		num += i;
	}
	
	public int getCount(){
		return num;
	}
}
