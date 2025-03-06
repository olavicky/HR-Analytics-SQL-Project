HR-Analytics

-- 1. Which 3 depts had the highest satisfaction score and which 3 depts had the lowest satisfaction score.
select department, 
round(avg (satisfaction_level), 3) as avg_satisfaction
from employee_data
group by department
order by avg_satisfaction desc;

-- 2. What is the relationship between salary and satisfaction score
select salary,
round(avg(satisfaction_level),3) as avg_satisfaction
from employee_data
group by salary
order by avg_satisfaction desc;

-- 3. How did the the top two and bottom two perform in the following areas
-- Top two departments: management and product_management
-- Bottom two departments: Accounting and HR
-- a. last evaluation, b. number_projects, c. Averaage_monthly_hours, d. time_spend_company, e. work_accident,
-- f. promotion_last_5_years, g. promotion_last_5_years
  



select
    case
        when department in ('management', 'product_mng') then 'top_dept'
        when department in ('hr', 'accounting') then 'bottom_dept'
        else 'other_dept'
    end as top_bot,
    round(avg(last_evaluation), 2) as avg_evaluation,
    round(avg(number_project), 2) as avg_project,
    round(avg(average_monthly_hours), 2) as avg_hours,
    round(avg(time_spend_company), 2) as avg_time,
    round(avg(work_accident), 2) as avg_accident,
    round(avg(promotion_last_5_years), 2) as promotion_last_5_years
from employee_data
where department in ('support', 'management', 'hr', 'accounting')
group by top_bot
order by avg_evaluation;
