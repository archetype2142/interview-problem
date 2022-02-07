## Challenge

<div>
-------------------------------------------
<p>our client is an online marketplace, here is a sample of some of the products available on our site:</p>

<pre>
Product code  | Name                   | Price
----------------------------------------------------------
001           | Lavender heart         | £9.25
002           | Personalised cufflinks | £45.00
003           | Kids T-shirt           | £19.95
</pre>

<p>Our marketing team want to offer promotions as an incentive for our customers to purchase these items.</p>

<p>If you spend over £60, then you get 10% of your purchase<p>
<p>If you buy 2 or more lavender hearts then the price drops to £8.50.</p>

<p>Our check-out can scan items in any order, and because our promotions will change, it needs to be flexible regarding our promotional rules.</p>

<p>The interface to our checkout looks like this (shown in Ruby):</p>

<pre>
  co = Checkout.new(promotional_rules)
  co.scan(item)
  co.scan(item)
  price = co.total
</pre>

<p>Using plain Ruby `ruby 2.6.6p146`, implement a checkout system that fulfills these requirements.</p>

<pre>
Test data
---------
Basket: 001,002,003
Total price expected: £66.78

Basket: 001,003,001
Total price expected: £36.95

Basket: 001,002,001,003
Total price expected: £73.76
</pre>
--------------------------------------------
</div>

To submit the challenge, please add your solution to a private Github repo and add the following as collaborators:
<ul>
  <li>kunks001</li>
  <li>neilchandler</li>
  <li>alexfilatov</li>
  <li>onisuzume</li>
  <li>rajgurung</li>
  <li>tomchipchase</li>
  <li>paulccarey</li>
  <li>keram</li>
</ul>