/*
  Target Server Type    : MySQL
  File Encoding         : utf-8
  Source Database       : bamazon
*/
SET NAMES utf8mb4;

-- ----------------------------
--  `products`
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products`
(
  `id` int (11) NOT NULL AUTO_INCREMENT,
  `product_name` varchar (50) DEFAULT NULL,
  `department_name` varchar (50) NOT NULL,
  `price` decimal (10,2) DEFAULT NULL,
  `stock_quantity` int (11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) DEFAULT CHARSET=utf8;
-- ----------------------------
--  Records of `products`
-- ----------------------------
BEGIN;
  INSERT INTO `products`
  VALUES
    ('1', 'Handlebar All-Natural Moustache Wax', 'Beauty', '14.25', '4'),
    ('2', 'Honest Amish Beard Balm Leave-in Conditioner', 'Beauty', '12.23', '7'),
    ('3', 'Jeanne Simmons Men\'s Linen Summer Ivy Cap', 'Men\'s Accessories', '9.63', '19'),
    ('4', 'Anova Sous Vide Precision Cooker 900 Watts', 'Kitchen', '129.99', '21'),
    ('5', 'Sigma 50mm F1.4 ART DG HSM Lens for Canon', 'Electronics', '949.49', '12'),
    ('6', 'Trend Diamond Credit Card Sharpening Stone', 'Tools', '29.99', '17'),
    ('7', 'Sturmey-Archer S2 Kick-Shift Hub Kit 36h', 'Bikes', '67.47', '8'),
    ('8', 'Stanley Carbide Utility Blade, 50-Pack', 'Tools', '17.99', '41'),
    ('9', 'Gerber EAB Pocket Knife', 'Tools', '8.33', '5'),
    ('10', 'HELOIDEO Power Bank 5000mAh Lightning/USB-C', 'Electronics', '29.99', '14');
COMMIT;
