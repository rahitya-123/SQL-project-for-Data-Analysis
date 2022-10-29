#SQL-project-for-Data-Analysis
Performed the below Analysis::
Top_3_events :
--------------
Query shows the top 3 events the highest stakes by amount for EACH sport.
Results include the details shows the item with the highest stakes first as well as ALL the UNIQUE markets for each event.
Top_10_PostCodeAreas :
----------------------
Query shows the 10 postcode areas (i.e. BN7 for postcode "BN7 2DH") with the highest SETTLED amount of non-promotional stakes in GBP. 
Assuming 1 GBP = 0.8 EUR and a SETTLED bet will always have a settlement date (date_settled).
Performance_breakdown :
------------------------
Query shows the performance breakdown by each sports category. 
(note: some bets might contain multiple bet selections, those bets should be count as 1 bet)
Monthly_balance :
------------------
Query shows if the  customer had closed their account and  requested the account statement showing funds movements for EACH CALENDAR MONTH from 
their first deposit to their last account transactions.Customer account balance is calculated using
       balance = deposits + withdrawals + debits (wager) + credits (payout) + adjustments
Identifying_Duplicate_Accounts :
--------------------------------
The query returns a list of suspect usernames, with additional fields containing the other usernames (i.e. "username1, username2") that match at
least one of the following criteria –
● matching last name and date of birth
● matching mobile
● matching last name and postcode area (i.e. BN7 for postcode "BN7 2DH")
Account_statement :
-------------------
query shows the account statement for EACH CALENDAR MONTH.(including the months where there are no transactions).
Query displays the opening balance and closing balance for each reporting period.
