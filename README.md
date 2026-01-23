# Docker project (KEY-VALUE-APP)

Coded a key-value api to store information under specific key.

Run multiple containers for the application and database.

Leverage volumes to persist data from the database container.

Connect the application and database containers by leveraging user-defined networks.

Used shell script to manage the created containers networks and volumes.



API SPECIFICATIONS :- 

POST /Store - Expect request body to contain both key and value.
            - Return 400 if this not the case
            - If the key already exist in DB return 400.
            - If the key does not exist,store the Key and value, and return 201.

GET /Store/:key - Key does not exist, return 404.
                 - If key exist, return 200 and key and value

PUT /Store/:key - Expect request body to contain value. 
                - Return 400 if this not the case.
                - If the key does not exist, return 404.
                - If key exist, update the value and return 200.

DELETE /Store/:key - Key does not exist return 404.
                   - Key exist, delete the key, return 204.

GET /health - Return 200 and the text up.
