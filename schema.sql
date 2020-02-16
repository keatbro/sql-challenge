create table departments (
    dept_no varchar(50) not null,
    dept_name varchar(50) not null,
    constraint pk_departments primary key (
        dept_no
     )
);

create table employees (
    emp_no int not null,
    birth_date date not null,
    first_name varchar(50) not null,
    last_name varchar(50) not null,
    gender varchar(5) not null,
    hire_date date not null,
    constraint pk_employees primary key (
        emp_no
     )
);

create table dept_emp (
    emp_no int not null,
    dept_no varchar(50) not null,
    from_date date not null,
    to_date date not null
);

create table dept_manager (
    dept_no varchar(50) not null,
    emp_no int not null,
    from_date date not null,
    to_date date not null
);

create table salaries (
    emp_no int not null,
    salary int not null,
    from_date date not null,
    to_date date not null
);

create table titles (
    emp_no int not null,
    title varchar(50) not null,
    from_date date not null,
    to_date date not null
);

alter table dept_emp add constraint fk_dept_emp_emp_no FOREIGN KEY(emp_no)
references employees (emp_no);

alter table dept_emp add constraint fk_dept_emp_dept_no FOREIGN KEY(dept_no)
references departments (dept_no);

alter table dept_manager add constraint fk_dept_manager_dept_no foreign key(dept_no)
references departments (dept_no);

alter table dept_manager add constraint fk_dept_manager_emp_no foreign key(emp_no)
references employees (emp_no);

alter table salaries add constraint fk_salaries_emp_no foreign key(emp_no)
references employees (emp_no);

alter table titles add constraint fk_titles_emp_no foreign key(emp_no)
references employees (emp_no);
