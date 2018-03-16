package care.dog.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import care.dog.common.dao.CommonDAO;

@Service("service.serviceService")
public class ServiceServiceImpl implements ServiceService{

	@Autowired
	private CommonDAO dao;
	
	@Override
	public int insertService(ServiceDto dto) {
		
		int result=0;
		
		try {
			result=dao.insertData("service.insertService",dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return result;
	}

	

}
