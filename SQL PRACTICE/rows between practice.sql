---Practice Window Functions

select * from sales_transaction

--Question 1: Running Revenue Total per Employee
--For each employee, calculate a running total of revenue ordered by transaction date.

select employeename, transactiondate, revenue,
sum(revenue) over(partition by employeename order by transactiondate 
					rows between unbounded preceding and current row) Running_Revenue
from sales_transaction
order by employeename, transactiondate

-- Q2 3-Day Moving Average Revenue per Department

select department, transactiondate, revenue,
avg(revenue) over(partition by department order by transactiondate
				  rows between 2 preceding and current row) Moving_avg
from sales_transaction
order by department, transactiondate

-- Q3) Show the difference between current revenue and the next transaction for each employee.
select employeename, transactiondate, revenue, revenue -
sum(revenue) over(partition by employeename order by transactiondate 
				  rows between 1 following and 1 following) RevenueDiffWithNext
from sales_transaction
order by employeename, transactiondate

-- Q4) From each transaction onward, how much revenue is still remaining in the department?

select Department, transactiondate, revenue, 
sum(revenue) over(partition by Department order by transactiondate
			      rows between current row and unbounded following)remaining_revenue
from sales_transaction
order by Department, transactiondate

-- Q5) Detect local revenue spikes by comparing each transaction against its immediate neighbors.

select transactiondate, employeename, revenue,
avg(revenue) over(partition by employeename order by transactiondate) avg_revenue
from sales_transaction
order by employeename, transactiondate 


