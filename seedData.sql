USE CentralKitchenFranchiseDB
-- Seed data
INSERT INTO VehicleBrandLamTT (BrandName, Country, IsActive)
VALUES
('Toyota','Japan',1), ('Honda','Japan',1), ('Ford','USA',1), ('BMW','Germany',1),
('Mercedes','Germany',1), ('Audi','Germany',1), ('Hyundai','Korea',1),
('Kia','Korea',1), ('Mazda','Japan',1), ('Nissan','Japan',1),
('Chevrolet','USA',1), ('Tesla','USA',1), ('Lexus','Japan',1),
('Porsche','Germany',1), ('Subaru','Japan',1), ('Mitsubishi','Japan',1),
('Peugeot','France',1), ('Volvo','Sweden',1), ('Suzuki','Japan',1),
('Isuzu','Japan',1);

INSERT INTO VehicleModelLamTT
(ModelName, Description, EngineType, ReleaseYear, Status, PublishDate, CreatedDate, IsActive, VehicleBrandLamTTId)
VALUES
('Corolla','Sedan','Petrol',2020,1,GETDATE(),GETDATE(),1,1),
('Civic','Sedan','Petrol',2021,1,GETDATE(),GETDATE(),1,2),
('Ranger','Pickup','Diesel',2019,1,GETDATE(),GETDATE(),1,3),
('X5','SUV','Hybrid',2022,1,GETDATE(),GETDATE(),1,4),
('C300','Sedan','Petrol',2020,1,GETDATE(),GETDATE(),1,5),
('A6','Sedan','Petrol',2021,1,GETDATE(),GETDATE(),1,6),
('Elantra','Sedan','Petrol',2022,1,GETDATE(),GETDATE(),1,7),
('Sorento','SUV','Diesel',2021,1,GETDATE(),GETDATE(),1,8),
('CX5','SUV','Petrol',2020,1,GETDATE(),GETDATE(),1,9),
('Altima','Sedan','Petrol',2019,1,GETDATE(),GETDATE(),1,10),
('Camaro','Sport','Petrol',2021,1,GETDATE(),GETDATE(),1,11),
('Model 3','EV','Electric',2022,1,GETDATE(),GETDATE(),1,12),
('RX350','SUV','Petrol',2020,1,GETDATE(),GETDATE(),1,13),
('911','Sport','Petrol',2021,1,GETDATE(),GETDATE(),1,14),
('Forester','SUV','Petrol',2020,1,GETDATE(),GETDATE(),1,15),
('Outlander','SUV','Hybrid',2022,1,GETDATE(),GETDATE(),1,16),
('3008','SUV','Petrol',2021,1,GETDATE(),GETDATE(),1,17),
('XC90','SUV','Hybrid',2022,1,GETDATE(),GETDATE(),1,18),
('Ertiga','MPV','Petrol',2019,1,GETDATE(),GETDATE(),1,19),
('Dmax','Pickup','Diesel',2020,1,GETDATE(),GETDATE(),1,20);

INSERT INTO ProductCategoryKietDT (CategoryName, Description, IsActive)
VALUES
('Engine Parts','Engine components',1),
('Brake System','Brake related items',1),
('Suspension','Suspension parts',1),
('Electrical','Electrical parts',1),
('Body Parts','Car body parts',1),
('Interior','Interior accessories',1),
('Exterior','Exterior accessories',1),
('Cooling','Cooling system',1),
('Fuel System','Fuel system parts',1),
('Transmission','Transmission parts',1),
('Lighting','Car lights',1),
('Tires','Tires and wheels',1),
('Battery','Battery products',1),
('Filters','Oil and air filters',1),
('Lubricants','Oils and fluids',1),
('Exhaust','Exhaust system',1),
('Steering','Steering parts',1),
('Safety','Safety equipment',1),
('Infotainment','Multimedia',1),
('Accessories','General accessories',1);

INSERT INTO ProductKietDT
(ProductName, SKU, Price, Unit, Description, Status, PublishDate, CreatedDate, IsActive,
 ProductCategoryKietDTId, VehicleModelLamTTId)
