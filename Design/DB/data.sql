
INSERT INTO `etbo5ly`.`category` (category_id,`name_en`, `name_ar`) VALUES (1,'Sandwich', '”‰œÊÌ‘');
INSERT INTO `etbo5ly`.`category` (category_id,`name_en`, `name_ar`) VALUES (2,'Salad', '”·ÿ…');
INSERT INTO `etbo5ly`.`category` (category_id,`name_en`, `name_ar`) VALUES (3,'Pasta', '„⁄Ã‰« ');
INSERT INTO `etbo5ly`.`category` (category_id,`name_en`, `name_ar`) VALUES (4,'Soup', '‘Ê—»…');

INSERT INTO `etbo5ly`.`cook_status` (`status_id`, `status`) VALUES ('1', 'New');
INSERT INTO `etbo5ly`.`cook_status` (`status_id`, `status`) VALUES ('2', 'Pending');
INSERT INTO `etbo5ly`.`cook_status` (`status_id`, `status`) VALUES ('3', 'Working');


INSERT INTO `etbo5ly`.`country` (`country_id`, `country_name`, `country_name_ar`) VALUES ('1', 'Egypt', '„’—');

INSERT INTO `etbo5ly`.`city` (`city_id`, `city_name`, `city_name_ar`, `country_id`) VALUES ('1', 'Cairo', '«·ﬁ«Â—…', '1');
INSERT INTO `etbo5ly`.`city` (`city_id`, `city_name`, `city_name_ar`, `country_id`) VALUES ('2', 'Giza', '«·ÃÌ“…', '1');

INSERT INTO `etbo5ly`.`tags` (`tag_id`, `tag_en`, `tag_ar`) VALUES ('1', 'Oriental', '«ﬂ· ‘—ﬁÌ');
INSERT INTO `etbo5ly`.`tags` (`tag_id`, `tag_en`, `tag_ar`) VALUES ('2', 'Syrian', '√ﬂ· ”Ê—Ì');
INSERT INTO `etbo5ly`.`tags` (`tag_id`, `tag_en`, `tag_ar`) VALUES ('3', 'Diet', '—ÃÌ„');
INSERT INTO `etbo5ly`.`tags` (`tag_id`, `tag_en`, `tag_ar`) VALUES ('4', 'dessert', 'Õ·ÊÌ« ');
INSERT INTO `etbo5ly`.`tags` (`tag_id`, `tag_en`, `tag_ar`) VALUES ('5', 'vegetarian', '‰»« Ì');


INSERT INTO `etbo5ly`.`region` (`region_id`, `region_name`, `region_name_ar`, `city_id`) VALUES ('1', 'Haram St.', '‘«—⁄ «·Â—„', '2');
INSERT INTO `etbo5ly`.`region` (`region_id`, `region_name`, `region_name_ar`, `city_id`) VALUES ('2', 'Faisal St.', '‘«—⁄ ›Ì’·', '2');
INSERT INTO `etbo5ly`.`region` (`region_id`, `region_name`, `region_name_ar`, `city_id`) VALUES ('3', 'Smart Village', '«·ﬁ—Ì… «·–ﬂÌ…', '2');
INSERT INTO `etbo5ly`.`region` (`region_id`, `region_name`, `region_name_ar`, `city_id`) VALUES ('4', 'Nasr City', '„œÌ‰… ‰’—', '1');
INSERT INTO `etbo5ly`.`region` (`region_id`, `region_name`, `region_name_ar`, `city_id`) VALUES ('5', 'Masr gdeeda', '„’— «·ÃœÌœ…', '1');
INSERT INTO `etbo5ly`.`region` (`region_id`, `region_name`, `region_name_ar`, `city_id`) VALUES ('6', 'Nozha', '«·‰“Â…', '1');
INSERT INTO `etbo5ly`.`region` (`region_id`,`region_name`, `region_name_ar`, `city_id`) VALUES ('7','Shiekh Zayed', '«·‘ÌŒ “«Ìœ', '2');

