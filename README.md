 A dead simple script to count how many days until a deadline.

#### To start adding a deadline:
$ echo "6,1" > deadlines.csv
$ ruby countdown.rb 
53 days until 3/9

#### To set additional deadlines:
$ echo "3,9" >> deadlines.csv
$ ruby countdown.rb
53 days until 3/9
137 days until 6/1

#### To reset the list of deadlines
$ echo '' > deadlines.csv
$ ruby countdown.rb
You have no deadlines. Yay!