VALUES
('Oil Filter','SKU001',50,'Piece','Oil filter',1,GETDATE(),GETDATE(),1,14,1),
('Brake Pad','SKU002',120,'Set','Brake pad',1,GETDATE(),GETDATE(),1,2,2),
('Shock Absorber','SKU003',300,'Piece','Shock absorber',1,GETDATE(),GETDATE(),1,3,3),
('Car Battery','SKU004',200,'Piece','Battery',1,GETDATE(),GETDATE(),1,13,4),
('LED Headlight','SKU005',150,'Pair','Headlight',1,GETDATE(),GETDATE(),1,11,5),
('Radiator','SKU006',400,'Piece','Radiator',1,GETDATE(),GETDATE(),1,8,6),
('Fuel Pump','SKU007',250,'Piece','Fuel pump',1,GETDATE(),GETDATE(),1,9,7),
('Gearbox','SKU008',800,'Piece','Gearbox',1,GETDATE(),GETDATE(),1,10,8),
('Seat Cover','SKU009',100,'Set','Seat cover',1,GETDATE(),GETDATE(),1,6,9),
('Bumper','SKU010',500,'Piece','Bumper',1,GETDATE(),GETDATE(),1,5,10),
('Steering Wheel','SKU011',350,'Piece','Steering',1,GETDATE(),GETDATE(),1,17,11),
('Tire','SKU012',180,'Piece','Tire',1,GETDATE(),GETDATE(),1,12,12),
('Engine Oil','SKU013',60,'Bottle','Oil',1,GETDATE(),GETDATE(),1,15,13),
('Air Filter','SKU014',40,'Piece','Air filter',1,GETDATE(),GETDATE(),1,14,14),
('Exhaust Pipe','SKU015',450,'Piece','Exhaust',1,GETDATE(),GETDATE(),1,16,15),
('Dashboard','SKU016',600,'Piece','Dashboard',1,GETDATE(),GETDATE(),1,6,16),
('Camera','SKU017',220,'Piece','Camera',1,GETDATE(),GETDATE(),1,19,17),
('Seat Belt','SKU018',90,'Piece','Safety belt',1,GETDATE(),GETDATE(),1,18,18),
('Side Mirror','SKU019',140,'Piece','Mirror',1,GETDATE(),GETDATE(),1,7,19),
('Car Charger','SKU020',30,'Piece','Charger',1,GETDATE(),GETDATE(),1,20,20);

INSERT INTO VariantColorHauPT (ColorName, ColorCode, IsActive)
VALUES
('Red','#FF0000',1),('Blue','#0000FF',1),('Black','#000000',1),
('White','#FFFFFF',1),('Silver','#C0C0C0',1),('Gray','#808080',1),
('Yellow','#FFFF00',1),('Green','#008000',1),('Orange','#FFA500',1),
('Brown','#A52A2A',1),('Purple','#800080',1),('Pink','#FFC0CB',1),
('Gold','#FFD700',1),('Beige','#F5F5DC',1),('Navy','#000080',1),
('Maroon','#800000',1),('Cyan','#00FFFF',1),('Lime','#00FF00',1),
('Teal','#008080',1),('Olive','#808000',1);

INSERT INTO ProductVariantHauPT
(VariantName, Price, SKU, StockQuantity, Status, PublishDate, IsActive,
 ProductKietDTId, VariantColorHauPTId)
VALUES
('Variant 1',55,'VSKU01',100,1,GETDATE(),1,1,1),
('Variant 2',125,'VSKU02',90,1,GETDATE(),1,2,2),
('Variant 3',310,'VSKU03',80,1,GETDATE(),1,3,3),
('Variant 4',210,'VSKU04',70,1,GETDATE(),1,4,4),
('Variant 5',160,'VSKU05',60,1,GETDATE(),1,5,5),
('Variant 6',420,'VSKU06',50,1,GETDATE(),1,6,6),
('Variant 7',260,'VSKU07',40,1,GETDATE(),1,7,7),
('Variant 8',820,'VSKU08',30,1,GETDATE(),1,8,8),
('Variant 9',110,'VSKU09',20,1,GETDATE(),1,9,9),
('Variant 10',520,'VSKU10',10,1,GETDATE(),1,10,10),
('Variant 11',360,'VSKU11',100,1,GETDATE(),1,11,11),
('Variant 12',190,'VSKU12',90,1,GETDATE(),1,12,12),
('Variant 13',65,'VSKU13',80,1,GETDATE(),1,13,13),
('Variant 14',45,'VSKU14',70,1,GETDATE(),1,14,14),
('Variant 15',470,'VSKU15',60,1,GETDATE(),1,15,15),
('Variant 16',610,'VSKU16',50,1,GETDATE(),1,16,16),
('Variant 17',230,'VSKU17',40,1,GETDATE(),1,17,17),
('Variant 18',95,'VSKU18',30,1,GETDATE(),1,18,18),
('Variant 19',150,'VSKU19',20,1,GETDATE(),1,19,19),
('Variant 20',35,'VSKU20',10,1,GETDATE(),1,20,20);

