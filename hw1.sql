samwel jesse kundaeli 20131253


Question 2

create procedure spUpdateManager(p_manager_id number, p_department_id)
as
begin
update system.departments
set manager_id=p_manager_id
where department_id=p_department_id
end;

Question 3

Create function who_is_the_manager(p_dept_id)
return varchar is
v_emp system.employees%rowtype;
begin
select e.first_name, e.last_name, d.manager_id, e.employee_id
   into v_emp.first_name,v_emp.last_name, v_emp.employee_id,v_emp.manager_id
from system.employees e join system.departments d
on(e.department_id=d.department_id)
where d.department_id=p_dept_id and e.employee_id=d.manager_id;

 return (v_emp.first_name||' '||v_emp.last_name);
end who_is_the_manager;