1.INNER JOIN

Table: students name
student_id	  name
1	          Alice
2	          Bob
3	          Carol
4	          David

Table: marks
student_id	     subject	score
1	              Math	           85
2	              Math	           90
2	             English	       88
5	              Math	           75

SELECT students.name, marks.subject, marks.score
FROM students
INNER JOIN marks ON students.student_id = marks.student_id;

OUTPUT
name	Subject  	score
Alice	Math	    85
Bob	    Math	    90
Bob	   English	    88

Explanation: Only records where student_id exists in both tables.

2. LEFT JOIN

SELECT students.name, marks.subject, marks.score
FROM students
LEFT JOIN marks ON students.student_id = marks.student_id;
✅ Output:
name	subject	   score
Alice	  Math	    85
Bob	      Math	    90
Bob	     English	88
Carol	   NULL	   NULL
David	   NULL	   NULL

Explanation: All students are shown, even if they have no marks.


3. RIGHT JOIN

SELECT students.name, marks.subject, marks.score
FROM students
RIGHT JOIN marks ON students.student_id = marks.student_id;
 Output:
name	 subject	    score
Alice	   Math	         85
Bob	       Math	         90
Bob  	 English	     88
NULL	   Math	         75

Explanation: All marks are shown, even if there’s no matching student.

 4. FULL OUTER JOIN
 using UNION of LEFT and RIGHT joins:


SELECT students.name, marks.subject, marks.score
FROM students
LEFT JOIN marks ON students.student_id = marks.student_id

UNION

SELECT students.name, marks.subject, marks.score
FROM students
RIGHT JOIN marks ON students.student_id = marks.student_id;
✅ Output:
name	subject    	score
Alice	 Math	     85
Bob	     Math	     90
Bob	    English	     88
Carol	  NULL    	NULL
David	  NULL	    NULL
NULL	  Math	     75

Explanation: Combines all rows from both tables, showing NULLs where there's no match.

