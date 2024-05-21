
## Juice shop api


### /api/Feedbacks/
    { 
        "UserId":30,
        "captchaId":68,
        "captcha":"16",
        "comment":"fvdfv (***12@mail.ru)",
        "rating":2
    }


### /api/Users/
    {
        "email":"sus13@mail.ru",
        "password":"sus13@mail.ru",
        "passwordRepeat":"sus13@mail.ru",
        "securityQuestion": 
        {
            "id":3,"question":"Mother's birth date? (MM/DD/YY)",
            "createdAt":"2024-05-05T13:58:30.297Z",
            "updatedAt":"2024-05-05T13:58:30.297Z"
        },
        "securityAnswer":"123213123"
    }

### /rest/user/
    {
        "email":"sus13@mail.ru",
        "password":"sus13@mail.ru"
    }


### /rest/chatbot/respond
    {
        "action":"query",
        "query":"hello"
    }