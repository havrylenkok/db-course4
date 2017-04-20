-- 1 Select info on cars
SELECT model FROM carcompany.transport  GROUP BY model;
SELECT * FROM carcompany.transport;
-- 2 Drivers + count for car 3
SELECT personnelId, COUNT(*) as 'driver_number' FROM carcompany.transport WHERE idtransport = 3;
-- 3 Select info about drivers assigned to cars
SELECT * FROM carcompany.personnel INNER JOIN carcompany.transport ON carcompany.personnel.idpersonnel = carcompany.transport.personnelId;
SELECT personnelId, idtransport, COUNT(*) as 'driver_count'
FROM carcompany.transport
INNER JOIN carcompany.personnel
ON carcompany.transport.personnelId = carcompany.personnel.idpersonnel
GROUP BY idtransport;
-- 4 Get info about cars assigned to routes
SELECT idroute, COUNT(idtransport) as 'number_of_assigned_transport' FROM carcompany.route INNER JOIN carcompany.transport ON carcompany.route.assignedTransport = carcompany.transport.idtransport GROUP BY idroute;
-- 5 info about mileage
SELECT assignedTransport,mileage from carcompany.route INNER JOIN carcompany.transport ON route.assignedTransport = transport.idtransport AND route.fromDate > 2014-12-12;
-- 6 number of repairs and cost for tranposrt
SELECT idTransport, numOfRepairs, repair.cost, idrepair
FROM carcompany.transport
JOIN repair ON transport.repairId = repair.idrepair
AND repair.dateComplete > 2013-01-01;
-- 7 personnel hierarchy
select * from personnel where teamId = 1;
-- 8 info about garages
SELECT idbuilding, carcompany.building.type, transport.idtransport FROM carcompany.building JOIN carcompany.transport ON building.idbuilding = transport.buildingId;
-- 9 count transport for buildings
SELECT idbuilding, carcompany.building.type, transport.idtransport FROM carcompany.building JOIN carcompany.transport ON building.idbuilding = transport.buildingId;
-- 10 cargo routes for cargo WHERE DATE
SELECT idroute, routeType
from route
JOIN transport ON route.assignedTransport = transport.idtransport
where routeType = '"cargo"'
and fromDate > 2012-01-01;
-- 11 number of used ENGINEs to repair GAZEL
SELECT COUNT(idrepair) as 'number_of_gazels_with_repaired_engine' from repair join transport on idrepair = repairId where repair.whatChanged = ' "engine"' and transport.model = ' "gazel"';
-- 12 info about off cars
select * from transport where status = '"off"';
-- 13 workers of manager id=4 -> teamId=3
select * from personnel where teamId = 3 and type = ' "worker"';
