CREATE TABLE "Departments" (
    "dept_no" VARCHAR  NOT NULL,
    "dept_name" VARCHAR   NOT NULL,
	PRIMARY KEY ("dept_no")
);

CREATE TABLE "Titles" (
    "title_id" VARCHAR   NOT NULL,
    "title" VARCHAR   NOT NULL,
	PRIMARY KEY ("title_id")
);

CREATE TABLE "Employees" (
    "emp_no" INT   NOT NULL,
    "emp_title_id" VARCHAR  NOT NULL,
    "birth_date" DATE   NOT NULL,
    "first_name" VARCHAR   NOT NULL,
    "last_name" VARCHAR   NOT NULL,
    "sex" VARCHAR   NOT NULL,
    "hire_date" DATE   NOT NULL,
	PRIMARY KEY ("emp_no"),
	FOREIGN KEY ("emp_title_id") REFERENCES "Titles"("title_id")
);

CREATE TABLE "Dept_emp" (
    "emp_no" INT   NOT NULL,
    "dept_no" VARCHAR   NOT NULL,
	FOREIGN KEY ("emp_no") REFERENCES "Employees"("emp_no")
);


CREATE TABLE "Dept_manager" (
    "dept_no" VARCHAR   NOT NULL,
	"emp_no" integer   NOT NULL,
	FOREIGN KEY ("emp_no") REFERENCES "Employees" ("emp_no"),
	FOREIGN KEY ("dept_no") REFERENCES "Departments" ("dept_no")
);


CREATE TABLE "Salaries" (
    "emp_no" integer   NOT NULL,
    "salary" integer   NOT NULL,
	FOREIGN KEY ("emp_no") REFERENCES "Employees" ("emp_no")
);

-- ALTER TABLE "Departments" ADD CONSTRAINT "fk_Departments_dept_no" FOREIGN KEY("dept_no")
-- REFERENCES "Dept_manager" ("dept_no");

-- ALTER TABLE "Titles" ADD CONSTRAINT "fk_Titles_title_id" FOREIGN KEY("title_id")
-- REFERENCES "Employees" ("emp_title_id");

-- ALTER TABLE "Dept_emp" ADD CONSTRAINT "fk_Dept_emp_emp_no" FOREIGN KEY("emp_no")
-- REFERENCES "Employees" ("emp_no");

-- ALTER TABLE "Dept_manager" ADD CONSTRAINT "fk_Dept_manager_emp_no" FOREIGN KEY("emp_no")
-- REFERENCES "Employees" ("emp_no");

-- ALTER TABLE "Salaries" ADD CONSTRAINT "fk_Salaries_emp_no" FOREIGN KEY("emp_no")
-- REFERENCES "Employees" ("emp_no");