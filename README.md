# Columbia Repair Report Platform

## Group 22 Members
- Songqing Ye (sy3006)
- Yanghui Pang (yp2604)
- Dongbing Han (dh3071)
- Jiapeng Guo (jg4403)

## Links
- Github: [https://github.com/yhui288/Columbia-Repair-Report-Platform](https://github.com/yhui288/Columbia-Repair-Report-Platform)
- Heroku: [https://mighty-brushlands-39335.herokuapp.com/](https://mighty-brushlands-39335.herokuapp.com/)

## Versions
- Ruby: 2.6.6
- Rails: 4.2.10
- Machine: MacBook M1

## Setup
1. Clone our project repo
```
git clone https://github.com/yhui288/Columbia-Repair-Report-Platform.git
```

2. Install gems and create the database
```
cd path_to_project_root_directory/
bundle install --without production
bundle exec rake db:migrate
bundle exec rake db:seed
```

3. Test our project
```
bundle exec cucumber
bundle exec rspec
```

4. Run our project locally
```
bundle exec rails server
```

5. Open [http://localhost:3000/](http://localhost:3000/) in a browser

## Features (iter1)
- Users can submit a report (by scanning a QR code or directly visiting the website)
- Managers can view a list of requests
- Managers can update their status
- Managers can generate QR code for a place so that users can submit a report by scanning the QR code on the wall

## Feature (iter2)
- Refine the report form (add description and image uploading)
- Add manager authentication (need signup with lionmail)
- Managers can filter reports by problem type
- Managers can add comments to reports
- Adjust some UI components
- Fix two bugs from iter1 (Format of UNI and More tests)

## Feature (demo)
- Send Email notification to reporter when a report is marked as completed.
    * To test this function, please submit a new report with your uni
    * When a report is marked as complete, a email notification will send to your lionmail by 1023990429@qq.com
    * Once a report has been submitted, the uni cannot be changed

## TODO
- Update UI: our project is built under the Homework's framework so the UIs is similar to homework and pretty simple now
- Send emails to managers when an urgent report is submitted
- ...

## Reference
- User login system
    - [Creating a User Login System - Ruby on Rails](https://dev.to/kjdowns/creating-a-user-login-system-ruby-on-rails-2kl2)
    - [Authentication with Bcrypt](https://www.ananunesdasilva.com/posts/authentication-with-bcrypt)
