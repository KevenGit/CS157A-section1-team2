CREATE DATABASE e_vendor_data_test;

USE e_vendor_data_test;

CREATE TABLE user(
	id INT NOT NULL AUTO_INCREMENT,
    username VARCHAR(64) NOT NULL UNIQUE,
    hash_pw VARCHAR(256) NOT NULL UNIQUE,
    pw_salt VARCHAR(256) NOT NULL,
    first_name VARCHAR(45) NOT NULL,
    last_name VARCHAR(45) NOT NULL,
    email VARCHAR(128) NOT NULL,
    balance DOUBLE NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE seller(
	id INT NOT NULL,
    phone CHAR(10) NOT NULL UNIQUE,
    PRIMARY KEY (id)
);

CREATE TABLE postings(
	id INT NOT NULL AUTO_INCREMENT,
    title VARCHAR(128) NOT NULL,
    category VARCHAR(64) NOT NULL,
    price DOUBLE NOT NULL,
    region VARCHAR(64) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE suite(
	id INT NOT NULL AUTO_INCREMENT,
    heading VARCHAR(128) NOT NULL,
    paragraph VARCHAR(4096) NOT NULL,
    img_path VARCHAR(255) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE contain (
	post_id INT NOT NULL,
    suite_id INT NOT NULL,
    index_position INT NOT NULL,
    PRIMARY KEY (post_id, suite_id, index_position)
);

CREATE TABLE post(
	seller_id INT NOT NULL,
    post_id INT NOT NULL,
    PRIMARY KEY (seller_id, post_id)
);

CREATE TABLE favorites(
	user_id INT NOT NULL,
    post_id INT NOT NULL,
    PRIMARY KEY (user_id, post_id)
);

CREATE TABLE orders(
	id INT NOT NULL AUTO_INCREMENT,
    delivery_address VARCHAR(255) NOT NULL,
    date TIMESTAMP NOT NULL,
    quantity INT NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE buys(
	user_id INT NOT NULL,
    order_id INT NOT NULL,
    PRIMARY KEY (user_id, order_id)
);

CREATE TABLE fulfills(
	seller_id INT NOT NULL,
    order_id INT NOT NULL,
    PRIMARY KEY (seller_id, order_id)
);

CREATE TABLE isFrom(
	post_id INT NOT NULL,
    order_id INT NOT NULL,
    PRIMARY KEY (post_id, order_id)
);

USE e_vendor_data_test;

# Fill user table 
insert into user (id, username, hash_pw, pw_salt, first_name, last_name, email, balance) values (1, 'bsantarelli0', 'm2X3kyGkn1vXuTm6uwXQkGLG3KLeSRHo', 'cT44M3qqKwYvmER7', 'Betteanne', 'Santarelli', 'bsantarelli0@addthis.com', 23);
insert into user (id, username, hash_pw, pw_salt, first_name, last_name, email, balance) values (2, 'mstrettell1', 'TYpEKPHP7umPM4Vejp8UBA3P6JdrSPc9', '2ywyvfhnhPlWtsj9', 'Marcelline', 'Strettell', 'mstrettell1@hatena.ne.jp', 22);
insert into user (id, username, hash_pw, pw_salt, first_name, last_name, email, balance) values (3, 'phacaud2', 'Udqla3ne9r1noHxb6yhXNOlUq3nFzssc', 'jKlHwHxtBcO3w5QE', 'Page', 'Hacaud', 'phacaud2@goo.gl', 33);
insert into user (id, username, hash_pw, pw_salt, first_name, last_name, email, balance) values (4, 'rhulse3', 'wHqxIegwNT6oNhf07Fv2cUMpbQxLL9wJ', 'whxwJbQGJRGuuMh3', 'Richie', 'Hulse', 'rhulse3@blogspot.com', 84);
insert into user (id, username, hash_pw, pw_salt, first_name, last_name, email, balance) values (5, 'jdelacourt4', 'C4W8yk3TMHK8i33qQRWHKuxv3QGeD6lK', 'FLMj8F33jFIP67vy', 'Jo', 'Delacourt', 'jdelacourt4@cpanel.net', 39);
insert into user (id, username, hash_pw, pw_salt, first_name, last_name, email, balance) values (6, 'sdumphrey5', 'Z6zu5wTXLrigvcTTpiCrl8Yc95IPOsZC', 'GS70ORWrOSY0qC5Q', 'Shurlock', 'Dumphrey', 'sdumphrey5@google.co.jp', 2);
insert into user (id, username, hash_pw, pw_salt, first_name, last_name, email, balance) values (7, 'spigford6', 'HdtVaIi8Fzkg69MgW32My3aydMGeWmDk', 'ObihgcjCVbfGZJSF', 'Sidnee', 'Pigford', 'spigford6@delicious.com', 14);
insert into user (id, username, hash_pw, pw_salt, first_name, last_name, email, balance) values (8, 'cbritner7', 'mjd73xEmBSXRAMqkOutWiUCeH74D8aok', 'TIifOfP7Bwy3Sz4l', 'Cara', 'Britner', 'cbritner7@php.net', 76);
insert into user (id, username, hash_pw, pw_salt, first_name, last_name, email, balance) values (9, 'cchesshire8', 'h0rWDCMjqtlO9Vnq9nbd5tj9wG1rmSqJ', 'erK80fU9VQwOs5c7', 'Cedric', 'Chesshire', 'cchesshire8@auda.org.au', 9);
insert into user (id, username, hash_pw, pw_salt, first_name, last_name, email, balance) values (10, 'qduncan9', 'A0VV0WBhSrdBNoyj8o2y7Pu1JXvV4KKD', '1Pzyljq2D7C9tbKO', 'Quincey', 'Duncan', 'qduncan9@toplist.cz', 39);
insert into user (id, username, hash_pw, pw_salt, first_name, last_name, email, balance) values (11, 'cpantera', 'rIDLiagdxnuf3nL0JUjlQjwmpiZtuAul', 'nWDkHEXi56OwC8ve', 'Carolina', 'Panter', 'cpantera@mlb.com', 47);
insert into user (id, username, hash_pw, pw_salt, first_name, last_name, email, balance) values (12, 'gpreatorb', 'B72DbFBg6VlzlSxQtQJlNRjpeaFR6TpA', 'RWk84F2Q54rvh1Zg', 'Gabie', 'Preator', 'gpreatorb@ucla.edu', 98);
insert into user (id, username, hash_pw, pw_salt, first_name, last_name, email, balance) values (13, 'bwarrickc', '2hiofUPbf9s8TizlPy15WK8dLTg5JIiy', 'RzhB5Cs1YpQl8oDr', 'Burt', 'Warrick', 'bwarrickc@hexun.com', 67);
insert into user (id, username, hash_pw, pw_salt, first_name, last_name, email, balance) values (14, 'spyerd', 'T5ldPstPbe1lJ4pGtekld903oDLIwvui', 'IECZGJdhvcyil4jT', 'Shelley', 'Pyer', 'spyerd@naver.com', 45);
insert into user (id, username, hash_pw, pw_salt, first_name, last_name, email, balance) values (15, 'rchestermane', 'q9XhG8ZZt8w6uiSrxkvzXsdARWsz4stn', '1CZ1VWmiF7uQEGd1', 'Renie', 'Chesterman', 'rchestermane@stanford.edu', 98);
insert into user (id, username, hash_pw, pw_salt, first_name, last_name, email, balance) values (16, 'lbewfieldf', 'FI2Dx1ZL2L4EKUNnQOzvRF8DvvJDCoo2', 'edKMqVp3SQwkfr8Y', 'Larina', 'Bewfield', 'lbewfieldf@opera.com', 55);
insert into user (id, username, hash_pw, pw_salt, first_name, last_name, email, balance) values (17, 'gchadg', 'maljLPHts6U5PviJ2iIYEeTxLoUfqH8U', 'x4mSHpQIuRzimtfO', 'Gavan', 'Chad', 'gchadg@xrea.com', 95);
insert into user (id, username, hash_pw, pw_salt, first_name, last_name, email, balance) values (18, 'smasdingh', 'qvGSPHeA4EMhjFTLmJTeuzjNsvG42ENB', 'O9HWG9DNN3VcJ8SB', 'Skylar', 'Masding', 'smasdingh@mayoclinic.com', 22);
insert into user (id, username, hash_pw, pw_salt, first_name, last_name, email, balance) values (19, 'itokleyi', 'KjklqUbruKMRH5p5cyo8gNNh3vBCTGqJ', 'n4ff4KQnpyPPzIzH', 'Ivonne', 'Tokley', 'itokleyi@ebay.com', 14);
insert into user (id, username, hash_pw, pw_salt, first_name, last_name, email, balance) values (20, 'ccowoppej', 'AYdETh1mDtNqMcus5QvdOcIAq4boyoPo', 'IH5aggR54vUQbdfk', 'Cybil', 'Cowoppe', 'ccowoppej@cnbc.com', 70);

# Fill seller
insert into seller (id, phone) values (8, '6212721764');
insert into seller (id, phone) values (9, '1462107175');
insert into seller (id, phone) values (6, '8533779384');
insert into seller (id, phone) values (14, '0341639766');
insert into seller (id, phone) values (3, '0417329500');
insert into seller (id, phone) values (5, '8693125267');
insert into seller (id, phone) values (7, '8379997571');
insert into seller (id, phone) values (15, '5611167726');
insert into seller (id, phone) values (16, '4033120292');
insert into seller (id, phone) values (2, '9299852360');
insert into seller (id, phone) values (13, '5375184975');
insert into seller (id, phone) values (4, '6678467019');
insert into seller (id, phone) values (1, '7090368811');
insert into seller (id, phone) values (12, '5442537737');
insert into seller (id, phone) values (18, '1724427960');

# Fill postings table
insert into postings (id, title, price, category, region) values (1, 'Hair Trimmer', 5.99, 'Tool', 'Louisiana');
insert into postings (id, title, price, category, region) values (2, 'Stress Pillow', 12.99, 'Tool', 'Texas');
insert into postings (id, title, price, category, region) values (3, 'Stapler for Summer School', 3.99, 'Tool', 'New Jersey');
insert into postings (id, title, price, category, region) values (4, 'Decorative Toaster', 17.99, 'Appliance', 'Pennsylvania');
insert into postings (id, title, price, category, region) values (5, 'Bad Tasting Gum', 1.99, 'Toy', 'New York');
insert into postings (id, title, price, category, region) values (6, 'Dark Milk Chocolate', 2.99, 'Toy', 'Florida');
insert into postings (id, title, price, category, region) values (7, 'Funny Scarf', 8.99, 'Clothing', 'Iowa');
insert into postings (id, title, price, category, region) values (8, 'Beautiful Vase of Flowers', 12.99, 'Tool', 'California');
insert into postings (id, title, price, category, region) values (9, 'Fake Diamond Necklace', 11.99, 'Toy', 'Wisconsin');
insert into postings (id, title, price, category, region) values (10, 'Small Safe', 7.99, 'Tool', 'Ohio');
insert into postings (id, title, price, category, region) values (11, 'Coins for Magic Trick', 3.99, 'Toy', 'District of Columbia');
insert into postings (id, title, price, category, region) values (12, 'Hiking Backpack', 11.99, 'Tool', 'Arizona');
insert into postings (id, title, price, category, region) values (13, 'Toy Tractor', 7.99, 'Toy', 'Oklahoma');
insert into postings (id, title, price, category, region) values (14, 'Decorative Blender', 17.99, 'Appliance', 'California');
insert into postings (id, title, price, category, region) values (15, 'Computer Science Puzzle Game', 8.99, 'Toy', 'Texas');

# Fill suite table
insert into suite (id, heading, paragraph, img_path) values (1, 'Hair Trimmer for Non-Barbers', 'Get rid of the overgrown quarantine hair!', '/img/img1.jpeg');
insert into suite (id, heading, paragraph, img_path) values (2, 'Punch Away Your Problems', 'School or work making you angry? Get rid of it by punching our ultra soft pillow.', '/img/img2.jpeg');
insert into suite (id, heading, paragraph, img_path) values (3, 'Small Black Stapler', 'Do you have a school this summer? Get this small stapler that fits in your pocket.', '/img/img3.jpeg');
insert into suite (id, heading, paragraph, img_path) values (4, 'A Great Looking Toaster', 'This fancy toaster is a sleek black with decorated with zebra stripes.', '/img/img5.jpeg');
insert into suite (id, heading, paragraph, img_path) values (5, 'Prank your Friends with this Gum', 'This special gum is pink just like regular gum but has the secret taste of feet.', '/img/img4.jpeg');
insert into suite (id, heading, paragraph, img_path) values (6, 'Chocolate to Die For', 'This nice chocolate is healthy like dark chocoloate but just as sweet as milk chocolate.', '/img/img6.jpeg');
insert into suite (id, heading, paragraph, img_path) values (7, 'Scarf that Looks like a Car', 'Is that a car on top of your head. This schoodie has the frame of a car on top and wheels on the ends.', '/img/img7.jpeg');
insert into suite (id, heading, paragraph, img_path) values (8, 'A Banquet of Flowers for you Love', 'Gift this beautiful vase of flowers to your loved one this Valentine''s Day', '/img/img8.jpeg');
insert into suite (id, heading, paragraph, img_path) values (9, 'Cheap is still Beautiful', 'This fake diamond necklace looks just like the real thing for a fraction of the price.', '/img/img9.jpeg');
insert into suite (id, heading, paragraph, img_path) values (10, 'Keep your Stuff Safe', 'This tiny safe can store all your precious jewelry and even money.', '/img/img10.jpeg');
insert into suite (id, heading, paragraph, img_path) values (11, 'Be a Magician with these Coins', 'Perform magic in front of your family and friends with these disappearing coins!', '/img/img11.jpeg');
insert into suite (id, heading, paragraph, img_path) values (12, 'Small Cargo Backpack', 'Need a baackpack for a day hike. Buy this sturdy but light backpack now.', '/img/img12.jpeg');
insert into suite (id, heading, paragraph, img_path) values (13, 'Small Tractor for Kids', 'This small toy vehicle is prefect for kids 3 and up.', '/img/img13.jpeg');
insert into suite (id, heading, paragraph, img_path) values (14, 'Cool Blender', 'This blender is decorated like a typhoon making blending so much fun!', '/img/img14.jpeg');
insert into suite (id, heading, paragraph, img_path) values (15, 'Test your CS skills', 'Can you solve this puzzle? It''ll require a solid understanding of Databases to get through this!', '/img/img15.jpeg');

# Fill contains table
insert into contain (post_id, suite_id, index_position) values (1, 1, 1);
insert into contain (post_id, suite_id, index_position) values (2, 2, 1);
insert into contain (post_id, suite_id, index_position) values (3, 3, 1);
insert into contain (post_id, suite_id, index_position) values (4, 4, 1);
insert into contain (post_id, suite_id, index_position) values (5, 5, 1);
insert into contain (post_id, suite_id, index_position) values (6, 6, 1);
insert into contain (post_id, suite_id, index_position) values (7, 7, 1);
insert into contain (post_id, suite_id, index_position) values (8, 8, 1);
insert into contain (post_id, suite_id, index_position) values (9, 9, 1);
insert into contain (post_id, suite_id, index_position) values (10, 10, 1);
insert into contain (post_id, suite_id, index_position) values (11, 11, 1);
insert into contain (post_id, suite_id, index_position) values (12, 12, 1);
insert into contain (post_id, suite_id, index_position) values (13, 13, 1);
insert into contain (post_id, suite_id, index_position) values (14, 14, 1);
insert into contain (post_id, suite_id, index_position) values (15, 15, 1);

# Fill post table
insert into post (seller_id, post_id) values (6, 1);
insert into post (seller_id, post_id) values (16, 2);
insert into post (seller_id, post_id) values (14, 3);
insert into post (seller_id, post_id) values (12, 4);
insert into post (seller_id, post_id) values (1, 5);
insert into post (seller_id, post_id) values (5, 6);
insert into post (seller_id, post_id) values (12, 7);
insert into post (seller_id, post_id) values (4, 8);
insert into post (seller_id, post_id) values (15, 9);
insert into post (seller_id, post_id) values (13, 10);
insert into post (seller_id, post_id) values (12, 11);
insert into post (seller_id, post_id) values (18, 12);
insert into post (seller_id, post_id) values (15, 13);
insert into post (seller_id, post_id) values (1, 14);
insert into post (seller_id, post_id) values (5, 15);

# Fill favorite table
insert into favorites (user_id, post_id) values (16, 2);
insert into favorites (user_id, post_id) values (2, 13);
insert into favorites (user_id, post_id) values (9, 10);
insert into favorites (user_id, post_id) values (5, 15);
insert into favorites (user_id, post_id) values (11, 1);
insert into favorites (user_id, post_id) values (4, 4);
insert into favorites (user_id, post_id) values (1, 3);
insert into favorites (user_id, post_id) values (18, 6);
insert into favorites (user_id, post_id) values (14, 8);
insert into favorites (user_id, post_id) values (7, 9);
insert into favorites (user_id, post_id) values (3, 11);
insert into favorites (user_id, post_id) values (15, 14);
insert into favorites (user_id, post_id) values (13, 5);
insert into favorites (user_id, post_id) values (10, 12);
insert into favorites (user_id, post_id) values (19, 7);

insert into orders values (1, '6 Scofield Hill', '2020-04-27 12:48:57', 3);
insert into orders values (2, '273 Towne Lane', '2020-02-06 20:39:08', 2);
insert into orders values (3, '8409 1st Hill', '2020-05-16 20:42:27', 2);
insert into orders values (4, '7711 Hooker Parkway', '2019-12-10 14:37:43', 3);
insert into orders values (5, '38 Monterey Lane', '2020-02-29 00:37:31', 1);
insert into orders values (6, '596 Lakewood Drive', '2020-04-16 03:29:16', 1);
insert into orders values (7, '43 Kim Park', '2019-11-08 11:13:25', 2);
insert into orders values (8, '04 Corscot Pass', '2020-08-11 21:53:31', 3);
insert into orders values (9, '1 Towne Trail', '2020-06-24 17:44:25', 3);
insert into orders values (10, '768 Jenna Court', '2020-03-13 06:51:42', 3);
insert into orders values (11, '902 Forest Dale Road', '2019-12-20 09:21:48', 2);
insert into orders values (12, '21071 Meadow Ridge Street', '2020-03-08 15:13:55', 3);
insert into orders values (13, '234 Hoard Hill', '2019-11-11 23:03:05', 3);
insert into orders values (14, '2 Orin Point', '2020-08-28 17:58:34', 2);
insert into orders values (15, '4 Nelson Way', '2020-10-13 17:35:10', 2);

insert into buys (user_id, order_id) values (10, 1);
insert into buys (user_id, order_id) values (17, 2);
insert into buys (user_id, order_id) values (19, 3);
insert into buys (user_id, order_id) values (20, 4);
insert into buys (user_id, order_id) values (11, 5);
insert into buys (user_id, order_id) values (3, 6);
insert into buys (user_id, order_id) values (15, 7);
insert into buys (user_id, order_id) values (18, 8);
insert into buys (user_id, order_id) values (12, 9);
insert into buys (user_id, order_id) values (16, 10);
insert into buys (user_id, order_id) values (4, 11);
insert into buys (user_id, order_id) values (13, 12);
insert into buys (user_id, order_id) values (8, 13);
insert into buys (user_id, order_id) values (14, 14);
insert into buys (user_id, order_id) values (9, 15);


insert into fulfills (seller_id, order_id) values (18, 1);
insert into fulfills (seller_id, order_id) values (15, 2);
insert into fulfills (seller_id, order_id) values (5, 3);
insert into fulfills (seller_id, order_id) values (1, 4);
insert into fulfills (seller_id, order_id) values (18, 5);
insert into fulfills (seller_id, order_id) values (14, 6);
insert into fulfills (seller_id, order_id) values (18, 7);
insert into fulfills (seller_id, order_id) values (16, 8);
insert into fulfills (seller_id, order_id) values (16, 9);
insert into fulfills (seller_id, order_id) values (16, 10);
insert into fulfills (seller_id, order_id) values (4, 11);
insert into fulfills (seller_id, order_id) values (12, 12);
insert into fulfills (seller_id, order_id) values (4, 13);
insert into fulfills (seller_id, order_id) values (5, 14);
insert into fulfills (seller_id, order_id) values (13, 15);

insert into isfrom (post_id, order_id) values (12, 1);
insert into isfrom (post_id, order_id) values (9, 2);
insert into isfrom (post_id, order_id) values (6, 3);
insert into isfrom (post_id, order_id) values (5, 4);
insert into isfrom (post_id, order_id) values (12, 5);
insert into isfrom (post_id, order_id) values (3, 6);
insert into isfrom (post_id, order_id) values (12, 7);
insert into isfrom (post_id, order_id) values (2, 8);
insert into isfrom (post_id, order_id) values (2, 9);
insert into isfrom (post_id, order_id) values (2, 10);
insert into isfrom (post_id, order_id) values (8, 11);
insert into isfrom (post_id, order_id) values (11, 12);
insert into isfrom (post_id, order_id) values (8, 13);
insert into isfrom (post_id, order_id) values (6, 14);
insert into isfrom (post_id, order_id) values (10, 15);