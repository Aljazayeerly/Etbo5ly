/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.iti.jet.gp.etbo5ly.web;

import com.iti.jet.gp.etbo5ly.model.pojo.Cook;
import com.iti.jet.gp.etbo5ly.model.pojo.Document;
import com.iti.jet.gp.etbo5ly.model.pojo.DocumentType;
import com.iti.jet.gp.etbo5ly.model.pojo.User;
import com.iti.jet.gp.etbo5ly.service.CookService;
import com.iti.jet.gp.etbo5ly.service.DocumentService;
import com.iti.jet.gp.etbo5ly.service.DocumentTypeService;
import com.iti.jet.gp.etbo5ly.service.MenuItemsService;
import com.iti.jet.gp.etbo5ly.service.dto.CategoryDTO;
import com.iti.jet.gp.etbo5ly.service.dto.CookDTO;
import com.iti.jet.gp.etbo5ly.service.dto.CookDocumentDTO;
import com.iti.jet.gp.etbo5ly.service.dto.DocumentDTO;
import com.iti.jet.gp.etbo5ly.service.dto.MenuItemDTO;
import com.iti.jet.gp.etbo5ly.service.validator.FileValidator;
import com.iti.jet.gp.etbo5ly.service.wrapper.FileBucket;

import com.iti.jet.gp.etbo5ly.web.util.LoggedInUserChecker;
import com.iti.jets.gp.etbo5ly.web.mvc.controller.DocumentController;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.List;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import javax.ws.rs.QueryParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.util.FileCopyUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import com.iti.jet.gp.etbo5ly.web.util.LoggedInUserChecker;
import java.util.HashSet;
import java.util.Locale;
import java.util.Set;
import org.springframework.context.i18n.LocaleContextHolder;

/**
 *
 * @author salma
 */
@Controller
public class TestClass {

    @Autowired
    CookService cookDocumentService;

    @Autowired
    DocumentTypeService documentTypeService;

    @Autowired
    DocumentService documentService;

    @Autowired
    FileValidator fileValidator;

    @Autowired
    LoggedInUserChecker loggedInUserChecker;

    @Autowired
    MenuItemsService menuItemsService;
    private static final int BUFFER_SIZE = 4096;

    @InitBinder("fileBucket")
    protected void initBinder(WebDataBinder binder) {
        binder.setValidator(fileValidator);
        // binder.registerCustomEditor(byte[].class, new ByteArrayMultipartFileEditor());
    }

    @RequestMapping(value = {"/", "/welcome**"}, method = RequestMethod.GET)
    public ModelAndView defaultPage() {

        ModelAndView model = new ModelAndView();
        model.addObject("title", "Spring Security Login Form - Database Authentication");
        model.addObject("message", "This is default page!");
        model.setViewName("hello");
        return model;

    }

    @RequestMapping(value = "/admin**", method = RequestMethod.GET)
    public ModelAndView adminPage() {

        ModelAndView model = new ModelAndView();
        model.addObject("title", "Spring Security Login Form - Database Authentication");
        model.addObject("message", "This page is for ROLE_ADMIN only!");
        model.setViewName("admin");
        return model;

    }

    @RequestMapping(value = "/login.htm", method = RequestMethod.GET)
    public String login(@RequestParam(value = "error", required = false) String error,
            @RequestParam(value = "logout", required = false) String logout, Model model) {

        if (error != null) {
            model.addAttribute("error", error + "invalid user name and password");
        }

        if (logout != null) {
            model.addAttribute("msg", "You've been logged out successfully.");
        }

        return "login";

    }

    //for 403 access denied page
    @RequestMapping(value = "/403", method = RequestMethod.GET)
    public ModelAndView accesssDenied() {

        ModelAndView model = new ModelAndView();

        //check if user is login
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (!(auth instanceof AnonymousAuthenticationToken)) {
            UserDetails userDetail = (UserDetails) auth.getPrincipal();
            model.addObject("username", userDetail.getUsername());
        }

        model.setViewName("403");
        return model;

    }

    @RequestMapping(value = "/home.htm")
    public String index() {
        return "home";
    }

    @RequestMapping(value = "/register.htm")
    public String register() {
        return "register";
    }

    @RequestMapping(value = "/orderReview.htm")
    public String orderReview() {
        return "orderReview";
    }

    @RequestMapping(value = "/login.htm")
    public String login() {
        return "login";
    }

    @RequestMapping(value = "/kitchen.htm")
    public String showKitchens(ModelMap model,Locale locale) {
        locale = LocaleContextHolder.getLocale();
        model.addAttribute("local", locale);
        return "kitchen";
    }

    @RequestMapping(value = "/neighbouringKitchen.htm")
    public String neighbouringKitchens() {
        return "neighbouringKitchens";
    }

    @RequestMapping(value = "/cart.htm")
    public String cart() {
        return "cart";
    }

    @RequestMapping(value = "/cooksInformation.htm")
    public String cookInformation() {
        return "cookInfo";
    }

    @RequestMapping(value = "/orderReview2.htm")
    public String orderReview2() {
        return "orderReview2";

    }

