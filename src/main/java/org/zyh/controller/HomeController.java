package org.zyh.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author zouyonghao
 */
@RestController
public class HomeController {

    @RequestMapping("/home")
    public String home() {
        return "home";
    }

}
