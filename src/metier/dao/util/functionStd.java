package metier.dao.util;

import java.util.List;

public interface functionStd<A,B> {
	
	public A add(A a);
	public A edit(A a);
	public void delete(B b);
	public A getById(B id);
	public List<A> getAll();


	
}
