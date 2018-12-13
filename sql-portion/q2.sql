SELECT "Salesperson"."Name" FROM "Salesperson"
INNER JOIN "Orders" ON "salesperson_id" = "Salesperson"."ID"
GROUP BY "Salesperson"."Name"
HAVING SUM("Orders"."Amount") > 1300;