# First query

```
Employee.all.each do |emp|
    emp.addresses.each { |addr| puts addr.street }
end
```

This query starts by triggering the following action towards the database:

- `SELECT employees.* FROM employees`

It loads the entire Employee dataset and then starts iterating over each employee to get its addresses
and after that, brings the 'street' attribute to print it.

This is usually known as an N + 1 query optimization issue, looping through a dataset is a bad practice
in terms of performance and optimization.

It is recommended to use expressions such as `includes`, `preload` and `eager_load`

### amount of queries

-  1 query to bring the employees
-  1 query per each address for each employee


# Second query 

```
Employee.joins(:addresses).all.each do |emp|
    emp.addresses.each { |addr| puts addr.street }
end
```

This query starts by triggering the following action towards the database:

```
SELECT employees.* FROM employees INNER JOIN addressess on addresses.addressable_type = 'Employee'
...
```

this query is a bit better than the previous in the sense that it does not load the whole dataset immediately
but starts matching 'addresses' with 'employees' in a way that it makes a request for each of the addresses.

### amount of queries

-  matches employees with addresses records
-  1 query per each address for each employee


# Third query

```
Employee.includes(:addresses).all.each do |emp|
    emp.addresses.each { |addr| puts addr.street }
end
```

This query starts by triggering the following action towards the database:

```
- `SELECT employees.* FROM employees`
```

The difference with query # 1 is that it does not load the entire dataset, but eager loads each employee to trigger 
the query to search its addresses. `includes` expression guarantees the lower amount of possible queries in the loop
avoiding possible n + 1 requests.

### amount of queries

-  eager loads employees records
-  lazy loads each address for each employee to display street column value

# Fourth

```
Employee.joins(:addresses).includes(:addresses).all.each do |emp|
    emp.addresses.each { |addr| puts addr.street }
end
```

This query starts by triggering the following action towards the database:

```
- `SELECT 
    employees.id AS t0_r0,
    employees.first_name as t0_r1
    ...
    lots more relations here
    ...
    INNER JOINS addressess
    ....
    FROM employees`
```

This query maps every attribute and uses database indexing to find the specific location of the records
and would guarantee the matching of the address for the employees, making a request to bring the street
on the addresses across the indexing.

### amount of queries

-  eager loads employees records
-  eager loads each address for each employee to display street column value
