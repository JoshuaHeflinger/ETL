-- Challenge Bonus queries.
-- 1. (2.5 pts)
-- Retrieve all the number of backer_counts in descending order for each `cf_id` for the "live" campaigns. 
Select cf_id, backers_count
from campaign
where outcome = 'live'
order by backers_count desc

-- 2. (2.5 pts)
-- Using the "backers" table confirm the results in the first query.
Select cf_id, count(cf_id) as backers_count
from backers
group by cf_id
order by backers_count desc


-- 3. (5 pts)
-- Create a table that has the first and last name, and email address of each contact.
-- and the amount left to reach the goal for all "live" projects in descending order. 
Select ct.first_name, ct.last_name, ct.email, (cp.goal - cp.pledged) as remaning_amount
into email_contacts_remaining_goal_amount
from campaign as cp
inner join contacts as ct
on cp.contact_id = ct.contact_id
where cp.outcome = 'live'
order by remaning_amount  desc




-- Check the table
select * from email_contacts_remaining_goal_amount

-- 4. (5 pts)
-- Create a table, "email_backers_remaining_goal_amount" that contains the email address of each backer in descending order, 
-- and has the first and last name of each backer, the cf_id, company name, description, 
-- end date of the campaign, and the remaining amount of the campaign goal as "Left of Goal". 
Select b.first_name, b.last_name, b.email, cp.cf_id, cp.company_name, cp.description, cp.end_date, (cp.goal - cp.pledged) as left_of_goal
into email_backers_remaining_goal_amount
from campaign as cp
left join backers as b
on cp.cf_id = b.cf_id
where cp.outcome = 'live'
group by b.first_name, b.last_name, b.email, cp.cf_id, cp.company_name, cp.description, cp.end_date
order by b.last_name 


-- Check the table
select * from email_backers_remaining_goal_amount


