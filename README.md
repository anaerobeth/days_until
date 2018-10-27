 A dead simple script to count the number of days until a deadline

#### To start adding a deadline:
    $ echo "3,9,meeting" > deadlines.csv
    $ ruby countdown.rb
    53 days until 3/9 - meeting

#### To set additional deadlines:
    $ echo "6,1,launch app" >> deadlines.csv
    $ ruby countdown.rb
    ---
    53 days until 3/9 - meeting
    137 days until 6/1 - launch app
    ---

#### To remove past deadlines, reply 'y' when prompted:
    $ ruby countdown.rb
    ---
    -5 days until 1/1 - party
    53 days until 3/9 - meeting
    ---
    Remove all past deadlines? Enter y/n:
    y
    Past deadlines have been removed from your records

#### To reset the list of deadlines:
    $ echo '' > deadlines.csv
    $ ruby countdown.rb
    You have no deadlines. Yay!


