package org.zyh.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.zyh.service.URLTestService;

/**
 * @author zouyonghao
 */
@RestController
@RequestMapping("/url")
public class URLTestController {

    @Autowired
    private URLTestService service;

    @RequestMapping("/create")
    public String create(@RequestParam("url") String url, @RequestParam("expect") String expect) {
        return service.create(url, expect);
    }

}
