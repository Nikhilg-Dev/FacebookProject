package com.example.facebookproject.controllers;

import com.example.facebookproject.Models.Person;
import com.example.facebookproject.Models.PersonRepo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.CacheControl;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Objects;

@Controller
public class PageController {

    @Autowired
    PersonRepo repo;


    @GetMapping("/")
    public String home(){
        return "index";
    }

    @GetMapping("/signUp")
    public String signUp(HttpServletResponse response,HttpServletRequest request){
        HttpSession session=request.getSession();
        String name= (String) session.getAttribute("name");
        if(name==null)
            return "signUp";
        else {
            return "redirect:/welcome";
        }

    }
    @GetMapping("/showAllPerson")
    public String selectAllPerson(Model model,HttpServletRequest request){
        List<Person> list=repo.findAll();
        model.addAttribute("mylist",list);   //for printing list
        HttpSession session=request.getSession();
        String password= (String) session.getAttribute("password");
        String name= (String) session.getAttribute("name");
            Person p=null;
            for (Person per:list) {
                if(Objects.equals(per.getName(), name)){
                    p=per;
                    break;
                }
            }
            model.addAttribute("personObj",p);  /// for printing name after hi
        return "welcome";
    }
    @GetMapping("/Edit/{idx}")
    public String editPerson(@PathVariable("idx") Long id,Model model){
        Person person=repo.findById(id).get();
        model.addAttribute("person",person);
        return "signUp";
    }

    @PostMapping("/afterSignUp")
    public String SignupForm(@ModelAttribute("person") Person person, HttpServletRequest request, HttpServletResponse response, Model model) throws IOException, ServletException {
        String name=request.getParameter("name");
        String password=request.getParameter("password");
        List<Person> list=repo.findAll();
        boolean check = false;
        for (Person p:list) {
            if(name.equals(p.getName())){
                System.out.println("matched");
                check=true;
                break;
            }
        }
        if (check){
            model.addAttribute("error","Already exist: Name should be unique");
            return "signUp";
        }
        else{
            repo.save(person);
            HttpSession session=request.getSession();
            HttpSession session1=request.getSession();
            session.setAttribute("name",name);
            session1.setAttribute("password",password);
            return "redirect:/welcome";
        }

    }

    @GetMapping("/welcome")
    public String welcome(HttpServletRequest request, HttpServletResponse response, Model model){
        HttpSession session=request.getSession();
        String password= (String) session.getAttribute("password");
        String name= (String) session.getAttribute("name");


        if ((name == null)) {
            model.addAttribute("error","please login/signUp first");
            return "index";
        }
        else {
            List<Person> list=repo.findAll();
            Person p=null;
            for (Person per:list) {
                if(Objects.equals(per.getName(), name)){
                    p=per;
                    break;
                }
            }
            model.addAttribute("personObj",p);
            return "welcome";
        }

    }
    @GetMapping("/logout")
    public String logout(HttpServletRequest request,HttpServletResponse response){
        HttpSession session=request.getSession();
        session.removeAttribute("name");
        session.removeAttribute("password");
        session.invalidate();
        return "index";
    }

    @GetMapping("login")
    public String login(HttpServletRequest request,HttpServletResponse response){
        HttpSession session=request.getSession();
        String name= (String) session.getAttribute("name");
        if(name==null)
            return "login";
        else {
            return "redirect:/welcome";
        }
    }
    @PostMapping("/afterLogin")
    public String afterLogIn(HttpServletRequest request, HttpServletResponse response, Model model){
        String name= request.getParameter("name");
        String password=request.getParameter("password");
        HttpSession session=request.getSession();
        List<Person> list=repo.findAll();
        Boolean check=false;
        for (Person person:list) {
            if(person.getPassword().equals(password)&&person.getName().equals(name)){
                check=true;
                break;
            }

        }
        if (check){
            session.setAttribute("name",name);
            session.setAttribute("password",password);
            return "redirect:/welcome";
        }
        else{
            model.addAttribute("error","wrong credentials");
            return "login";
        }
    }

    @GetMapping("/people/{idx}")
    public String people(@PathVariable("idx") Long id,Model model){
        Person person=repo.findById(id).get();
        model.addAttribute("person",person);
        return "people";
    }


}