INSERT INTO KitchenTypeKhaiVPM (TypeName, Description, IsActive)
VALUES
('Main Kitchen','Main production kitchen',1),
('Backup Kitchen','Backup kitchen',1),
('Cloud Kitchen','Delivery only',1),
('Training Kitchen','Staff training',1),
('R&D Kitchen','Research kitchen',1),
('Small Kitchen','Small capacity',1),
('Large Kitchen','Large capacity',1),
('Frozen Kitchen','Frozen food',1),
('Hot Kitchen','Hot meals',1),
('Cold Kitchen','Cold meals',1),
('Organic Kitchen','Organic food',1),
('Fast Food Kitchen','Fast food',1),
('Asian Kitchen','Asian food',1),
('Western Kitchen','Western food',1),
('Dessert Kitchen','Dessert',1),
('Bakery Kitchen','Bakery',1),
('Seafood Kitchen','Seafood',1),
('Meat Kitchen','Meat processing',1),
('Vegetarian Kitchen','Vegetarian food',1),
('Premium Kitchen','Premium service',1);

INSERT INTO CentralKitchenKhaiVPM
(KitchenName, Address, Capacity, OpenDate, Status, CreatedDate, MonthlyCost, IsActive, KitchenTypeKhaiVPMId)
VALUES
('Central Kitchen 1','HCM City',500,GETDATE(),1,GETDATE(),20000,1,1),
('Central Kitchen 2','Ha Noi',600,GETDATE(),1,GETDATE(),22000,1,2),
('Central Kitchen 3','Da Nang',400,GETDATE(),1,GETDATE(),18000,1,3),
('Central Kitchen 4','Can Tho',300,GETDATE(),1,GETDATE(),15000,1,4),
('Central Kitchen 5','Hai Phong',450,GETDATE(),1,GETDATE(),19000,1,5),
('Central Kitchen 6','Binh Duong',550,GETDATE(),1,GETDATE(),21000,1,6),
('Central Kitchen 7','Dong Nai',480,GETDATE(),1,GETDATE(),19500,1,7),
('Central Kitchen 8','Vung Tau',350,GETDATE(),1,GETDATE(),16000,1,8),
('Central Kitchen 9','Nha Trang',420,GETDATE(),1,GETDATE(),17500,1,9),
('Central Kitchen 10','Quy Nhon',380,GETDATE(),1,GETDATE(),16500,1,10),
('Central Kitchen 11','Hue',360,GETDATE(),1,GETDATE(),15500,1,11),
('Central Kitchen 12','Thanh Hoa',470,GETDATE(),1,GETDATE(),18500,1,12),
('Central Kitchen 13','Vinh',390,GETDATE(),1,GETDATE(),17000,1,13),
('Central Kitchen 14','Bac Ninh',430,GETDATE(),1,GETDATE(),18000,1,14),
('Central Kitchen 15','Thai Nguyen',410,GETDATE(),1,GETDATE(),17500,1,15),
('Central Kitchen 16','Quang Ninh',460,GETDATE(),1,GETDATE(),19000,1,16),
('Central Kitchen 17','Phu Quoc',340,GETDATE(),1,GETDATE(),16000,1,17),
('Central Kitchen 18','Buon Ma Thuot',370,GETDATE(),1,GETDATE(),16500,1,18),
('Central Kitchen 19','Pleiku',330,GETDATE(),1,GETDATE(),15000,1,19),
('Central Kitchen 20','Kon Tum',300,GETDATE(),1,GETDATE(),14500,1,20);

