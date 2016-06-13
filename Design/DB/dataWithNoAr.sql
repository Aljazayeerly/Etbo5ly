
INSERT INTO `etbo5ly`.`category` (category_id,`name_en`, `name_ar`) VALUES (1,'Sandwich', '”‰œÊÌ‘');
INSERT INTO `etbo5ly`.`category` (category_id,`name_en`, `name_ar`) VALUES (2,'Salad', '”·ÿ…');
INSERT INTO `etbo5ly`.`category` (category_id,`name_en`, `name_ar`) VALUES (3,'Pasta', '„⁄Ã‰« ');
INSERT INTO `etbo5ly`.`category` (category_id,`name_en`, `name_ar`) VALUES (4,'Soup', '‘Ê—»…');

INSERT INTO `etbo5ly`.`cook_status` (`status_id`, `status`) VALUES ('1', 'Working');
INSERT INTO `etbo5ly`.`cook_status` (`status_id`, `status`) VALUES ('2', 'Pending');


INSERT INTO `etbo5ly`.`country` (`country_id`, `country_name`, `country_name_ar`) VALUES ('1', 'Egypt', '');

INSERT INTO `etbo5ly`.`city` (`city_id`, `city_name`, `city_name_ar`, `country_id`) VALUES ('1', 'Cairo', '', '1');
INSERT INTO `etbo5ly`.`city` (`city_id`, `city_name`, `city_name_ar`, `country_id`) VALUES ('2', 'Giza', '', '1');

INSERT INTO `etbo5ly`.`tags` (`tag_id`, `tag_en`, `tag_ar`) VALUES ('1', 'Oriental', '«ﬂ· ‘—ﬁÌ');
INSERT INTO `etbo5ly`.`tags` (`tag_id`, `tag_en`, `tag_ar`) VALUES ('2', 'Syrian', '√ﬂ· ”Ê—Ì');
INSERT INTO `etbo5ly`.`tags` (`tag_id`, `tag_en`, `tag_ar`) VALUES ('3', 'Diet', '—ÃÌ„');
INSERT INTO `etbo5ly`.`tags` (`tag_id`, `tag_en`, `tag_ar`) VALUES ('4', 'dessert', 'Õ·ÊÌ« ');
INSERT INTO `etbo5ly`.`tags` (`tag_id`, `tag_en`, `tag_ar`) VALUES ('5', 'vegetarian', '‰»« Ì');


INSERT INTO `etbo5ly`.`region` (`region_id`, `region_name`, `region_name_ar`, `city_id`) VALUES ('1', 'Haram St.', '', '2');
INSERT INTO `etbo5ly`.`region` (`region_id`, `region_name`, `region_name_ar`, `city_id`) VALUES ('2', 'Faisal St.', '', '2');
INSERT INTO `etbo5ly`.`region` (`region_id`, `region_name`, `region_name_ar`, `city_id`) VALUES ('3', 'Smart Village', '', '2');
INSERT INTO `etbo5ly`.`region` (`region_id`, `region_name`, `region_name_ar`, `city_id`) VALUES ('4', 'Nasr City', '', '1');
INSERT INTO `etbo5ly`.`region` (`region_id`, `region_name`, `region_name_ar`, `city_id`) VALUES ('5', 'Masr gdeeda', '', '1');
INSERT INTO `etbo5ly`.`region` (`region_id`, `region_name`, `region_name_ar`, `city_id`) VALUES ('6', 'Nozha', '', '1');
INSERT INTO `etbo5ly`.`region` (`region_id`,`region_name`, `region_name_ar`, `city_id`) VALUES ('7','Shiekh Zayed', '', '2');

