# :robot: insuretech_bot
This project holds the source for the chatbot created for acko hackathon

# :question: What is insuretech_bot?
- A chatbot that will help you decide :confused: what insurance scheme to choose.
- It acts like your personal digital  assistant :dog:.

# :gear: What is this built with?
1. `Python3`
2. `Django`
3. `MySql`

# :rocket: How to get started?
- Clone this repo
```
https://github.com/abhisekpadhi/insuretech_bot.git
```

- Setup virtualenv

```
cd insuretech_bot/
virtualenv --python=python3 venv
```

- Activate virtualenv

```
source venv/bin/activate
```

- Install dependencies

```
pip install -r requirements
```

- Setup database
```
mysql -u <username> -p<password>
mysql> CREATE DATABASE IF NOT EXISTS `ddos`;
mysql> exit
```

- Run migrations
```
python manage.py makemigrations
python manage.py migrate
```

- Dump dummy data (optional)
```
mysql -u <username> -p<password> ddos < ddos_data.sql
```

- Start application
```
python manage.py runserver localhost:8000
```

# :smiley: API's

## User API
- GET details about a user
```
curl -X GET \
  'http://localhost:8000/api/v1/users/?email=<email>' \
  -H 'Content-Type: application/json'
```
*response:*
```
[
    {
        "id": 2,
        "email": "<email>",
        "phone_number": null,
        "permanent_addr": null,
        "current_addr": null,
        "aadhar_number": null,
        "dl_number": null,
        "birth_certificate_serial": null,
        "date_of_birth": "1993-03-24",
        "status": "1993-03-24"
    }
]
```

- Create a user
```
curl -X POST \
  http://localhost:8000/api/v1/users/ \
  -H 'Content-Type: application/json' \
  -d '{"email": "test@google.com"}'
```

*response*

```
{
    "status": "success",
    "status_message": "User created."
}
```

- Updata a user
```
curl -X PUT \
  http://localhost:8000/api/v1/users/ \
  -H 'Content-Type: application/json' \
  -d '{
	"email": "test@google.com",
	"phone_number": "+91943983125"
	}'
```

*response*

```
{
    "status": "success",
    "status_message": "User updated."
}
```

```
mysql> select * from bot_user where email="test@google.com" \G
*************************** 1. row ***************************
                      id: 8
                   email: test@google.com
            phone_number: +91943983125
              created_at: 2018-12-16 17:33:27.075498
          permanent_addr: NULL
            current_addr: NULL
           aadhar_number: NULL
               dl_number: NULL
birth_certificate_serial: NULL
           date_of_birth: NULL
                  status: NULL
1 row in set (0.00 sec)

```

- Delete a user

```
curl -X DELETE \
  http://localhost:8000/api/v1/users/ \
  -H 'Content-Type: application/json' \
  -d '{
	"email": "bot@acko.com"
	}'
```

*response*

```
{
    "status": "success",
    "status_message": "User deleted."
}
```

## Chat API
- GET chat history of a user

```
curl -X GET \
  'http://localhost:8000/api/v1/chats/?email=<email>@gmail.com' \
  -H 'Content-Type: application/json'
```

*response*

```
[
...
    {
        "id": 8,
        "chat": 1,
        "line_text": "[{'id': 1, 'title': 'appliance', 'is_leaf': False, 'is_root': True, 'parent_node': None, 'prompt_text': 'select category', 'action_template': 'single_choice', 'ack_text': None, 'priority': None}]",
        "is_bot": true
    },
 ...
    {
        "id": 92,
        "chat": 1,
        "line_text": "[{\"id\": 18, \"title\": \"appliance\", \"is_leaf\": true, \"is_root\": false, \"parent_node\": 11, \"prompt_text\": null, \"action_template\": \"single_choice\", \"ack_text\": \"hd 800\", \"priority\": null}]",
        "is_bot": true
    }
...
]
```

- Creating/Starting a chat

```
curl -X POST \
  http://localhost:8000/api/v1/chats/ \
  -H 'Content-Type: application/json' \
  -d '{
	"email": "<email>@gmail.com",
	"line_text": "selecting",
	"selected_node": 1
	}'
```

*response*

