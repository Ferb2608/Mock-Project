package com.vn.controller;

import com.vn.model.Employee;
import com.vn.model.News;
import com.vn.service.EmployeeService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.activation.MimeType;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.time.LocalDate;


@Controller
public class EmployeeController {
    @Autowired
    EmployeeService employeeService;

    @Autowired
    HttpServletRequest request;

    @GetMapping("/employee-list")
    public String employeeListPage(Model model, @RequestParam(value = "p",defaultValue = "0") Integer p,
                                   @RequestParam(value = "size", defaultValue = "5") Integer size){
        Pageable pageable = PageRequest.of(p, size);
        Page<Employee> employee = employeeService.findAllEmployee(pageable);
        model.addAttribute("employeeList", employee);

        if ((long) size * (employee.getNumber() + 1) > employee.getTotalElements()) {
            model.addAttribute("firstElement", size * p + 1);
            model.addAttribute("lastElement", employee.getTotalElements());
        } else {
            model.addAttribute("firstElement", size * p + 1);
            model.addAttribute("lastElement", size * (p + 1));
        }
        return "employee-list";
    }

    @GetMapping("add/employee")
    public String addEmployeePage(Model model){
        model.addAttribute("employee", new Employee());
        return "create-employee";
    }

    @PostMapping("/add/employee")
    public String addEmployee(@Valid @ModelAttribute("employee") Employee employee
                              , RedirectAttributes redirectAttributes
                              ,BindingResult bindingResult){
        if(bindingResult.hasErrors()){
            return "create-employee";
        }

        employeeService.save(employee);
        redirectAttributes.addFlashAttribute("success","Add employee successfully!");
        return "redirect:/add/employee";
    }

    @PostMapping("/search/employee")
    public String searchEmployee(Model model, @RequestParam(value = "p",defaultValue = "0") Integer p,
                                 @RequestParam(value = "size", defaultValue = "5") Integer size){
        String keyword = request.getParameter("searchEmployee");
        Pageable pageable = PageRequest.of(p,size);
        Page<Employee> page = employeeService.findContainElements(keyword, pageable);
        if (page.isEmpty()) {
            model.addAttribute("error", "No data found!");
        }
        model.addAttribute("employeeList", page);
        return "employee-list";
    }

    @PostMapping("/delete/employee")
    public String deleteEmployee(@RequestParam String id){
        employeeService.deleteEmployee(id);
        return "redirect:/employee-list";
    }

    @GetMapping("/update/employee/{id}")
    public ModelAndView updateEmployeePage(@PathVariable String id){
        ModelAndView model = new ModelAndView("update-employee");
        Employee employee = employeeService.findById(id);
        model.addObject("employee", employee);
        return model;
    }

    @PostMapping("/update/employee")
    public ModelAndView updateEmployee(@Valid @ModelAttribute("employee") Employee employee
            , BindingResult bindingResult
            , RedirectAttributes redirectAttributes){
        ModelAndView modelError = new ModelAndView("update-employee");
        ModelAndView model = new ModelAndView("redirect:/employee-list");
        if(bindingResult.hasErrors()){
            return modelError;
        }


        employeeService.save(employee);
        redirectAttributes.addFlashAttribute("success", "Update Employee Successfully!");
        return model;
    }

}
