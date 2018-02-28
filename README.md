Hi and welcome to team Gilded Rose. As you know, we are a small inn with a prime location in a prominent city run by a friendly innkeeper named Allison. We also buy and sell only the finest goods. Unfortunately, our goods are constantly degrading in quality as they approach their sell by date. We have a system in place that updates our inventory for us. It was developed by a no-nonsense type named Leeroy, who has moved on to new adventures. Your task is to add the new feature to our system so that we can begin selling a new category of items. First an introduction to our system:

Feel free to make any changes to the UpdateQuality method and add any new code as long as everything still works correctly. However, do not alter the Item class or Items property as those belong to the goblin in the corner who will insta-rage and one-shot you as he doesn’t believe in shared code ownership (you can make the UpdateQuality method and Items property static if you like, we’ll cover for you)."*

##Rules

All items have a SellIn value which denotes the number of days we have to sell the item. All items have a Quality value which denotes how valuable the item is. At the end of each day our system lowers both values for every item. Pretty simple, right? Well this is where it gets interesting:

* Once the sell by date has passed, Quality degrades twice as fast

* The Quality of an item is never negative

* “Aged Brie” actually increases in Quality the older it gets

* The Quality of an item is never more than 50

* “Sulfuras”, being a legendary item, never has to be sold or decreases in Quality

* “Backstage passes”, like aged brie, increases in Quality as it’s SellIn value approaches; Quality increases by 2 when there are 10 days or less and by 3 when there are 5 days or less but Quality drops to 0 after the concert

We have recently signed a supplier of conjured items. This requires an update to our system:

* “Conjured” items degrade in Quality twice as fast as normal items

### approach

There were a lot of basic syntax issues to deal with; Rubocop was helpful in identifying and correcting some of them. There were also very few tests, and the tests that there were were broken and even when fixed, were not particularly helpful. I began by writing a suite of feature tests which described the behaviour in the brief.

Since the Item class could not be changed (it belongs to a grumpy goblin apparently), I decided to create a class for each type of object. Each object behaved differently over time in terms of the quality attribute, and the way that I grouped the tests seemed to be logical in terms of how responsibilities were divided up. I maintained the original Item class, with my new item classes inheriting attributes of quality, sell by date and name.

I passed each test from my test suite one by one to ensure the correct behaviour was preserved.


### what was left to do

I still need to add the conjured item class and update the text test to work with the new classes. The Conjured Item class will use an decrement_quality private method that decreases by two each time but otherwise will be identical to the basic item class.
