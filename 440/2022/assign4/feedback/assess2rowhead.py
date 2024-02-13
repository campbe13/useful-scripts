#! /usr/bin/python3
"""
P M Campbell
2020-10-03
parse feedback for project 1 into html 
for distribution to students
reads in a csv:
	expects userid in col  0  
	expects name in  col 1
	rows 1 and 2 are used as 1st column for each student  in html table
        rows 4-end are one line per student, html created for each
"""
import csv
from datetime import date
infn ='feedbacka4.csv'
htmlname = 'dns'

def print_content(i):
    if not row[i]:    # empty string == False
       return
#    print(f' {head1[i]} {head2[i]} \t  \t {row[i]} ') # for debugging
    f.write(f'<tr> <td> {head1[i]} <td>  {head2[i]} <td>{row[i]} ')
#    f.write(f'<tr> <td> {head1[i]} <td>  {head2[i]} <td> {head3[i]}  <td>{row[i]} ')

def open_html(name):
    name.replace(' ','_')
    fn = f"{name.lower().strip()}-feedback-{htmlname}.html"
    f = open(fn, 'w')   # clobber old file
    f.write('''<!DOCTYPE html>
    <html lang="en">
    <head>
    <meta charset="utf-8">
    <title>Web Dev II - JavaScript</title>
    <style>
    table, th, td {
        border: 1px solid blue;
        border-collapse:  collapse;
    }
    th, td {
        padding: 2px;
    }
    </style>
    </head>

    <body>
    <table>
    <tr align="left"><th>Category<th>Tested<th>Feedback</tr>
    ''')
    return f

def close_html(f):
    today = date.today()
    formatday  = today.strftime("%Y-%m-%d")
    f.write(f'</table><br><br><footer> feedback from PMCampbell {formatday}</footer></body> </html> ')
    f.write("sorry, in the notes part python  removed the carrriage returns, ask if you have trouble understanding it")
    f.close()
"""
main 
"""    
with open(infn) as csv_file:
    csv_reader = csv.reader(csv_file, delimiter=',')
    line_count = 0
    for row in csv_reader:
        if line_count == 0:
            #print(f'Column names are {", ".join(row)}')
            head1 = row
        elif line_count == 1:
            #print(f'points are {", ".join(row)}')
            head2 = row
        else:
            f = open_html(row[1]) 
            f.write(f'<h2>Feedback for {row[0]} {row[1]}</h2> ')
            print(f'Feedback for {row[0]} {row[1]} ')
            f.write(f'<h3>{htmlname}</h3><ul> ')
            lenrow = len(row)
            for i in range(1,lenrow):
                 print_content(i)
            close_html(f)
        line_count += 1
    print(f'Processed {line_count} lines.')
    print(f'check the html files names may not match useridsi' )