INSERT INTO StoreRegionPhucBHV (RegionName, Description, IsActive)
VALUES
('North','Northern Vietnam',1),
('South','Southern Vietnam',1),
('Central','Central Vietnam',1),
('North East','NE area',1),
('North West','NW area',1),
('South East','SE area',1),
('South West','SW area',1),
('Urban','City area',1),
('Rural','Rural area',1),
('Coastal','Coastal area',1),
('Highland','Highland',1),
('Industrial','Industrial zone',1),
('Tourism','Tourism area',1),
('Border','Border area',1),
('Island','Island area',1),
('Metro','Metro area',1),
('Suburban','Suburban',1),
('Economic Zone','Economic zone',1),
('Free Trade','Free trade zone',1),
('Special Zone','Special zone',1);

INSERT INTO FranchiseStorePhucBHV
(StoreName, Address, Phone, Email, OpeningDate, Status, CreatedDate, Revenue, IsActive,
 StoreRegionPhucBHVId, CentralKitchenKhaiVPMId)
VALUES
('Store 1','HCM', '090000001','s1@mail.com',GETDATE(),1,GETDATE(),50000,1,1,1),
('Store 2','HN', '090000002','s2@mail.com',GETDATE(),1,GETDATE(),52000,1,2,2),
('Store 3','DN', '090000003','s3@mail.com',GETDATE(),1,GETDATE(),48000,1,3,3),
('Store 4','CT', '090000004','s4@mail.com',GETDATE(),1,GETDATE(),45000,1,4,4),
('Store 5','HP', '090000005','s5@mail.com',GETDATE(),1,GETDATE(),47000,1,5,5),
('Store 6','BD', '090000006','s6@mail.com',GETDATE(),1,GETDATE(),51000,1,6,6),
('Store 7','DN', '090000007','s7@mail.com',GETDATE(),1,GETDATE(),49500,1,7,7),
('Store 8','VT', '090000008','s8@mail.com',GETDATE(),1,GETDATE(),46000,1,8,8),
('Store 9','NT', '090000009','s9@mail.com',GETDATE(),1,GETDATE(),49000,1,9,9),
('Store 10','QN', '090000010','s10@mail.com',GETDATE(),1,GETDATE(),45500,1,10,10),
('Store 11','Hue','090000011','s11@mail.com',GETDATE(),1,GETDATE(),46500,1,11,11),
('Store 12','TH','090000012','s12@mail.com',GETDATE(),1,GETDATE(),48000,1,12,12),
('Store 13','Vinh','090000013','s13@mail.com',GETDATE(),1,GETDATE(),47000,1,13,13),
('Store 14','BN','090000014','s14@mail.com',GETDATE(),1,GETDATE(),49000,1,14,14),
('Store 15','TN','090000015','s15@mail.com',GETDATE(),1,GETDATE(),46000,1,15,15),
('Store 16','QN','090000016','s16@mail.com',GETDATE(),1,GETDATE(),50000,1,16,16),
('Store 17','PQ','090000017','s17@mail.com',GETDATE(),1,GETDATE(),52000,1,17,17),
('Store 18','BMT','090000018','s18@mail.com',GETDATE(),1,GETDATE(),45000,1,18,18),
('Store 19','PL','090000019','s19@mail.com',GETDATE(),1,GETDATE(),44000,1,19,19),
('Store 20','KT','090000020','s20@mail.com',GETDATE(),1,GETDATE(),43000,1,20,20);

INSERT INTO InventoryLocationHuyND (LocationName, Description, IsActive)
VALUES
('Freezer A','Freezer',1),('Freezer B','Freezer',1),
('Shelf A','Shelf',1),('Shelf B','Shelf',1),
('Warehouse 1','Main WH',1),('Warehouse 2','Backup WH',1),
('Cold Room 1','Cold storage',1),('Cold Room 2','Cold storage',1),
('Dry Storage 1','Dry food',1),('Dry Storage 2','Dry food',1),
('Rack 1','Rack',1),('Rack 2','Rack',1),
('Zone A','Zone',1),('Zone B','Zone',1),
('Zone C','Zone',1),('Zone D','Zone',1),
('Room 1','Room',1),('Room 2','Room',1),
('Room 3','Room',1),('Room 4','Room',1);

