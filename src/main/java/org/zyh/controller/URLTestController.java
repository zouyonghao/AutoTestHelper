package org.zyh.controller;

import com.google.gson.Gson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.zyh.model.URLTest;
import org.zyh.model.URLTestResult;
import org.zyh.service.URLTestService;

import java.util.List;

/**
 * @author zouyonghao
 */
@RestController
@RequestMapping("/url")
public class URLTestController {

    @Autowired
    private URLTestService service;

    /**
     * Create a url test case.
     * @param url which will be posted.
     * @param expect the value should be returned.
     * @return success if success
     */
    @RequestMapping("/create")
    public String create(@RequestParam("url") String url, @RequestParam("expect") String expect) {
        return service.create(url, expect);
    }

    /**
     * list the test cases
     * @param pageSize size of one page.
     * @param pageNo page number, start from 1.
     * @return A list contains URLTest model.
     */
    @RequestMapping("/list")
    public List<URLTest> list(@RequestParam("pageSize") int pageSize, @RequestParam("pageNo") int pageNo) {
        return service.list(pageSize, pageNo);
    }

    /**
     * execute a test case.
     * @param id the test case id.
     * @return URLTestResult.
     */
    @RequestMapping("/execute")
    public String execute(@RequestParam("id") int id) {
        return new Gson().toJson(service.execute(id));
    }

}
