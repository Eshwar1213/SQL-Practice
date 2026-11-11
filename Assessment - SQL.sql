--Drivers Table
CREATE TABLE drivers(
    driver_id NUMBER(8) PRIMARY KEY,
    driver_name VARCHAR2(40), 
    city VARCHAR2(40)
);

INSERT INTO drivers VALUES (1, 'Amir', 'Chennai');
INSERT INTO drivers VALUES (2, 'Beena', 'Chennai');
INSERT INTO drivers VALUES (3, 'Chetan', 'Salem');
INSERT INTO drivers VALUES (4, 'Divya', 'Salem');

SELECT * FROM drivers;
    

--Shipment Table
CREATE TABLE shipments(
    shipment_id NUMBER(8) PRIMARY KEY,
    driver_id NUMBER(8), 
    ship_date DATE,
    delivery_date DATE,
    status VARCHAR2(40), 
    charge NUMBER(20),
    
    CONSTRAINT fk_drivers FOREIGN KEY (driver_id) REFERENCES drivers(driver_id) ON DELETE CASCADE
);

INSERT INTO shipments VALUES (101, 1, TO_DATE('2026-05-01', 'YYYY-MM-DD'), TO_DATE('2026-05-02', 'YYYY-MM-DD'), 'DELIVERED', 500);
INSERT INTO shipments VALUES (102, 1, TO_DATE('2026-05-03', 'YYYY-MM-DD'), TO_DATE('2026-05-05', 'YYYY-MM-DD'), 'DELIVERED', 600);
INSERT INTO shipments VALUES (103, 2, TO_DATE('2026-05-01', 'YYYY-MM-DD'), NULL, 'IN_TRANSIT', 400);
INSERT INTO shipments VALUES (104, 2, TO_DATE('2026-05-04', 'YYYY-MM-DD'), TO_DATE('2026-05-06', 'YYYY-MM-DD'), 'DELIVERED', 800);
INSERT INTO shipments VALUES (105, 3, TO_DATE('2026-05-01', 'YYYY-MM-DD'), TO_DATE('2026-05-04', 'YYYY-MM-DD'), 'DELIVERED', 900);
INSERT INTO shipments VALUES (106, 3, TO_DATE('2026-05-06', 'YYYY-MM-DD'), TO_DATE('2026-05-07', 'YYYY-MM-DD'), 'DELIVERED', 300);
INSERT INTO shipments VALUES (107, 4, TO_DATE('2026-05-02', 'YYYY-MM-DD'), TO_DATE('2026-05-03', 'YYYY-MM-DD'), 'DELIVERED', 700);

SELECT * FROM shipments;


--Shipment_items Table
CREATE TABLE shipment_items(
    shipment_id NUMBER(8),
    item_id NUMBER(8) PRIMARY KEY, 
    weight_kg NUMBER(10),
    
    CONSTRAINT fk_shipment_item FOREIGN KEY (shipment_id) REFERENCES shipments(shipment_id) ON DELETE CASCADE
);

INSERT INTO shipment_items VALUES (101, 1, 2);
INSERT INTO shipment_items VALUES (101, 2, 1);
INSERT INTO shipment_items VALUES (102, 3, 5);
INSERT INTO shipment_items VALUES (103, 4, 1);
INSERT INTO shipment_items VALUES (104, 5, 4);
INSERT INTO shipment_items VALUES (104, 6, 2);
INSERT INTO shipment_items VALUES (105, 7, 6);
INSERT INTO shipment_items VALUES (106, 8, 3);
INSERT INTO shipment_items VALUES (107, 9, 2);


SELECT * FROM shipment_items;


--incident Table 
CREATE TABLE incidents(
    incident_id NUMBER(8) PRIMARY KEY,
    shipment_id NUMBER(8),
    severity VARCHAR2(40),
    
    CONSTRAINT fk_shipment_incident FOREIGN KEY (shipment_id) REFERENCES shipments(shipment_id) ON DELETE CASCADE
);

INSERT INTO incidents VALUES (201, 102, 'LOW');
INSERT INTO incidents VALUES (202, 105, 'HIGH');
INSERT INTO incidents VALUES (203, 105, 'LOW');

SELECT * FROM incidents;




--QUESTION 1 : DRIVER REVENUE WITH TIES
WITH total_rev AS (
    SELECT d.driver_id, d.driver_name, SUM(s.charge) OVER(PARTITION BY d.driver_id) AS total_revenue
    FROM drivers d
    INNER JOIN shipments s
        ON d.driver_id = s.driver_id
        AND s.status = 'DELIVERED'
)
SELECT DISTINCT driver_id, driver_name, total_revenue, DENSE_RANK() OVER(ORDER BY total_revenue DESC) AS revenue_rank
FROM total_rev;


--QUESTION 2 : HEAVIEST DELIVERED SHIPMENT
WITH total_weight AS (
    SELECT s.driver_id, s.shipment_id, si.weight_kg, SUM(si.weight_kg) OVER(PARTITION BY s.shipment_id) as total_weight_kg, 
                                                     ROW_NUMBER() OVER(PARTITION BY driver_id ORDER BY weight_kg DESC) as rn
    FROM shipment_items si
    INNER JOIN shipments s
        ON si.shipment_id = s.shipment_id
        AND s.status = 'DELIVERED'
)
SELECT driver_id, shipment_id, total_weight_kg
FROM total_weight
WHERE rn = 1;


--QUESTION 3 : DELIVERED SHIPMENT SEQUENCE
WITH prev_del AS (
    SELECT driver_id, shipment_id, ship_date, LAG(shipment_id) OVER(PARTITION BY driver_id ORDER BY ship_date) as prev_shipment_id
    FROM shipments
    WHERE ship_date IS NOT NULL AND delivery_date IS NOT NULL
)
SELECT driver_id, shipment_id, ship_date, prev_shipment_id
FROM prev_del
WHERE prev_shipment_id IS NOT NULL;