INSERT INTO `etbo5ly`.`user` (id,`name`, `email`, `password`, `enabled`, `registeration_date`, `phone`, `address`, `longitude`, `latitude`, `region_id`) VALUES ('1','AlJazayeerly', 'aljazayeerly@gmail.com', '12345', '1', '2015-04-16 17:30:00', '01001358909', 'ITI', '31.021249', '30.071572', '3');
INSERT INTO `etbo5ly`.`user` (id,`name`, `email`, `password`, `enabled`, `registeration_date`, `phone`, `address`, `longitude`, `latitude`, `region_id`,`image_url`) VALUES ('2','Menna', 'Menna@gmail.com', '12345', '1', '2015-04-16 17:30:00', '01001358909', 'Shiekh Zayed', '31.021732', '30.031087', '7','menna.jpg');
INSERT INTO `etbo5ly`.`user` (id,`name`, `email`, `password`, `enabled`, `registeration_date`, `phone`, `address`, `longitude`, `latitude`, `region_id`,`image_url`) VALUES ('3','Nada', 'Nada@gmail.com', '12345', '1', '2015-04-16 17:30:00', '01001358909', 'Shiekh Zayed', '31.009780', '30.023396', '7','nada.jpg');
INSERT INTO `etbo5ly`.`user` (id,`name`, `email`, `password`, `enabled`, `registeration_date`, `phone`, `address`, `longitude`, `latitude`, `region_id`,`image_url`) VALUES ('4','Salma', 'Salma@gmail.com', '12345', '1', '2015-04-16 17:30:00', '01001358909', 'Shiekh Zayed', '31.005081', '30.050313', '7','salma.jpg');
INSERT INTO `etbo5ly`.`user` (id,`name`, `email`, `password`, `enabled`, `registeration_date`, `phone`, `address`, `longitude`, `latitude`, `region_id`,`image_url`) VALUES ('5','Noha', 'Noha@gmail.com', '12345', '1', '2015-04-16 17:30:00', '01001358909', 'Shiekh Zayed', '30.975534', '30.059376', '7','noha.jpg');
INSERT INTO `etbo5ly`.`user` (id,`name`, `email`, `password`, `enabled`, `registeration_date`, `phone`, `address`, `longitude`, `latitude`, `region_id`,`image_url`) VALUES ('6','Sana', 'Sana@gmail.com', '12345', '1', '2015-04-16 17:30:00', '01001358909', 'Masr gdeeda', '31.336098', '30.054664', '4','sana.jpg');

INSERT INTO `etbo5ly`.`cook` (`id`, `start_working_hours`, `end_working_hours`, `cook_status_id`) VALUES ('2', '10:00:00', '22:00:00', '2');
INSERT INTO `etbo5ly`.`cook` (`id`, `start_working_hours`, `end_working_hours`, `cook_status_id`) VALUES ('3', '09:00:00', '18:00:00', '2');
INSERT INTO `etbo5ly`.`cook` (`id`, `start_working_hours`, `end_working_hours`, `cook_status_id`) VALUES ('4', '11:00:00', '15:00:00', '2');
INSERT INTO `etbo5ly`.`cook` (`id`, `start_working_hours`, `end_working_hours`, `cook_status_id`) VALUES ('5', '08:00:00', '23:00:00', '2');
INSERT INTO `etbo5ly`.`cook` (`id`, `start_working_hours`, `end_working_hours`, `cook_status_id`) VALUES ('6', '00:00:00', '23:59:59', '2');

INSERT INTO `etbo5ly`.`customer` (`id`) VALUES ('1');



