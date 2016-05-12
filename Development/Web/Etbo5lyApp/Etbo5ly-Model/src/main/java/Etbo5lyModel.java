


/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


import com.iti.jet.gp.etbo5ly.model.dao.impl.CategoryDaoImpl;
import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.iti.jet.gp.etbo5ly.model.pojo.Category;
import com.iti.jet.gp.etbo5ly.model.pojo.Cook;
import com.iti.jet.gp.etbo5ly.model.pojo.CookStatus;
import com.iti.jet.gp.etbo5ly.model.pojo.Customer;
import com.iti.jet.gp.etbo5ly.model.pojo.Document;
import com.iti.jet.gp.etbo5ly.model.pojo.DocumentType;
import com.iti.jet.gp.etbo5ly.model.pojo.MenuItems;
import com.iti.jet.gp.etbo5ly.model.pojo.Order;
import com.iti.jet.gp.etbo5ly.model.pojo.OrderDetails;
import com.iti.jet.gp.etbo5ly.model.pojo.OrderDetailsId;
import com.iti.jet.gp.etbo5ly.model.pojo.OrderStatus;
import com.iti.jet.gp.etbo5ly.model.pojo.StatusHasOrder;
import com.iti.jet.gp.etbo5ly.model.pojo.StatusHasOrderId;
import com.iti.jet.gp.etbo5ly.model.pojo.Tags;
import com.iti.jet.gp.etbo5ly.model.dao.interfaces.CategoryDao;
import com.iti.jet.gp.etbo5ly.model.dao.interfaces.CookDao;
import com.iti.jet.gp.etbo5ly.model.dao.interfaces.CookStatusDao;
import com.iti.jet.gp.etbo5ly.model.dao.interfaces.CustomerDao;
import com.iti.jet.gp.etbo5ly.model.dao.interfaces.DocumentDao;
import com.iti.jet.gp.etbo5ly.model.dao.interfaces.DocumentTypeDao;
import com.iti.jet.gp.etbo5ly.model.dao.interfaces.MenuItemsDao;
import com.iti.jet.gp.etbo5ly.model.dao.interfaces.OrderDao;
import com.iti.jet.gp.etbo5ly.model.dao.interfaces.OrderDetailsDao;
import com.iti.jet.gp.etbo5ly.model.dao.interfaces.OrderStatusDao;
import com.iti.jet.gp.etbo5ly.model.dao.interfaces.RoleDao;
import com.iti.jet.gp.etbo5ly.model.dao.interfaces.StatusHasOrderDao;
import com.iti.jet.gp.etbo5ly.model.dao.interfaces.TagsDao;
import java.util.List;

/**
 *
 * @author menna
 */
public class Etbo5lyModel {