INSERT INTO InventoryHuyND
(ItemName, Quantity, Unit, ExpiryDate, BatchNumber, Status, CreatedDate, Cost, IsActive,
 CentralKitchenKhaiVPMId, InventoryLocationHuyNDId)
VALUES
('Chicken',100,'Kg',DATEADD(day,30,GETDATE()),'B001',1,GETDATE(),2000,1,1,1),
('Beef',80,'Kg',DATEADD(day,40,GETDATE()),'B002',1,GETDATE(),3000,1,2,2),
('Pork',120,'Kg',DATEADD(day,35,GETDATE()),'B003',1,GETDATE(),2500,1,3,3),
('Fish',90,'Kg',DATEADD(day,25,GETDATE()),'B004',1,GETDATE(),2200,1,4,4),
('Rice',500,'Kg',DATEADD(day,180,GETDATE()),'B005',1,GETDATE(),1500,1,5,5),
('Flour',400,'Kg',DATEADD(day,200,GETDATE()),'B006',1,GETDATE(),1300,1,6,6),
('Sugar',300,'Kg',DATEADD(day,365,GETDATE()),'B007',1,GETDATE(),1200,1,7,7),
('Salt',200,'Kg',DATEADD(day,500,GETDATE()),'B008',1,GETDATE(),500,1,8,8),
('Milk',150,'Box',DATEADD(day,20,GETDATE()),'B009',1,GETDATE(),1800,1,9,9),
('Egg',1000,'Piece',DATEADD(day,15,GETDATE()),'B010',1,GETDATE(),900,1,10,10),
('Oil',200,'L',DATEADD(day,365,GETDATE()),'B011',1,GETDATE(),2200,1,11,11),
('Butter',100,'Kg',DATEADD(day,60,GETDATE()),'B012',1,GETDATE(),2600,1,12,12),
('Cheese',80,'Kg',DATEADD(day,45,GETDATE()),'B013',1,GETDATE(),2800,1,13,13),
('Vegetable',300,'Kg',DATEADD(day,10,GETDATE()),'B014',1,GETDATE(),1700,1,14,14),
('Fruit',250,'Kg',DATEADD(day,12,GETDATE()),'B015',1,GETDATE(),1900,1,15,15),
('Spice',50,'Kg',DATEADD(day,365,GETDATE()),'B016',1,GETDATE(),4000,1,16,16),
('Sauce',120,'Bottle',DATEADD(day,180,GETDATE()),'B017',1,GETDATE(),1600,1,17,17),
('Noodle',300,'Kg',DATEADD(day,120,GETDATE()),'B018',1,GETDATE(),1100,1,18,18),
('Bread',200,'Piece',DATEADD(day,5,GETDATE()),'B019',1,GETDATE(),800,1,19,19),
('Ice Cream',100,'Box',DATEADD(day,90,GETDATE()),'B020',1,GETDATE(),2500,1,20,20);

INSERT INTO OrderStatusLamNQ (StatusName, Description, IsActive)
VALUES
('Pending','Waiting',1),
('Confirmed','Confirmed',1),
('Preparing','Preparing',1),
('Packed','Packed',1),
('Shipping','Shipping',1),
('Delivered','Delivered',1),
('Cancelled','Cancelled',1),
('Returned','Returned',1),
('Refunded','Refunded',1),
('Completed','Completed',1),
('Delayed','Delayed',1),
('Failed','Failed',1),
('Rescheduled','Rescheduled',1),
('Processing','Processing',1),
('On Hold','On hold',1),
('Awaiting Payment','Awaiting payment',1),
('Paid','Paid',1),
('Partial','Partial',1),
('Closed','Closed',1),
('Archived','Archived',1);

INSERT INTO OrderHeaderLamNQ
(OrderCode, OrderDate, TotalAmount, Discount, Tax, FinalAmount, CreatedDate, IsActive,
 FranchiseStorePhucBHVId, ProductKietDTId, OrderStatusLamNQId)
