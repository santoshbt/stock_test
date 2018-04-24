### Test for Senior Rails developers

#### General

Please use git. Please work on the branch `master`.

You have 2 options for submitting results:
1. Zipped folder
2. Git Bundle

##### 1. Zipped Folder

Just zip the folder and send it to us.

##### 2. Git Bundle

**Make sure all your changes are committed!**

Use the following command to create a _git bundle_:

`git bundle create ruby-stock-challenge-result.bundle master`

... and send us the resulting `ruby-stock-challenge-result.bundle` file.

#### Your Task

First of all you should create three models with at minimum the following attributes:

Stock (name: string)
Bearer (name: string)
MarketPrice (currency: string, value_cents: integer)

A bearer can own multiple stocks. Bearers should be unique by name. A market price can be referenced by multiple stocks but should be unique by the combination of currency and price.

Next step is to create some JSON API endpoints:

Via one API endpoint you should be able to create a stock with a referenced bearer and market price.

Another API endpoint should allow to update a stock. Bearer and market price can not be updated but if attributes of either of those change, new objects need to be created and referenced with the existing stock. Name of the stock bearer and currency of the market price should be unique. If an existing bearer or market price exists already, they should be re-used and connected to the stock instead. One stock has one bearer and one market price but bearers and market prices can be connected to multiple stocks.

One simple API endpoint should list all stocks, showing information from connected models, and should only use a maximum of three sql queries (use active record syntax). Although it should be doable in one.

In a last API endpoint it should be possible to soft-delete a stock so it doesn't appear anywhere anymore in regular queries but could still be retrieved when needed by e.g. a BI-department.

Please try to keep your controllers very lean, especially try not to implement the duplication logic (see first API endpoint) in the controllers.

Error responses should be detailed in a way that they explain what exactly is missing or wrong. In order to test this, consider to make validations that forbid names to contain "invalid".

Reflect the explained logic and endpoints in rspec tests.

Bonne chance and feel free to ask questions when you get totally stuck.