INSERT INTO `etbo5ly`.`user` (id,`name`, `email`, `password`, `enabled`, `registeration_date`, `phone`, `address`, `longitude`, `latitude`, `region_id`) VALUES ('1','AlJazayeerly', 'aljazayeerly@gmail.com', '12345', '1', '2015-04-16 17:30:00', '01001358909', 'ITI', '31.021249', '30.071572', '3');
INSERT INTO `etbo5ly`.`user` (id,`name`, `email`, `password`, `enabled`, `registeration_date`, `phone`, `address`, `longitude`, `latitude`, `region_id`) VALUES ('2','Menna', 'Menna@gmail.com', '12345', '1', '2015-04-16 17:30:00', '01001358909', 'Shiekh Zayed', '31.021732', '30.031087', '7');
INSERT INTO `etbo5ly`.`user` (id,`name`, `email`, `password`, `enabled`, `registeration_date`, `phone`, `address`, `longitude`, `latitude`, `region_id`) VALUES ('3','Nada', 'Nada@gmail.com', '12345', '1', '2015-04-16 17:30:00', '01001358909', 'Shiekh Zayed', '31.009780', '30.023396', '7');
INSERT INTO `etbo5ly`.`user` (id,`name`, `email`, `password`, `enabled`, `registeration_date`, `phone`, `address`, `longitude`, `latitude`, `region_id`) VALUES ('4','Salma', 'Salma@gmail.com', '12345', '1', '2015-04-16 17:30:00', '01001358909', 'Shiekh Zayed', '31.005081', '30.050313', '7');
INSERT INTO `etbo5ly`.`user` (id,`name`, `email`, `password`, `enabled`, `registeration_date`, `phone`, `address`, `longitude`, `latitude`, `region_id`) VALUES ('5','Noha', 'Noha@gmail.com', '12345', '1', '2015-04-16 17:30:00', '01001358909', 'Shiekh Zayed', '30.975534', '30.059376', '7');
INSERT INTO `etbo5ly`.`user` (id,`name`, `email`, `password`, `enabled`, `registeration_date`, `phone`, `address`, `longitude`, `latitude`, `region_id`) VALUES ('6','Sana', 'Sana@gmail.com', '12345', '1', '2015-04-16 17:30:00', '01001358909', 'Masr gdeeda', '31.336098', '30.054664', '4');

INSERT INTO `etbo5ly`.`cook` (`id`, `start_working_hours`, `end_working_hours`, `cook_status_id`) VALUES ('2', '10:00:00', '22:00:00', '3');
INSERT INTO `etbo5ly`.`cook` (`id`, `start_working_hours`, `end_working_hours`, `cook_status_id`) VALUES ('3', '09:00:00', '18:00:00', '3');
INSERT INTO `etbo5ly`.`cook` (`id`, `start_working_hours`, `end_working_hours`, `cook_status_id`) VALUES ('4', '11:00:00', '15:00:00', '3');
INSERT INTO `etbo5ly`.`cook` (`id`, `start_working_hours`, `end_working_hours`, `cook_status_id`) VALUES ('5', '08:00:00', '23:00:00', '3');
INSERT INTO `etbo5ly`.`cook` (`id`, `start_working_hours`, `end_working_hours`, `cook_status_id`) VALUES ('6', '00:00:00', '23:59:59', '3');

INSERT INTO `etbo5ly`.`customer` (`id`) VALUES ('1');



