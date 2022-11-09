package com.vn.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.vn.dto.VaccineDTO;
import com.vn.model.Vaccine;
import com.vn.model.VaccineType;
import com.vn.service.VaccineService;
import com.vn.service.VaccineTypeService;

@Controller
public class VaccineController {

	@Autowired
	VaccineService vaccineService;

	@Autowired
	HttpServletRequest request;

	@Autowired
	VaccineTypeService vaccineTypeService;

	@GetMapping(value = "/vaccine/list")
	public String viewListVaccine(Model model,
			@RequestParam(name = "p", required = false, defaultValue = "0") Integer p,
			@RequestParam(name = "size", required = false, defaultValue = "5") Integer size,
			@RequestParam(name ="search", required = false) String nameSearch,
			@ModelAttribute("msg") String msg) {
		
		if (nameSearch==null) {
			Pageable pageable = PageRequest.of(p, size);
			Page<Vaccine> vaccines = vaccineService.findAll(pageable);
			model.addAttribute("vaccineList", vaccines);
			
			if (size * (vaccines.getNumber() + 1) > vaccines.getTotalElements()) {
				model.addAttribute("firstElement", size * p + 1);
				model.addAttribute("lastElement", vaccines.getTotalElements());
			} else {
				model.addAttribute("firstElement", size * p + 1);
				model.addAttribute("lastElement", size * (p + 1));
			}
			
			model.addAttribute("nameSearch",nameSearch);
			model.addAttribute("msg", msg);
		
			return "vaccine/vaccine-list";
		}else {
			Pageable pageable = PageRequest.of(p, size);
			Page<Vaccine> vaccines = vaccineService.findByVaccineNameContaining(nameSearch,pageable);
			model.addAttribute("vaccineList", vaccines);

			if (size * (vaccines.getNumber() + 1) > vaccines.getTotalElements()) {
				model.addAttribute("firstElement", size * p + 1);
				model.addAttribute("lastElement", vaccines.getTotalElements());
			} else {
				model.addAttribute("firstElement", size * p + 1);
				model.addAttribute("lastElement", size * (p + 1));
			}
			
			model.addAttribute("nameSearch",nameSearch);
			model.addAttribute("msg", msg);
		
			return "vaccine/vaccine-list";
		}
		
		
		
		
	}

	@PostMapping(value = "/vaccine/search")
	public String searchVaccine(Model model) {

		String name = request.getParameter("searchVaccine");
		
		return "redirect:/vaccine/list/?search="+name+"";
	}

	@GetMapping(value = "/vaccine/add")
	public String viewAddVaccine(Model model) {
		List<VaccineType> vaccineTypeList = new ArrayList<>();
		vaccineTypeList = vaccineTypeService.findAllActice();
		
		model.addAttribute("vaccineTypeList", vaccineTypeList);
		model.addAttribute("vaccineDto", new VaccineDTO());

		return "vaccine/vaccine-create";
	}

	@PostMapping(value = "/vaccine/add")
	public String addVaccine(Model model, @Valid @ModelAttribute("vaccineDto") VaccineDTO vaccineDTO,
			BindingResult bindingResult, RedirectAttributes redirectAttributes) {
		if (bindingResult.hasErrors()) {
			return "vaccine/vaccine-create";
		}
		List<VaccineType> vaccineTypeList = new ArrayList<>();
		vaccineTypeList = vaccineTypeService.findAllActice();
		if (vaccineService.hasVaccineById(vaccineDTO.getId())) {

			model.addAttribute("vaccineTypeList", vaccineTypeList);
			model.addAttribute("vaccineDto", vaccineDTO);
			model.addAttribute("msgId", "Id is already exists!");
			return "vaccine/vaccine-create";
		}

		Vaccine vaccine = vaccineService.save(vaccineDTO);
		if (vaccine==null) {
			
			
			model.addAttribute("vaccineTypeList", vaccineTypeList);
			model.addAttribute("vaccineDto", vaccineDTO);
			model.addAttribute("msgTime", "Time to start next vaccination must be less than end time!");
			return "vaccine/vaccine-create";
		}
		
		redirectAttributes.addFlashAttribute("msg", "Create vaccine successfull!");
		return "redirect:/vaccine/list";
	}

	@PostMapping(value = "/vaccine/update/makeInActive")
	public String updateInActive(@RequestParam List<String> ids) {
		Boolean status = false;
		vaccineService.updateStatus(ids,status);
		return "redirect:/vaccine/list";
	}
	
	@GetMapping(value = "/vaccine/update/")
	public String showUpdateVaccine(Model model,@RequestParam(name = "idUpdate", required = true) String idUpdate,RedirectAttributes redirectAttributes) {
		
		Vaccine vaccine = vaccineService.findVaccineById(idUpdate);
		
		if (vaccine==null) {
			redirectAttributes.addFlashAttribute("msg","Id is not exists!");
			return "redirect:/vaccine/list";
		}
		List<VaccineType> vaccineTypeList = new ArrayList<>();
		vaccineTypeList = vaccineTypeService.findAllActice();
		
		
		VaccineDTO vaccineDTO = new VaccineDTO();
		vaccineDTO.setId(vaccine.getId());
		vaccineDTO.setStatus(vaccine.getStatus());
		vaccineDTO.setVaccineName(vaccine.getVaccineName());
		vaccineDTO.setVaccineType(vaccine.getVaccineType());
		vaccineDTO.setNumberOfInjection(vaccine.getNumberOfInjection());
		vaccineDTO.setUsage(vaccine.getUsage());
		vaccineDTO.setIndication(vaccine.getIndication());
		vaccineDTO.setContraindication(vaccine.getContraindication());
		vaccineDTO.setTimeBeginNextInjection(vaccine.getTimeBeginNextInjection());
		vaccineDTO.setTimeEndNextInjection(vaccine.getTimeEndNextInjection());
		vaccineDTO.setOrigin(vaccine.getOrigin());
		
		model.addAttribute("vaccineTypeList", vaccineTypeList);
		model.addAttribute("vaccineUpdate", vaccineDTO);
		return "vaccine/vaccine-create";
	}
	@PostMapping(value = "/vaccine/update")
	public String updateVaccine(Model model, @Valid @ModelAttribute("vaccineDto") VaccineDTO vaccineDTO,
			BindingResult bindingResult,RedirectAttributes redirectAttributes) {
		if (bindingResult.hasErrors()) {
			return "vaccine/vaccine-update";
		}
		List<VaccineType> vaccineTypeList = new ArrayList<>();
		vaccineTypeList = vaccineTypeService.findAllActice();
		Vaccine vaccine = vaccineService.findVaccineById(vaccineDTO.getId());
		if (vaccine==null) {
			model.addAttribute("msgId","Id is not exists!");
			model.addAttribute("vaccineTypeList", vaccineTypeList);
			model.addAttribute("vaccineUpdate", vaccineDTO);
			
			return "/vaccine/vaccine-create";
		}
		Vaccine vaccineUpdate = vaccineService.update(vaccineDTO);
		
		
		if (vaccineUpdate==null) {
			model.addAttribute("vaccineTypeList", vaccineTypeList);
		model.addAttribute("msgTime", "Time to start next vaccination must be less than end time!");
			model.addAttribute("vaccineUpdate", vaccineDTO);
			return "vaccine/vaccine-create";
		}
		
		redirectAttributes.addFlashAttribute("msg", "Update vaccine successfull!");
		return "redirect:/vaccine/list";
	}
}
