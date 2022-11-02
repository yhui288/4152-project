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

## Features
- Users can submit a report (by scanning a QR code or directly visiting the website)
- Managers can view a list of requests
- Managers can update their status
- Managers can generate QR code for a place so that users can submit a report by scanning the QR code on the wall

## TODO
- Update UI: our project is built under the Homework's framework so the UIs is similar to homework and pretty simple now
- Refine the report form (add 'description' and image uploading)
- Add login and role selection for managers
- Add reports arrangement
- ...
