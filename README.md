Stack Overflow Clone
==============

Authors
------------
Grace Mekarski and Tyler Brown


Overview
------------
Stack Overflow Clone is a Ruby on Rails app. It allows a new user to sign up and, on successful account creation, a confirmation email is sent to them. The signed in user can then view all questions posted to the app, pose a question for the user base themselves, or post a response answering another user's question. If the user's posted question is responded to, they receive an email notifying them.


Installation
------------

Install Stack Overflow Clone by first cloning the repository.  
```
$ git clone https://github.com/TylerJBrown192/stack_overflow_clone_rails.git
```

Open Stack Overflow Clone by going into the folder and clicking index.html or in the terminal type:
```
$ cd stack_overflow_clone
```
```
$ rake db:create
```
```
$ rake db:schema:load
```
```
$ rails s
```

Test it out!
```

License
-------

GNU GPL v2. Copyright 2015 Tyler Brown and Grace Mekarski


TO DO FOR REAL
-Upvotes
-More Crappybara
-Let grace style while I nap
-...devise?
-Heroku deployment / mailer
