#! /usr/bin/python3
"""
P M Campbell
1st 2 rows used as headers
2020-10-03
parse feedback for project 1 into html 
for distribution to students
2 rows as headders
2 colums: userid & name
reads in a csv:
	expects userid in col  0  
	expects name in  col 1
	rows 1 and 2 are used as column for each student  in html table
        rows 3-end are one line per student, html created for each
2020-10-29 
mods to have 1st col as student id 
added infn - file to be read  & htmlname vars - 
2020-11-24
mods to have 1st 3 rows as header
2020-12-17
mods to check if csv file infn exists
NOTE: 
NOTE: 
NOTE: 
NOTE: 
change infn & htmlname 
"""
import csv
from datetime import date
# file to be read in
infn ='sirine.csv'
# used in html file name
htmlname = 'test2q1'

def print_content(i):
    if not row[i]:    # empty string == False
       return
#    print(f' {head1[i]} {head2[i]} \t  \t {row[i]} ') # for debugging
    f.write(f'<tr> <td> {head1[i]} <td>  {head2[i]} <td>{row[i]} ')

def open_html(name):
    name = name.replace(' ','-')
    name = name.lower()
    fn = f"{name.strip()}-feedback-{htmlname}.html"
    #fn = f"{name.lower().strip()}-feedback-{htmlname}.html"
    f = open(fn, 'w')   # clobber old file
    f.write('''<!DOCTYPE html>
    <html lang="en">
    <head>
    <meta charset="utf-8">
    <title>Programming I - Java</title>
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
    <tr align="left"><th>Category<th>Verified<th>Your Mark & feedback</tr>
    ''')
    return f

def close_html(f):
    today = date.today()
    formatday  = today.strftime("%Y-%m-%d")
    f.write(f'</table><br><br><footer> feedback from PMCampbell {formatday}</footer></body> </html> ')
    f.write("Check the comments against your code, after you have done so I will be happy to explain if you still need it.")
    f.close()
"""
main 
"""    
import os.path
if (os.path.isfile(infn)):
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
    print(f'check the html files names may not match userids' )
else:
   print(f'File does not exist: {infn}')
   import sys
   sys.exit(3)
   