INSERT INTO `etbo5ly`.`menu_items` (`item_id`, `name_en`, `name_ar`, `price`, `description_en`, `description_ar`, `item_rate`, `cook_id`, `image_URL`) VALUES ('1', 'Rocca Quinoa with  salad', '', '39', 'Delicious and healthy salad that contains Rocca , Quinoa , Cherry tomatoes, Olive oil and halumi grilled cheese', '', '3', '2', 'images (1).jpg');
INSERT INTO `etbo5ly`.`menu_items` (`item_id`, `name_en`, `name_ar`, `price`, `description_en`, `description_ar`, `item_rate`, `cook_id`, `image_URL`) VALUES ('2', 'Vegetarian potato salad', '', '20', 'potatoes 500gm with sweet corn, pickles & onions with a sauce of light olive oil, lemon and coriander', '', '5', '3', 'images (2).jpg');
INSERT INTO `etbo5ly`.`menu_items` (`item_id`, `name_en`, `name_ar`, `price`, `description_en`, `description_ar`, `item_rate`, `cook_id`, `image_URL`) VALUES ('3', 'Salad with Grilled Chicken (207cal)', '', '33', '200g Grilled chicken strips surrounded by greens, low cal dressing and pickles& mushroom Perfect for a light lunch ', '', '4', '4', 'images (3).jpg');
INSERT INTO `etbo5ly`.`menu_items` (`item_id`, `name_en`, `name_ar`, `price`, `description_en`, `description_ar`, `item_rate`, `cook_id`, `image_URL`) VALUES ('4', 'chicken with Baked Potato', '', '40', 'Perfectly baked chicken and potato with honey mustard sauce for a match made in Heaven taste Ö try it now !!!', '', '3', '5', 'images (4).jpg');
INSERT INTO `etbo5ly`.`menu_items` (`item_id`, `name_en`, `name_ar`, `price`, `description_en`, `description_ar`, `item_rate`, `cook_id`, `image_URL`) VALUES ('5', 'Rice with Nuts+Grilled Chicken Breast+Caesar ', '', '45', 'Delicious rice with nuts (Raisins+Almonds+Walnuts), grilled chicken breast & Caesar Salad,a complete meal.', '', '4', '6', 'images (5).jpg');
INSERT INTO `etbo5ly`.`menu_items` (`item_id`, `name_en`, `name_ar`, `price`, `description_en`, `description_ar`, `item_rate`, `cook_id`, `image_URL`) VALUES ('6', 'Red Sauce Pasta & Chicken Panne Salad', '', '30', 'Just like how your MUM or Grandmother would cook it. perfect comforting lunch after a long hard day.', ' ', '5', '2', 'images (6).jpg');
INSERT INTO `etbo5ly`.`menu_items` (`item_id`, `name_en`, `name_ar`, `price`, `description_en`, `description_ar`, `item_rate`, `cook_id`, `image_URL`) VALUES ('7', 'Lebanese fatta (Debs ', '', '14', 'A lebaneese specialty that will make u crave it day and night.caramelized onions and chicken in debs roman sauce ', '', '2', '3', 'images (7).jpg');
INSERT INTO `etbo5ly`.`menu_items` (`item_id`, `name_en`, `name_ar`, `price`, `description_en`, `description_ar`, `item_rate`, `cook_id`, `image_URL`) VALUES ('8', 'Lentils Soup', '', '25', 'Warm yourself up with our rich lentil soup topped with our crispy croutons and a hint of lemon', '', '4', '4', 'images (8).jpg');
INSERT INTO `etbo5ly`.`menu_items` (`item_id`, `name_en`, `name_ar`, `price`, `description_en`, `description_ar`, `item_rate`, `cook_id`, `image_URL`) VALUES ('9', 'Mushroom Soup', '', '30', 'Tummy warming blend that will keep you wanting more', '', '4', '5', 'images (9).jpg');
INSERT INTO `etbo5ly`.`menu_items` (`item_id`, `name_en`, `name_ar`, `price`, `description_en`, `description_ar`, `item_rate`, `cook_id`, `image_URL`) VALUES ('10', 'Vegetarian glass noodles', '', '18', 'Perfectly cooked Chinese glass noodles with a mix of bell peppers and exquisite Chinese sauce that makes a party in ', '', '2', '6', 'images (10).jpg');
INSERT INTO `etbo5ly`.`menu_items` (`item_id`, `name_en`, `name_ar`, `price`, `description_en`, `description_ar`, `item_rate`, `cook_id`, `image_URL`) VALUES ('11', 'Sojok Eskandarani Pasta', '', '27', 'Mouth watering sujok rings with onions and green peppers over a bed of red sauce pasta', '', '3', '2', 'images (11).jpg');


INSERT INTO `etbo5ly`.`category_has_menu_items` (`category_category_id`, `menu_items_item_id`) VALUES ('4', '8');
INSERT INTO `etbo5ly`.`category_has_menu_items` (`category_category_id`, `menu_items_item_id`) VALUES ('4', '9');
INSERT INTO `etbo5ly`.`category_has_menu_items` (`category_category_id`, `menu_items_item_id`) VALUES ('3', '10');
INSERT INTO `etbo5ly`.`category_has_menu_items` (`category_category_id`, `menu_items_item_id`) VALUES ('3', '11');
INSERT INTO `etbo5ly`.`category_has_menu_items` (`category_category_id`, `menu_items_item_id`) VALUES ('2', '2');
INSERT INTO `etbo5ly`.`category_has_menu_items` (`category_category_id`, `menu_items_item_id`) VALUES ('2', '3');
INSERT INTO `etbo5ly`.`category_has_menu_items` (`category_category_id`, `menu_items_item_id`) VALUES ('2', '4');