VALUES
('ORD001',GETDATE(),1000,50,100,1050,GETDATE(),1,1,1,1),
('ORD002',GETDATE(),1200,0,120,1320,GETDATE(),1,2,2,2),
('ORD003',GETDATE(),900,30,90,960,GETDATE(),1,3,3,3),
('ORD004',GETDATE(),1500,100,150,1550,GETDATE(),1,4,4,4),
('ORD005',GETDATE(),1100,50,110,1160,GETDATE(),1,5,5,5),
('ORD006',GETDATE(),1300,60,130,1370,GETDATE(),1,6,6,6),
('ORD007',GETDATE(),1400,70,140,1470,GETDATE(),1,7,7,7),
('ORD008',GETDATE(),1600,80,160,1680,GETDATE(),1,8,8,8),
('ORD009',GETDATE(),1700,90,170,1780,GETDATE(),1,9,9,9),
('ORD010',GETDATE(),1800,100,180,1880,GETDATE(),1,10,10,10),
('ORD011',GETDATE(),1900,110,190,1980,GETDATE(),1,11,11,11),
('ORD012',GETDATE(),2000,120,200,2080,GETDATE(),1,12,12,12),
('ORD013',GETDATE(),2100,130,210,2180,GETDATE(),1,13,13,13),
('ORD014',GETDATE(),2200,140,220,2280,GETDATE(),1,14,14,14),
('ORD015',GETDATE(),2300,150,230,2380,GETDATE(),1,15,15,15),
('ORD016',GETDATE(),2400,160,240,2480,GETDATE(),1,16,16,16),
('ORD017',GETDATE(),2500,170,250,2580,GETDATE(),1,17,17,17),
('ORD018',GETDATE(),2600,180,260,2680,GETDATE(),1,18,18,18),
('ORD019',GETDATE(),2700,190,270,2780,GETDATE(),1,19,19,19),
('ORD020',GETDATE(),2800,200,280,2880,GETDATE(),1,20,20,20);

INSERT INTO DeliveryMethodHuyNV (MethodName, Description)
VALUES
('Bike','Bike delivery'),('Truck','Truck delivery'),('Van','Van'),
('Express','Express'),('Standard','Standard'),
('Frozen Truck','Frozen'),('Drone','Drone'),
('Pickup','Pickup'),('Ship','Ship'),
('Rail','Rail'),('Air','Air'),
('Eco','Eco'),('Partner','Partner'),
('Internal','Internal'),('Third Party','Third'),
('Night','Night'),('Day','Day'),
('Scheduled','Scheduled'),('Same Day','Same day'),
('Next Day','Next day');

INSERT INTO DeliveryHuyNV
(DeliveryCode, DeliveryDate, DeliveryCost, Address, Status, EstimatedTime,
 OrderLamNQId, DeliveryMethodHuyNVId)
VALUES
('DEL001',GETDATE(),50,'HCM',1,30,1,1),
('DEL002',GETDATE(),60,'HN',1,40,2,2),
('DEL003',GETDATE(),45,'DN',1,35,3,3),
('DEL004',GETDATE(),70,'CT',1,50,4,4),
('DEL005',GETDATE(),55,'HP',1,45,5,5),
('DEL006',GETDATE(),65,'BD',1,60,6,6),
('DEL007',GETDATE(),50,'DN',1,30,7,7),
('DEL008',GETDATE(),75,'VT',1,55,8,8),
('DEL009',GETDATE(),80,'NT',1,60,9,9),
('DEL010',GETDATE(),90,'QN',1,70,10,10),
('DEL011',GETDATE(),85,'Hue',1,65,11,11),
('DEL012',GETDATE(),95,'TH',1,75,12,12),
('DEL013',GETDATE(),60,'Vinh',1,45,13,13),
('DEL014',GETDATE(),70,'BN',1,50,14,14),
('DEL015',GETDATE(),65,'TN',1,55,15,15),
('DEL016',GETDATE(),85,'QN',1,65,16,16),
('DEL017',GETDATE(),90,'PQ',1,70,17,17),
('DEL018',GETDATE(),75,'BMT',1,60,18,18),
('DEL019',GETDATE(),80,'PL',1,65,19,19),
('DEL020',GETDATE(),85,'KT',1,70,20,20);