    @RequestMapping(value = "/customerOrders.htm")
    public String customerOrders() {
        return "customerOrders";
    }

    @RequestMapping(value = "/customerOrder.htm")
    public String customerOrder() {
        return "customerOrder";
    }

    @RequestMapping(value = "/cookKitchen.htm")
    @QueryParam("id")
    public String cookKitchen(@RequestParam(value = "id") int id) {
        return "cookKitchen";
    }

    @RequestMapping(value = "/orderReviewDialog.htm")
    public String orderReviewDialog() {
        return "orderReviewDialog";
    }

//    
//    @RequestMapping(value = "/joinUS.htm")
//    public String cookRegister(){
//        return "cookRegister";
//    }
    @RequestMapping(value = "/joinUS.htm")
    public ModelAndView cookRegister() {
        CookDocumentDTO cook = new CookDocumentDTO();
        ModelAndView model = new ModelAndView("cookRegister", "cook", cook);
        //  return new ModelAndView("cookRegister", "cook", new CookDocumentDTO()); 
        return model;
    }

    @RequestMapping(value = "/addItem.htm")
    public ModelAndView addItem() {
        System.out.println("geeeeeeeeeeeeet");
        MenuItemDTO meal = new MenuItemDTO();
        ModelAndView model = new ModelAndView("addItem", "addItem", meal);
        return model;
    }

//    @RequestMapping(value = "/cookKitchen.htm")
//    @QueryParam("id")
//    public String cookKitchen(@RequestParam(value = "id") int id) {
//        return "cookKitchen";
//    }
    @RequestMapping(value = "/addressDetailsDialog.htm")

    public String addressDetailsDialog() {
        return "addressDetailsDialog";
    }

    @RequestMapping(value = "/customerOrderDialog.htm")
    public String customerOrderDialog() {
        return "customerOrderDialog";
    }

    @RequestMapping(value = "/orderDialog.htm")
    public String orderDialog() {
        return "orderDialog";
    }

    @RequestMapping(value = "/customerOrderRatingDialog.htm")
    public String customerOrderRatingDialog() {
        return "customerOrderRatingDialog";
    }

    @RequestMapping(value = "/cookOrders.htm")
    public String cookOrders() {
        return "cookOrders";
    }

    @RequestMapping(value = "/cookOrderDialog.htm")
    public String cookOrderDialog() {
        return "cookOrderDialog";
    }

    @RequestMapping(value = "/cookOrderRatingDialog.htm")
    public String cookOrderRatingDialog() {
        return "cookOrderRatingDialog";
    }

    @RequestMapping(value = "/success.htm")
    public String RegisterSuccess() {
        return "registerSuccess";
    }

    @RequestMapping(value = "/add-document.htm")
    @QueryParam("id")
    public ModelAndView uploadDocuments(@RequestParam(value = "id") int id) {
        Cook cook = cookDocumentService.findById(id);
        //  model.addAttribute("cook", cook);
        FileBucket fileModel = new FileBucket();
        //  model.addAttribute("fileBucket", fileModel);
        // return "add-document";
        return new ModelAndView("add-document", "fileBucket", fileModel);
    }

    @RequestMapping(value = "/cookProfile.htm")
    public String cookProfile() {
        return "cookProfile";
    }

    @RequestMapping(value = "joinUS.htm", method = RequestMethod.POST)
    public String RegisterCook(@ModelAttribute("cook") @Valid CookDocumentDTO cook, BindingResult result, ModelMap model) {
        cookDocumentService.insertCook(cook);
        if (result.hasErrors()) {
            return "cookRegister";
        } else {
            int id = cookDocumentService.getCookId(cook.getEmail());
            cook.setId(id);
            //  model.addAttribute("success", "User " + cook.getName() + " was  Registered successfully");
            return "redirect:/add-document.htm?id=" + cook.getId();
        }
    }

    @RequestMapping(value = "addItem.htm", method = RequestMethod.POST)
    public String addMenuItemService(@ModelAttribute("addItem") MenuItemDTO menuItem, ModelMap model, HttpServletRequest request) throws IOException {

        if (checkTypeAvalability(menuItem.getImages().getContentType()) == 2 || checkTypeAvalability(menuItem.getImages().getContentType()) == 4) {
            Set<CategoryDTO> categories = new HashSet<>(0);
            CategoryDTO categoryDTO = new CategoryDTO();
            User user = loggedInUserChecker.getLoggedUser();
            menuItem.setCookId(user.getId());
            categoryDTO.setCategoryId(Integer.parseInt(menuItem.getChecked()));
            System.out.println("idddddddd " + menuItem.getChecked());
            categories.add(categoryDTO);

            menuItem.setCategories(categories);
            menuItem.setImage(menuItem.getImages().getBytes());

            String type = menuItem.getImages().getContentType();
            if (type.equals("image/png")) {
                menuItem.setImageUrl(menuItem.getNameEn() + ".png");
            } else if (type.equals("image/jpeg")) {
                menuItem.setImageUrl(menuItem.getNameEn() + ".jpg");

            }

            String filePath = "/resources/images/meals/";
            // get absolute path of the application
            ServletContext context = request.getServletContext();
            String appPath = context.getRealPath("");
            System.out.println("appPath = " + appPath);

            String saveDirectory = appPath + filePath;
            if (menuItem.getImages() != null && menuItem.getImages().getSize() > 0) {
                // String fileName = fileBucket.getImage().getOriginalFilename();
//            if (!cook.getName().equalsIgnoreCase("")) {
                if (type.equals("image/jpeg")) {
                    menuItem.getImages().transferTo(new File(saveDirectory + menuItem.getNameEn() + ".jpg"));
                } else if (type.equals("image/png")) {
                    menuItem.getImages().transferTo(new File(saveDirectory + menuItem.getNameEn() + ".png"));

//                }
                }

            }
            menuItemsService.addMenuItem(menuItem);

            return "home";
        } else {
            model.addAttribute("menuimage", "Invalid menu item image it should be jpg or png ");
            return "addItem";
        }

    }