INSERT INTO `etbo5ly`.`tags_has_menu_items` (`tags_tag_id`, `menu_item_id`) VALUES ('3', '2');
INSERT INTO `etbo5ly`.`tags_has_menu_items` (`tags_tag_id`, `menu_item_id`) VALUES ('5', '2');
INSERT INTO `etbo5ly`.`tags_has_menu_items` (`tags_tag_id`, `menu_item_id`) VALUES ('1', '8');
INSERT INTO `etbo5ly`.`tags_has_menu_items` (`tags_tag_id`, `menu_item_id`) VALUES ('1', '11');
INSERT INTO `etbo5ly`.`tags_has_menu_items` (`tags_tag_id`, `menu_item_id`) VALUES ('2', '7');
INSERT INTO `etbo5ly`.`tags_has_menu_items` (`tags_tag_id`, `menu_item_id`) VALUES ('3', '8');


INSERT INTO `etbo5ly`.`role` (`id`, `role`) VALUES ('1', 'COOK');
INSERT INTO `etbo5ly`.`role` (`id`, `role`) VALUES ('2', 'CUSTOMER');
INSERT INTO `etbo5ly`.`role` (`id`, `role`) VALUES ('3', 'ADMIN');


INSERT INTO `etbo5ly`.`user_has_role` (`user_id`, `role_id`) VALUES ('1', '2');
INSERT INTO `etbo5ly`.`user_has_role` (`user_id`, `role_id`) VALUES ('2', '1');
INSERT INTO `etbo5ly`.`user_has_role` (`user_id`, `role_id`) VALUES ('3', '1');
INSERT INTO `etbo5ly`.`user_has_role` (`user_id`, `role_id`) VALUES ('4', '1');
INSERT INTO `etbo5ly`.`user_has_role` (`user_id`, `role_id`) VALUES ('5', '1');
INSERT INTO `etbo5ly`.`user_has_role` (`user_id`, `role_id`) VALUES ('6', '1');


INSERT INTO `etbo5ly`.`order` (`order_id`, `location`, `duration`, `type`, `customer_id`, `cook_id`, `longitude`, `latitude`, `region_id`, `address_details`) VALUES ('1', 'ITI', '45', '1', '1', '2', '31.021249', '30.071572', '3', 'Information Technology Institute');

INSERT INTO `etbo5ly`.`order_details` (`quantity`, `price`, `rating`, `comment`, `order_id`, `menu_item_id`) VALUES ('2', '39', '3', 'good', '1', '1');
INSERT INTO `etbo5ly`.`order_details` (`quantity`, `price`, `rating`, `comment`, `order_id`, `menu_item_id`) VALUES ('1', '30', '4', 'very good', '1', '6');

INSERT INTO `etbo5ly`.`order_status` (`status_id`, `status`) VALUES ('1', 'New');
INSERT INTO `etbo5ly`.`order_status` (`status_id`, `status`) VALUES ('2', 'Preparing');
INSERT INTO `etbo5ly`.`order_status` (`status_id`, `status`) VALUES ('3', 'In Way');
INSERT INTO `etbo5ly`.`order_status` (`status_id`, `status`) VALUES ('4', 'Delivered');

INSERT INTO `etbo5ly`.`status_has_order` (`status_status_id`, `order_order_id`, `time`) VALUES ('1', '1', '2015-04-16 17:30:00');
INSERT INTO `etbo5ly`.`status_has_order` (`status_status_id`, `order_order_id`, `time`) VALUES ('2', '1', '2015-04-16 18:30:00');
INSERT INTO `etbo5ly`.`status_has_order` (`status_status_id`, `order_order_id`, `time`) VALUES ('3', '1', '2015-04-16 19:30:00');
INSERT INTO `etbo5ly`.`status_has_order` (`status_status_id`, `order_order_id`, `time`) VALUES ('4', '1', '2015-04-16 20:30:00');

INSERT INTO `etbo5ly`.`document_type` (`document_type_id`, `type`) VALUES ('1', 'application/pdf');
INSERT INTO `etbo5ly`.`document_type` (`document_type_id`, `type`) VALUES ('2', 'image/png');
INSERT INTO `etbo5ly`.`document_type` (`document_type_id`, `type`) VALUES ('3', 'application/x-zip-compressed');
