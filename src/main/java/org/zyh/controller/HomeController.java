package org.zyh.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @author zouyonghao
 */
@Controller
public class HomeController {

    @ResponseBody
    @PostMapping("/home")
    public String home() {
        return "home";
    }

    @GetMapping("/home")
    public String getHome() {
        return "home";
    }

}
