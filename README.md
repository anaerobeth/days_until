 A dead simple script to count the number of days until a deadline

#### To start adding a deadline:
    $ echo "6,1,meeting" > deadlines.csv
    $ ruby countdown.rb 
    53 days until 3/9 - meeting

#### To set additional deadlines:
    $ echo "3,9,launch app" >> deadlines.csv
    $ ruby countdown.rb
    53 days until 3/9 - meeting
    137 days until 6/1 - launch app

#### To reset the list of deadlines:
    $ echo '' > deadlines.csv
    $ ruby countdown.rb
    You have no deadlines. Yay!