    @RequestMapping(value = {"/add-document.htm"}, method = RequestMethod.POST)
    @QueryParam("id")
    public String uploadDocument(@ModelAttribute("fileBucket") @Valid FileBucket fileBucket, ModelMap model, BindingResult result, @RequestParam(value = "id") int cookId, HttpServletRequest request) throws IOException {

        int typeId;
        int imageTypeId;
        if (result.hasErrors()) {
            // System.out.println("validation errors");
            Cook cook = cookDocumentService.findById(cookId);
            model.addAttribute("cook", cook);
            return "add-document";
        } else {
            Cook cook = cookDocumentService.findById(cookId);
            model.addAttribute("cook", cook);
            System.out.println("file content type " + fileBucket.getFile().getContentType());
            typeId = checkTypeAvalability(fileBucket.getFile().getContentType());
            imageTypeId = checkTypeAvalability(fileBucket.getImage().getContentType());
            if (typeId != 0) {
                saveDocument(fileBucket, cook, typeId);
                List<Document> documents = documentService.findAllByUserId(cookId);
                model.addAttribute("documents", documents);
                model.addAttribute("success", " Congartulation the File was uploaded successfully");

            } else {
                model.addAttribute("invalid", " invalid file type it should be pdf or zipped or image/png");
            }
            if (imageTypeId != 0) {
                if (imageTypeId == 2 || imageTypeId == 4) {
                    uploadCookImage(fileBucket, cook, typeId, request);
                    model.addAttribute("imageDone", "Image is uploaded successfully");

                } else {
                    model.addAttribute("notImage", "The file you uploaded is not an image ");
                }

            } else {
                model.addAttribute("invalidImage", "invalid Image type ");
            }

            return "add-document";
        }
    }

    private void saveDocument(FileBucket fileBucket, Cook cook, int typeId) throws IOException {

        DocumentDTO document = new DocumentDTO();

        MultipartFile multipartFile = fileBucket.getFile();
//        System.out.println("get type"+ fileBucket.getFile().getSize());

        // document.setName(multipartFile.getOriginalFilename());
        document.setDescription(fileBucket.getDescription());
        document.setDocumentTypeType(multipartFile.getContentType());
        document.setDocument(multipartFile.getBytes());
        document.setCookId(cook.getId());
        document.setDocumentTypeDocumentTypeId(typeId);
        //  document.setVerfied();

        System.out.println("documents " + document.toString());
        documentService.insertDocument(document);
    }

//    @RequestMapping(value = "/addItem.htm")
//    public String addItem() {
//        return "addItem";
//
//    }
    public int checkTypeAvalability(String type) {
        //  System.out.println("hahahaha lakaksjon");
        int typeId;
        DocumentType documentType = documentTypeService.checkTypeAvailable(type);
        if (documentType != null) {
            typeId = documentType.getDocumentTypeId();
        } else {
            typeId = 0;
        }
        return typeId;
    }

    private void uploadCookImage(FileBucket fileBucket, Cook cook, int typeId, HttpServletRequest request) throws IOException {

        String type = fileBucket.getImage().getContentType();
        if (type.equals("image/png")) {
            cookDocumentService.uploadImage(cook.getId(), cook.getName() + ".png", fileBucket.getImage().getBytes());
        } else if (type.equals("image/jpeg")) {
            cookDocumentService.uploadImage(cook.getId(), cook.getName() + ".jpg", fileBucket.getImage().getBytes());

        }

        String filePath = "/resources/images/cooks/";
        // get absolute path of the application
        ServletContext context = request.getServletContext();
        String appPath = context.getRealPath("");
        System.out.println("appPath = " + appPath);

        String saveDirectory = appPath + filePath;
        if (fileBucket.getImage() != null && fileBucket.getImage().getSize() > 0) {
            // String fileName = fileBucket.getImage().getOriginalFilename();
            if (!cook.getName().equalsIgnoreCase("")) {
                if (type.equals("image/jpeg")) {
                    fileBucket.getImage().transferTo(new File(saveDirectory + cook.getName() + ".jpg"));
                } else if (type.equals("image/png")) {
                    fileBucket.getImage().transferTo(new File(saveDirectory + cook.getName() + ".png"));

                }
            }

        }

    }

}
