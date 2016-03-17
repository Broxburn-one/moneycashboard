# moneycashboard
Project for sinatra / MVC / REST / PostgreSQL

App to track your spending in an attempt to be more frugal with money.
You must be able to create new Transactions ( which should include merchant name e.g. Tesco and value ) which has an associated Tag (e.g. ‘food’). It would then be able to track a total. Your Account could then be displayed in a view.

Suggested MVP:

- Create new transactions
- Display all transactions
- Display total expenditure
- Display total expenditure by tag

Your app could:

- CRUD actions for the transations
- Create route that sends down Account data as JSON

/////

Actual
-----


3 database tables: 2 master data (items and merchants) and 1 transaction table (called transactions)
See moneycashboard.sql file for table schemas.

