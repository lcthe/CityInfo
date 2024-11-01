
CREATE TABLE Region (
    id INT AUTO_INCREMENT PRIMARY KEY,
    region_name VARCHAR(100) NOT NULL,
    parent_region_id INT,
    FOREIGN KEY (parent_region_id) REFERENCES Region(id)
);


CREATE TABLE Collector (
    id INT AUTO_INCREMENT PRIMARY KEY,
    login_account VARCHAR(50) NOT NULL,
    password VARCHAR(255) NOT NULL,
    region_id INT,
    is_admin BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (region_id) REFERENCES Region(id)
);


CREATE TABLE Infrastructure (
    id INT AUTO_INCREMENT PRIMARY KEY,
    facility_type VARCHAR(50) NOT NULL,
    capacity INT,
    configuration TEXT,
    address VARCHAR(255),
    longitude DECIMAL(10, 7),
    latitude DECIMAL(10, 7),
    construction_time DATE,
    region_id INT,
    created_by INT,
    FOREIGN KEY (region_id) REFERENCES Region(id),
    FOREIGN KEY (created_by) REFERENCES Collector(id)
);

CREATE TABLE FireHydrant (
    id INT AUTO_INCREMENT PRIMARY KEY,
    infrastructure_id INT,
    maintenance_date DATE,
    maintainer VARCHAR(50),
    product_model VARCHAR(50),
    type VARCHAR(50),
    status VARCHAR(50),
    FOREIGN KEY (infrastructure_id) REFERENCES Infrastructure(id)
);

CREATE TABLE TrashBin (
    id INT AUTO_INCREMENT PRIMARY KEY,
    infrastructure_id INT,
    has_classification BOOLEAN,
    product_model VARCHAR(50),
    status VARCHAR(50),
    FOREIGN KEY (infrastructure_id) REFERENCES Infrastructure(id)
);

INSERT INTO Region (region_name, parent_region_id) VALUES
('广东省', Null),
('佛山市', 1),
('广州市', 1);


INSERT INTO Collector (login_account, password, region_id, is_admin) VALUES
('admin1', 'password1', 1, TRUE),
('collector1', 'password2', 1, FALSE),
('collector2', 'password3', 2, FALSE);



INSERT INTO Infrastructure (facility_type, capacity, configuration, address, longitude, latitude, construction_time, region_id, created_by) VALUES
('消防栓', 10, '标准配置', '广东省佛山市禅城区文华北路11号', 121.458366, 31.197646, '2020-01-01', 2, 1),
('垃圾桶', 5, '分类垃圾桶', '广东省佛山市禅城区文华北路181号', 118.796877, 32.060255, '2021-05-15', 3, 1),
('消防栓', 15, '高级配置', '广东省佛山市禅城区文华北路18号', 121.503322, 31.222222, '2019-07-20', 2, 2);

INSERT INTO FireHydrant (infrastructure_id, maintenance_date, maintainer, product_model, type, status) VALUES
(1, '2023-01-15', '张三', 'MH-100', '手动泵', '使用中'),
(3, '2023-02-20', '李四', 'AH-200', '自动泵', '空闲');

INSERT INTO TrashBin (infrastructure_id, has_classification, product_model, status) VALUES
(2, TRUE, 'TB-500', '空闲'),
(3, FALSE, 'TB-300', '满载');

