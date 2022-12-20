package service;

import dao.TransDAO;

public class TransService {
	private TransDAO transDao;
	
	public TransService(TransDAO transDao) {
		this.transDao = transDao;
	}
}