INSERT INTO `etbo5ly`.`menu_items` (`item_id`, `name_en`, `name_ar`, `price`, `description_en`, `description_ar`, `item_rate`, `cook_id`, `image_URL`) VALUES ('1', 'Rocca Quinoa with grilled Halumi cheese salad', '”·ÿÂ «·Ã—ÃÌ— »«·Ã»‰ «·Õ·Ê„Ï «·„‘ÊÏ', '39', 'Delicious and healthy salad that contains Rocca , Quinoa , Cherry tomatoes, Olive oil and halumi grilled cheese', '”·ÿÂ ’ÕÌÂ ·–Ì–Â   ﬂÊ‰ „‰ «·Ã—ÃÌ— Ê «·ﬂÌ‰ÊÂ Êÿ„«ÿ„ ‘Ì—Ï »“Ì  «·“Ì Ê‰ Ê «·Ã»‰ «·Õ·Ê„Ï «·„‘ÊÏ', '3', '2', 'image1.jpg');
INSERT INTO `etbo5ly`.`menu_items` (`item_id`, `name_en`, `name_ar`, `price`, `description_en`, `description_ar`, `item_rate`, `cook_id`, `image_URL`) VALUES ('2', 'Vegetarian potato salad', '”·ÿÂ «·»ÿ«ÿ”', '20', 'potatoes 500gm with sweet corn, pickles & onions with a sauce of light olive oil, lemon and coriander', '500 Ã—«„ „‰ «·»ÿ«ÿ” «·„”·ÊﬁÂ »«·–—Â «·Õ·ÊÂ Ê «·ŒÌ«— Ê «·»’· »’Ê’ “Ì  «·“Ì Ê‰ »«·Ì„Ê‰ Ê «·»ﬁœÊ‰”', '5', '3', 'image2.jpg');
INSERT INTO `etbo5ly`.`menu_items` (`item_id`, `name_en`, `name_ar`, `price`, `description_en`, `description_ar`, `item_rate`, `cook_id`, `image_URL`) VALUES ('3', 'Green Salad with Grilled Chicken (207cal)', '”·ÿÂ Õ÷—«¡ »«·›—«Œ', '33', '200g Grilled chicken strips surrounded by greens, low cal dressing and pickles& mushroom Perfect for a light lunch ', '200Ã—«„ „‰ ‘—«∆Õ «·œÃ«Ã «·„‘ÊÌ „⁄ «·Œ” Ê«·„‘—Ê„ Ê «·ŒÌ«— Ê ’Ê’ ﬁ·Ì· «·”⁄—«  ° ·€–«¡ ’ÕÌ Ê ·–Ì–', '4', '4', 'image3.jpg');
INSERT INTO `etbo5ly`.`menu_items` (`item_id`, `name_en`, `name_ar`, `price`, `description_en`, `description_ar`, `item_rate`, `cook_id`, `image_URL`) VALUES ('4', 'Honey Mustard chicken with Baked Potato', 'œÃ«Ã »«·⁄”· «·√»Ì÷ Ê «·„«” œ—œÂ „⁄ »ÿ«ÿ” „Œ»Ê“…', '40', 'Perfectly baked chicken and potato with honey mustard sauce for a match made in Heaven taste Ö try it now !!!', 'œÃ«Ã „⁄ »ÿ«ÿ” „ÿÌ«‰ ›Ì «·›—‰ Ê „ »·«‰ »’Ê’ «·⁄”· Ê «·„”ÿ—œ… ° ≈‰Â «·ÿ⁄„ «·„ Ã«‰” «·–Ì  ⁄‘ﬁ…', '3', '5', 'image4.jpg');
INSERT INTO `etbo5ly`.`menu_items` (`item_id`, `name_en`, `name_ar`, `price`, `description_en`, `description_ar`, `item_rate`, `cook_id`, `image_URL`) VALUES ('5', 'Rice with Nuts+Grilled Chicken Breast+Caesar ', '’œÊ— œÃ«Ã „‘ÊÌ… „⁄ √—“ »«·„ﬂ”—«  Ê ”·ÿ… ”Ì“«—', '45', 'Delicious rice with nuts (Raisins+Almonds+Walnuts), grilled chicken breast & Caesar Salad,a complete meal.', '√—“ »«·„ﬂ”—«  (“»Ì» Ê ·Ê“ Ê ⁄Ì‰ Ã„·) „⁄ ’œ— œÃ«Ã… „‘ÊÌ „⁄ ”·ÿ… »’Ê’ «·”Ì“— ° ·  ‰«Ê· ÊÃ»… „ ﬂ«„·…', '4', '6', 'image5.jpg');
INSERT INTO `etbo5ly`.`menu_items` (`item_id`, `name_en`, `name_ar`, `price`, `description_en`, `description_ar`, `item_rate`, `cook_id`, `image_URL`) VALUES ('6', 'Red Sauce Pasta & Chicken Panne & Green Salad', 'œÃ«Ã »«‰ÌÂ „⁄ „ﬂ—Ê‰… »’·’·… «·ÿ„«ÿ„', '30', 'Just like how your MUM or Grandmother would cook it. perfect comforting lunch after a long hard day.', ' „«„« ﬂ„«  ÿÂÊÂ« Ê«·œ ﬂ Ê Ãœ ﬂ! ° «·œÃ«Ã «·„ﬁ·Ì «·„ »· ÃÌœ«° „⁄ „ﬂ—Ê‰… »’·’… «·ÿ„«ÿ„° Ê”·ÿ…° ·  ‰«Ê· €œ«¡« „‰«”»« √À‰«¡ ÌÊ„ ⁄„· ', '5', '2', 'image6.jpg');
INSERT INTO `etbo5ly`.`menu_items` (`item_id`, `name_en`, `name_ar`, `price`, `description_en`, `description_ar`, `item_rate`, `cook_id`, `image_URL`) VALUES ('7', 'Lebanese fatta with Pomegranate molasses (Debs ', '› … ·»‰«‰Ì »œ»” «·—„«‰', '14', 'A lebaneese specialty that will make u crave it day and night.caramelized onions and chicken in debs roman sauce ', '»’· Ê œÃ«Ã „ »· ›Ì œ»” «·—„«‰ ° ›Êﬁ √—“ √»Ì÷ °  Õ Â Œ»“ „ﬁ—„‘ ° Ê „‰ ›ÊﬁÂ„ ’Ê’ «·“»«œÌ »«·√⁄‘«» Ê «·ÀÊ„', '2', '3', 'image7.jpg');
INSERT INTO `etbo5ly`.`menu_items` (`item_id`, `name_en`, `name_ar`, `price`, `description_en`, `description_ar`, `item_rate`, `cook_id`, `image_URL`) VALUES ('8', 'Lentils Soup', '‘—»Â ⁄œ”', '25', 'Warm yourself up with our rich lentil soup topped with our crispy croutons and a hint of lemon', '‘—»Â ⁄ ” ·–Ì–Â „⁄ «·⁄Ì‘ «·ﬂ—Ê Ê‰ «·„Õ„’ Ê ⁄’Ì— «··Ì„Ê‰', '4', '4', 'image8.jpg');
INSERT INTO `etbo5ly`.`menu_items` (`item_id`, `name_en`, `name_ar`, `price`, `description_en`, `description_ar`, `item_rate`, `cook_id`, `image_URL`) VALUES ('9', 'Mushroom Soup', '‘Ê—»… „‘—Ê„', '30', 'Tummy warming blend that will keep you wanting more', '‘Ê—»… «·„‘—Ê„ ° ›« Õ… ··‘ÂÌ… ° · ” „ ⁄ »ÊÃ» ﬂ «·ﬁ«œ„…', '4', '5', 'image9.jpg');
INSERT INTO `etbo5ly`.`menu_items` (`item_id`, `name_en`, `name_ar`, `price`, `description_en`, `description_ar`, `item_rate`, `cook_id`, `image_URL`) VALUES ('10', 'Vegetarian glass noodles', '«·‰ÊœÌ·“ »«·Œ÷—Ê« ', '18', 'Perfectly cooked Chinese glass noodles with a mix of bell peppers and exquisite Chinese sauce that makes a party in ', '«·‰ÊœÌ·“ «·’Ì‰Ï „⁄ »«·›·›· «·«·Ê«‰ Ê «·’Ê’ «·’Ì‰Ï', '2', '6', 'image10.jpg');
INSERT INTO `etbo5ly`.`menu_items` (`item_id`, `name_en`, `name_ar`, `price`, `description_en`, `description_ar`, `item_rate`, `cook_id`, `image_URL`) VALUES ('11', 'Sojok Eskandarani and Red Sauce Pasta', '”Ãﬁ «”ﬂ‰œ—«‰Ì „⁄ „ﬂ—Ê‰… »’Ê’ «·ÿ„«ÿ„', '27', 'Mouth watering sujok rings with onions and green peppers over a bed of red sauce pasta', '«·”Ãﬁ «·„ »· „⁄ «·»’· Ê «·›·›· «·√Œ÷— ° ›Êﬁ „ﬂ—Ê‰… »’·’·… «·ÿ„«ÿ„', '3', '2', 'image11.jpg');


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


