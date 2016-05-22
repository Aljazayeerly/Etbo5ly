package titles.app.initializer;

import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;
import titles.app.configuration.ApplicationConfiguration;
import titles.app.security.configuration.SecurityConfig;
import titles.model.configuration.PersistenceJPAConfig;

public class AppInitializer extends
		AbstractAnnotationConfigDispatcherServletInitializer {
	
	@Override
	protected Class<?>[] getServletConfigClasses() {
		System.out.println("app init started");
		return new Class[] {};
	}

	@Override
	protected String[] getServletMappings() {
		return new String[] { "/spring/*" };
	}

	@Override
	protected Class<?>[] getRootConfigClasses() {
		return new Class[] {ApplicationConfiguration.class,PersistenceJPAConfig.class,SecurityConfig.class};
	}


}