```
{
    "status": "success",
    "message": [
        {
            "id": 1,
            "title": "appliance",
            "is_leaf": false,
            "is_root": true,
            "parent_node": null,
            "prompt_text": "select category",
            "action_template": "single_choice",
            "ack_text": null,
            "priority": null
        }
    ],
    "choices": [
        {
            "id": 3,
            "title": "appliance",
            "is_leaf": false,
            "is_root": false,
            "parent_node": 1,
            "prompt_text": "select brand",
            "action_template": "single_choice",
            "ack_text": "headphones",
            "priority": null
        },
        {
            "id": 5,
            "title": "appliance",
            "is_leaf": false,
            "is_root": false,
            "parent_node": 1,
            "prompt_text": "select brand",
            "action_template": "single_choice",
            "ack_text": "wearables",
            "priority": null
        },
        {
            "id": 6,
            "title": "appliance",
            "is_leaf": false,
            "is_root": false,
            "parent_node": 1,
            "prompt_text": "select brand",
            "action_template": "single_choice",
            "ack_text": "tablets",
            "priority": null
        },
        {
            "id": 7,
            "title": "appliance",
            "is_leaf": false,
            "is_root": false,
            "parent_node": 1,
            "prompt_text": "select brand",
            "action_template": "single_choice",
            "ack_text": "phones",
            "priority": null
        },
        {
            "id": 8,
            "title": "appliance",
            "is_leaf": false,
            "is_root": false,
            "parent_node": 1,
            "prompt_text": "select brand",
            "action_template": "single_choice",
            "ack_text": "action cameras",
            "priority": null
        },
        {
            "id": 9,
            "title": "appliance",
            "is_leaf": false,
            "is_root": false,
            "parent_node": 1,
            "prompt_text": "select brand",
            "action_template": "single_choice",
            "ack_text": "laptops",
            "priority": null
        },
        {
            "id": 10,
            "title": "appliance",
            "is_leaf": false,
            "is_root": false,
            "parent_node": 1,
            "prompt_text": "select brand",
            "action_template": "single_choice",
            "ack_text": "photography gear",
            "priority": null
        }
    ]
}
```

- Decision context is stored in `status` field of `bot_user` table.

```
mysql> select * from bot_user where email="<email>@gmail.com"\G
*************************** 1. row ***************************
                      id: 1
                   email: avicool000@gmail.com
            phone_number: NULL
              created_at: 2018-12-15 09:37:45.493130
          permanent_addr: NULL
            current_addr: NULL
           aadhar_number: NULL
               dl_number: NULL
birth_certificate_serial: NULL
           date_of_birth: 1994-04-24
                  status: {"funnel": {"title": "appliance", "node_id": 1}, "subscribed": []}
1 row in set (0.00 sec)

```

# :evergreen_tree: Sample decision tree for `appliance` 

```
                                                                +------------------------------------------------------+
                                   +----------------------------+ APPLIANCE |-----------------+                        |
                                   |            +------------------------+---------+          |                        |
                                   |            |            |           |         |          |                        |
                                   |            |            |           |         |          |                        |
                                   |            |            |           |         |          |                        |
                                   |            |            |           |         |          |                        |
                                   |            |            |           |         |          |                        |
      +----------------------------v-----+    +-v-------+  +-v-----+   +-v-----+ +-v-----+  +-v-----------+  +---------v--------+
      |        +-------------|HEADPHONES |    |WEARABLES|  |TABLETS|   |PHONES | |LAPTOPS|  |ACTION CAMERA|  | PHOTOGRAPHY GEARS|
      |        |        +------+------+--+    +---------+  +-------+   +-------+ +-------+  +-------------+  +------------------+
      |        |        |      |      |
      |        |        |      |      |
      |        |        |      |      |
      |        |        |      |      |
      |        |        |      |      |
+-----v----+ +-v-+   +--v--+ +-v--+ +-v---+
|SENNHEISER| |AKG|   |SHURE| |BOSE| |GRADO|
+-+------+-+ +---+   +-----+ +----+ +-----+
  |      |
  |      |
+-v---+ +v----+
|HD310| |HD800|
+-----+ +-----+

```

*Drawn with http://asciiflow.com/*