    /**
     * @param args the command line arguments
     */
    // ////////////////////////////////////////////////////////////////////////
    @SuppressWarnings("deprecation")
    public Cook addCook(ApplicationContext factory) {

        System.out.println("ADD Cook");
        CookDao cookDao = (CookDao) factory.getBean("cookDaoImpl");
        Cook cook = new Cook();
        cook.setAddress("Mohamed Farid Street");
        cook.setEmail("menna@gmail.com");
        cook.setEnabled(true);
        cook.setName("Menna Mostafa");
        cook.setPassword("8888");
        cook.setPhone("0102882822");
        cook.setRegisterationDate(new Date());
        cook.setEndWorkingHours(new Date(2016, 12, 4, 3, 30));
        cook.setStartWorkingHours(new Date(2016, 12, 4, 6, 30));
        CookStatus cookStatus = getCookStatus(factory, 1);
        System.out.println("status Name : " + cookStatus.getStatus());
        System.out.println("status ID : " + cookStatus.getStatusId());
//
        cook.setCookStatus(cookStatus);
        Set roles = new HashSet(0);
        RoleDao roleDao = (RoleDao) factory.getBean("roleDaoImpl");
        roles.add(roleDao.find(2));
        roles.add(roleDao.find(3));
        cook.setRoles(roles);

        Set items = new HashSet(0);

        MenuItems menuItems = new MenuItems();
        String desc = "";
        try {
            desc = new String("ممشم".getBytes(), "UTF-8");
            System.out.println("descccc : " + desc);
        } catch (UnsupportedEncodingException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        menuItems.setDescriptionAr(desc);
        menuItems.setDescriptionEn("allallala");
        Set categories = new HashSet(0);
        categories.add(getCategory(factory, 1));
        menuItems.setCategories(categories);
        Set tags = new HashSet(0);
        tags.add(getTags(factory, 1));
        tags.add(getTags(factory, 2));
        menuItems.setTagses(tags);
        menuItems.setCook(getCook(factory, 1));
        menuItems.setPrice(200);
        menuItems.setNameEn("pasta white saus");
        String name = "";
        try {
            name = new String("ممشم".getBytes(), "UTF-8");
            System.out.println("namenamename : " + name);

        } catch (UnsupportedEncodingException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        menuItems.setNameAr("ممشم");
        menuItems.setCook(cook);

        items.add(menuItems);
        cook.setMenuItems(items);

        cookDao.create(cook);
        System.out.println("cook is added");
        return cook;
    }

    public Cook getCook(ApplicationContext factory, int id) {

        System.out.println("get cook");

        CookDao cookDao = (CookDao) factory.getBean("cookDaoImpl");
        Cook cook = new Cook();
        return (Cook) cookDao.find(id);
    }
//	// ///////////////////////////////////////////////////////////////////////////

    public Customer addCustomer(ApplicationContext factory) {

        System.out.println("Add Customer");

        CustomerDao customerDao = (CustomerDao) factory
                .getBean("customerDaoImpl");
        Customer customer = new Customer();
        customer.setAddress("Mohandsenn");
        customer.setEmail("nadod@gmail.com");
        customer.setEnabled(true);
        customer.setName("Nada Amr");
        customer.setPassword("101010");
        customer.setPhone("0102882822");
        customer.setRegisterationDate(new Date());
        Set roles = new HashSet(0);
        RoleDao roleDao = (RoleDao) factory.getBean("roleDaoImpl");
        roles.add(roleDao.find(2));
        customer.setRoles(roles);

        customerDao.create(customer);

        System.out.println("Customer is added");

        return customer;
    }

    public Customer getCustomer(ApplicationContext factory, int id) {

        System.out.println("GetCustomer");

        CustomerDao customerDao = (CustomerDao) factory
                .getBean("customerDaoImpl");
        Customer customer = new Customer();
        return (Customer) customerDao.find(id);
    }
    
    public void deleteCustomer(ApplicationContext factory, int id) {

        System.out.println("Delete Customer");

        CustomerDao customerDao = (CustomerDao) factory
                .getBean("customerDaoImpl");
        Customer customer = new Customer();
       
          customerDao.delete(id);
    }
    
    

    // /////////////////////////////////////////////////////////////////////
    public Category addCategory(ApplicationContext factory) {

        System.out.println("Add Category");

        CategoryDao categoryDao = (CategoryDao) factory
                .getBean(CategoryDaoImpl.class);
        Category category = new Category();
        category.setNameAr("لحوم");
        category.setNameEn("Meat");
        categoryDao.create(category);
        return category;
    }

    public Category getCategory(ApplicationContext factory, int id) {
        CategoryDao categoryDao = (CategoryDao) factory
                .getBean("categoryDaoImpl");
        Category category = new Category();
        return (Category) categoryDao.find(id);
    }

    // /////////////////////////////////////////////////////////////////////
    public CookStatus addCookStatus(ApplicationContext factory, Cook cook) {

        System.out.println("Add cook Status");

        CookStatusDao cookStatusDao = (CookStatusDao) factory
                .getBean("cookStatusDaoImpl");
        CookStatus cookStatus = new CookStatus();
        cookStatus.setStatus("available");
        cookStatusDao.create(cookStatus);
        return cookStatus;
    }

    public CookStatus getCookStatus(ApplicationContext factory, int id) {

        System.out.println("Get cook status");

        CookStatusDao cookStatusDao = (CookStatusDao) factory
                .getBean("cookStatusDaoImpl");
        CookStatus cookStatus;
        cookStatus = (CookStatus) cookStatusDao.find(id);
        System.out.println("Cook Status:" + cookStatus.getStatus());
        return cookStatus;

    }

    // //////////////////////////////////////////////////////////////////////
    public Document getDocument(ApplicationContext factory, int id) {

        System.out.println("Get document");

        DocumentDao documentDao = (DocumentDao) factory
                .getBean("documentDaoImpl");
        Document document = new Document();

        return (Document) documentDao.find(id);
    }

    public Document addDocument(ApplicationContext factory) {

        System.out.println("add doc.");

        DocumentDao documentDao = (DocumentDao) factory
                .getBean("documentDaoImpl");
        Document document = new Document();
        document.setCook(getCook(factory, 36));
        document.setDescription("kakkak akkakakka kakak");
        document.setDocumentType(getDocumentType(factory, 1));
        documentDao.create(document);

        Document document2 = new Document();
        document2.setCook(getCook(factory, 36));
        document2.setDescription("kakkak akkakakka kakak");
        document2.setDocumentType(getDocumentType(factory, 2));
        documentDao.create(document2);

        return document;
    }

    // ///////////////////////////////////////////////////////////////////
    public DocumentType addDocumentType(ApplicationContext factory) {
        DocumentTypeDao documentTypeDao = (DocumentTypeDao) factory
                .getBean("documentTypeDaoImpl");
        DocumentType documentType = new DocumentType();
        documentType.setType("pdf");
        documentTypeDao.create(documentType);
        return documentType;
    }

    public DocumentType getDocumentType(ApplicationContext factory, int id) {

        System.out.println("Get doc type");

        DocumentTypeDao documentTypeDao = (DocumentTypeDao) factory
                .getBean("documentTypeDaoImpl");
        DocumentType documentType = new DocumentType();
        return (DocumentType) documentTypeDao.find(id);
    }

    // ///////////////////////////////////////////////////////////////////
    public MenuItems addMenuItems(ApplicationContext factory) {

        System.out.println("Add menuItem");

        MenuItemsDao menuItemsDao = (MenuItemsDao) factory
                .getBean("menuItemsDaoImpl");
        MenuItems menuItems = new MenuItems();

        menuItems.setDescriptionAr("اي كلام ");
        menuItems.setDescriptionEn("allallala");
        Set categories = new HashSet(0);
        categories.add(getCategory(factory, 1));
        menuItems.setCategories(categories);
        Set tags = new HashSet(0);
        tags.add(getTags(factory, 1));
        tags.add(getTags(factory, 2));
        menuItems.setTagses(tags);
        menuItems.setCook(getCook(factory, 23));
        menuItems.setPrice(200);
        menuItems.setNameEn("pasta white saus");

        menuItems.setNameAr("ممشم");
        menuItemsDao.create(menuItems);

        System.out.println("MenuItems is added");

        return menuItems;
    }

    public MenuItems getMenuItems(ApplicationContext factory, int id) {
        MenuItemsDao menuItemsDao = (MenuItemsDao) factory
                .getBean("menuItemsDaoImpl");
        return (MenuItems) menuItemsDao.find(id);

    }

    // /////////////////////////////////////////////////////////////////////
    public Order addOrder(ApplicationContext factory) {

        System.out.println("Add Order");

        OrderDao orderDao = (OrderDao) factory.getBean("orderDaoImpl");
        Order order = new Order();
        order.setUserByCookId(getCook(factory, 37));
        order.setUserByCustomerId(getCustomer(factory, 39));
        order.setOrderTime(new Date(2016, 6, 7, 3, 40));
        order.setCookComment("customer msh kwais");
        order.setDuration(30);
        order.setLocation("allallala");
        order.setOrderComment("gamel");
        order.setType("msh3rfa");

        Order order1 = orderDao.create(order);

//		Set<OrderDetails> orderDetails = new HashSet<OrderDetails>(0);
        StatusHasOrder statusHasOrder = new StatusHasOrder();
//		Set orderStatus = new HashSet(0);
        OrderStatusDao orderStatusDao = (OrderStatusDao) factory.getBean("orderStatusDaoImpl");
        OrderStatus orderStatus = (OrderStatus) orderStatusDao.find(1);
        statusHasOrder.setId(new StatusHasOrderId(orderStatus.getStatusId(), order1.getOrderId()));
        System.out.println("hereeeeeeeeee tani");
        statusHasOrder.setOrder(order1);
        statusHasOrder.setOrderStatus(orderStatus);
        statusHasOrder.setTime(new Date(2016, 6, 20, 2, 9));
        StatusHasOrderDao statusHasOrderDao = (StatusHasOrderDao) factory.getBean("statusHasOrderDaoImpl");
        statusHasOrderDao.create(statusHasOrder);

        addOrderDetails(factory, order1.getOrderId());
        System.out.println("Item is added");

        return order;
    }

    public Order getOrder(ApplicationContext factory, int id) {
        OrderDao orderDao = (OrderDao) factory.getBean("orderDaoImpl");
        return (Order) orderDao.find(id);

    }

    // //////////////////////////////////////////////////////////////////////////
    public OrderDetails addOrderDetails(ApplicationContext factory, int id) {
        System.out.println("Order Details add");

        OrderDetailsDao orderDetailsDao = (OrderDetailsDao) factory
                .getBean("orderDetailsDaoImpl");
        OrderDetails oderDetails = new OrderDetails();

        Order order = getOrder(factory, id);
        MenuItems menuItems = getMenuItems(factory, 6);
        oderDetails.setId(new OrderDetailsId(order.getOrderId(), menuItems.getItemId()));
        oderDetails.setOrder(order);
        oderDetails.setQuantity(2);
        oderDetails.setPrice((float) 200);
        oderDetails.setComment("gamel ra2e3");
        oderDetails.setMenuItems(menuItems);
        orderDetailsDao.create(oderDetails);
        System.out.println("Order Details added");

        return oderDetails;
    }

    public OrderDetails getOrderDetails(ApplicationContext factory, int id) {
        OrderDetailsDao orderDetailsDao = (OrderDetailsDao) factory
                .getBean("orderDetailsDaoImpl");
        return (OrderDetails) orderDetailsDao.find(id);

    }

    // //////////////////////////////////////////////////////////////////////////
    public Tags addTags(ApplicationContext factory) {
        TagsDao tagsDao = (TagsDao) factory.getBean("tagsDaoImpl");
        Tags tags = new Tags();
        tags.setTagAr("سننسن");
        tags.setTagEn("lebanon");
//        Set menuItems = new HashSet(0);
//        menuItems.add(getMenuItems(factory, 1));
//        tags.setMenuItems(menuItems);
        tagsDao.create(tags);
        return tags;
    }

    public Tags getTags(ApplicationContext factory, int id) {
        TagsDao tagsDao = (TagsDao) factory.getBean("tagsDaoImpl");
        Tags tags = new Tags();
        return (Tags) tagsDao.find(id);

    }

    ////////////////////////////////////////////////////////////////////////////
    
    
    public void getAllCategories(ApplicationContext factory)
    {
        CategoryDao categoryDao = (CategoryDao) factory.getBean("categoryDaoImpl");
        List<Category> categories = categoryDao.getAll();
        System.out.println("size : " + categories.size());
        System.out.println("name : " + categories.get(0).getNameAr() + " " + categories.get(0).getNameEn());
        
        
    }
    public static void main(String[] args) {

        ApplicationContext factory = getBeanFactory();
        Etbo5lyModel etbo5lyModel = new Etbo5lyModel();
        Cook cook = etbo5lyModel.addCook(factory);
//        etbo5lyModel.addDocument(factory);
////        etbo5lyModel.addMenuItems(factory);
//        MenuItems menuItems = etbo5lyModel.getMenuItems(factory, 6);
//        System.out.println(menuItems.getDescriptionEn());

//        Customer customer = etbo5lyModel.addCustomer(factory);
//        etbo5lyModel.deleteCustomer(factory,38);
//        Cook cook2 = etbo5lyModel.getCook(factory,36);
//        System.out.println("status : " + cook2.getAddress());
//        Customer customer1 = etbo5lyModel.getCustomer(factory,32);
//        System.out.println("status : " + customer1.getAddress());
////    
//        etbo5lyModel.addTags(factory);
//        etbo5lyModel.addOrder(factory);

//        etbo5lyModel.getAllCategories(factory);

    }

    private static ApplicationContext getBeanFactory() {
        // BeanFactory factory = new XmlBeanFactory(new
        // FileSystemResource("src/useroperationsdb/Userbean.xml"));

        ApplicationContext context = new ClassPathXmlApplicationContext(
                "data.xml");
        return context;// file:src/main/resources/beans.xml
    }
}
