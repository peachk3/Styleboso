package com.itwillbs.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

   @Controller
   public class LoginController {

       @GetMapping("/Styleboso/loginout/login")
       public String loginPage() {
           return "/Styleboso/loginout/login";
       }

       @GetMapping("/Styleboso/loginout/main")
       public String mainPage() {
           return "/Styleboso/loginout/main";
       }
       
        @GetMapping("/Styleboso/loginout/accessErr")
           public String accessDenied() {
               return "/loginout/accessErr";
           }
       

   }
