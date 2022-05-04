package com.miso.web;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.miso.persistence.HomeDao;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
		locations = {"file:src/main/webapp/Web-INF/spring/**/root-context.xml"})
public class HomeDaoTest {

		@Inject
		private HomeDao dao;
		
		@Test
		public void testSelectEmpInfo() throws Exception {
			
			System.out.println(dao.selectEmpInfo().getEmail());
		
	}

}
