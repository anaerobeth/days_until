 A simple script to count how many days until any deadline.

$ echo "6,1" >> deadlines.csv
$ ruby countdown.rb 
53 days until 3/9

$ echo "3,9" >> deadlines.csv
$ ruby countdown.rb 
53 days until 3/9
137 days until 6/1

To reset the list of dates
$ echo '' > deadlines.csv
