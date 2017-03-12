package org.zyh.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zyh.model.URLTestModel;

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

        URLTestModel urlTestModel = new URLTestModel();
        urlTestModel.setUrl(url);
        urlTestModel.setExpectValue(expect);
        hibernateTemplate.save(urlTestModel);

        return "success";
    }

}
