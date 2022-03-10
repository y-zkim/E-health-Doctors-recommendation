package metier.dao.Implementations;

import java.util.List;

import org.hibernate.Session;
import metier.dao.beans.Education;
import metier.dao.util.HibernateUtil;
import metier.dao.util.functionStd;

public class EducationDao implements functionStd<Education, Long> {

Session session = HibernateUtil.openSession();
	
	private static EducationDao instance = null;
	
	private EducationDao() {

	}
	
	@Override
	public Education add(Education a) {
		session.beginTransaction();
		session.save(a);
		session.getTransaction().commit();
		session.close();
		return a;
	}

	@Override
	public Education edit(Education a) {
		session.beginTransaction();
		session.merge(a);
		session.getTransaction().commit();
		return a;
	}

	@Override
	public void delete(Long b) {
		session.beginTransaction();
		Education education = getById(b);
		session.delete(education);
		session.getTransaction().commit();
		
	}

	@Override
	public Education getById(Long id) {
		return session.get(Education.class, id);
	}

	@Override
	public List<Education> getAll() {
		return session.createQuery("select o from Education o").list();//SQL HQL
	}
	
	public static EducationDao getInsctance() {
		if (instance == null)
            instance = new EducationDao();
		return instance;
	}
}
