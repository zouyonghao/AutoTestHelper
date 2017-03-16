package org.zyh.service;

import org.apache.http.client.fluent.Request;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateCallback;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zyh.model.URLTest;
import org.zyh.model.URLTestResult;

import java.io.IOException;
import java.util.List;

/**
 * @author zouyonghao
 */
@Service
public class URLTestService {


    private final HibernateTemplate hibernateTemplate;

    @Autowired
    public URLTestService(HibernateTemplate hibernateTemplate) {
        this.hibernateTemplate = hibernateTemplate;
    }

    @Transactional
    public String create(String url, String expect) {

        URLTest urlTest = new URLTest();
        urlTest.setUrl(url);
        urlTest.setExpectValue(expect);
        hibernateTemplate.save(urlTest);

        return "success";
    }

    @Transactional
    public List<URLTest> list(final int pageSize, final int pageNo) {
        return (List<URLTest>) hibernateTemplate.execute(new HibernateCallback<List>() {
            public List doInHibernate(Session session) throws HibernateException {
                Query query = session.createQuery("from URLTest order by id desc");
                query.setFirstResult((pageNo - 1) * pageSize);
                query.setMaxResults(pageSize);
                return query.<URLTest>list();
            }
        });
    }

    @Transactional
    public URLTestResult execute(int id) {
        URLTest urlTest = hibernateTemplate.get(URLTest.class, id);
        String realValue = null;
        boolean result = false;
        try {
            realValue = execute(urlTest.getUrl());
            result = true;
        } catch (IOException e) {
            e.printStackTrace();
        }
        URLTestResult urlTestResult = new URLTestResult();
        urlTestResult.setRealValue(realValue);
        urlTestResult.setResult(result);
        urlTestResult.setUrlTest(urlTest);
        return urlTestResult;
    }

    private String execute(String url) throws IOException {
        return Request.Post(url).execute().returnContent().asString();
    }

}
