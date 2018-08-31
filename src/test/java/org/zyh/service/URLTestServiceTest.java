package org.zyh.service;

import org.junit.Test;
import org.mockito.Mockito;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.zyh.model.URLTest;

import static org.junit.Assert.assertNotNull;

public class URLTestServiceTest {

    @Test
    public void create() {
    }

    @Test
    public void list() {
    }

    @Test
    public void execute() {
        URLTest test = new URLTest();
        HibernateTemplate template = Mockito.mock(HibernateTemplate.class);
        URLTestService service = new URLTestService(template);
        Mockito.doReturn(test).when(template).get(Mockito.eq(URLTest.class), Mockito.anyInt());
        test.setUrl("http://www.bing.com");
        assertNotNull(service.execute(123));
    }
}