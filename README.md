# Supermarket

This is (or will be!) an application to run a supermarket. It should allow to manage products and a checkout process (including its history).

Please clone the repository first (do not fork it via Github!)

## Checkout process

Implement the code for a checkout system that handles pricing schemes such as "apples cost 50 cents, three apples cost $1.30." In a normal supermarket, things are identified using Stock Keeping Units, or SKUs. In our store, we’ll use individual letters of the alphabet (A, B, C, and so on). Our goods are priced individually. In addition, some items are multipriced: buy n of them, and they’ll cost you y cents. For example, item ‘A’ might cost 50 cents individually, but this week we have a special offer: buy three ‘A’s and they’ll cost you $1.30. In fact this week’s prices are:

| Item | Unit Price | Special Price |
| ---- | ---------- | ------------- |
| A    | 50         | 3 for 130     |
| B    | 30         | 2 for 45      |
| C    | 20         | -             |
| D    | 15         | -             |

Our checkout accepts items in any order, so that if we scan a B, an A, and another B, we’ll recognize the two B’s and price them at 45 (for a total price so far of 95). Because the pricing changes frequently, we need to be able to pass in a set of pricing rules each time we start handling a checkout transaction.

The interface to the checkout should look like:

``` ruby
co = CheckOut.new(pricing_rules)
co.scan(item_1)
co.scan(item_2)
    :    :
partial_price = co.total
    :    :
co.scan(item_3)
co.scan(item_4)
    :    :
total_price = co.total
```

And some tests to help you with validating the code:

| Items            | Total price |
| ---------------- | ----------- |
| n/a              | 0           |
| A, B             | 80          |
| A, A             | 100         |
| C, D, B, A       | 115         |
| A, A, A          | 130         |
| A, A, A, A       | 180         |
| A, A, A, A, A    | 230         |
| A, A, A, A, A, A | 260         |
| A, A, A, B       | 160         |
| A, A, A, B, B    | 175         |
| A, A, A, B, B, D | 190         |
| D, A, B, A, B, A | 190         |

### Things to think about:

* how to handle currencies and rounding?
* how pricing rules can be specified in such a way that the checkout doesn’t know about particular items and their pricing strategies?

### Tasks to be completed:

1. make the specs pass (changes both to tests and the code may be needed). Also, implement pending specs. You can run them with `$ bin/rake spec`
2. think about making the data in the DB more relational (what about migrating `unit`s - like pieces, kilograms, liters - to their own table?)
3. implement a page to perform a checkout process, see details at [Checkout process](#checkout-process)

  * create a form to add `Item`s to the process, calculate and display the total price on every `Item` addition
  * create a page to manage pricing rules for products
  * display a history of checkouts
  * think about situation when price of a product changes after a checkout (how to keep the history intact?)

4. make all pages accessible from the root page (create new root one, `/products` should stay separate page) and the menu (navbar) to navigate through all the pages
5. migrate the application to PostgreSQL and deploy it on Heroku (or a different cloud provider of your choice)
6. provide a link to a Github or Bitbucket repository

### Non functional requirements:

* try to write idiomatic code for your language
* use only the standard library and a test framework of your choice (rspec, test-unit, minitest, etc.)
* provide documentation how to install and run the code
* provide a link to Git repository with the solution (Github, Bitbucket)

## Bonus points

* make the page a little more pretty. We're not saying Rails' scaffold isn't nice but adding a Twitter Bootstrap would be awesome!
* total price will be recalculated on every page reload when scanning new item. Can you make it recalculate via Javascript dynamically?
* any non-standard ideas how to improve the application or just stand out as a candidate!

## Things that will be evaluated

* specs need to pass (and the code should have reasonable coverage)
* code style
* the basic checkout process is working
* the app runs on Heroku
