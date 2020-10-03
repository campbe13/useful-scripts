#! /usr/bin/python3
"""
P M Campbell
2020-10-03
parse feedback for assignment 1 into html 
for distribution to students
"""
import csv
from datetime import date

def print_content(i):
    if not row[i]:    # empty string == False
       return
    print(f' {head1[i]} {head2[i]} \t  \t {row[i]} ')
    f.write(f'<tr> <td> {head1[i]} <td>  {head2[i]} <td>{row[i]} ')

def open_html(name):
    fn = name.lower() + "-feedback-ass1.html"
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
    <tr align="left"><th>Group<th>item<th>y, n or feedback</tr>
    ''')
    return f

def close_html(f):
    today = date.today()
    formatday  = today.strftime("%Y-%m-%d")
    f.write(f'</table><br><br><footer> feedback from PMCampbell {formatday}</footer></body> </html> ')
    f.close()
    
with open('320-ass1.csv') as csv_file:
    csv_reader = csv.reader(csv_file, delimiter=',')
    line_count = 0
    for row in csv_reader:
        if line_count == 0:
            print(f'Column names are {", ".join(row)}')
            head1 = row
        elif line_count == 1:
            print(f'Column names are {", ".join(row)}')
            head2 = row
        else:
            f = open_html(row[0]) 
            print(f'Feedback for {row[0]} ')
            f.write(f'<h2>Feedback for {row[0]}</h2> ')
            f.write(f'<h3>assignment 1</h3><ul> ')
            lenrow = len(row)
            for i in range(1,lenrow):
#            print(f' {head1[1]} {head2[1]} {row[1]} ')
#            print(f' {head1[2]} {head2[2]} {row[2]}') 
                 print_content(i)
#            print(f'leng {len(row)}')
            close_html(f)
        line_count += 1
    print(f'Processed {line_count} lines.')

