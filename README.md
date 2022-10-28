# Columbia Repair Report Platform

## Group 22 Members
- Songqing Ye (sy3006)
- Yanghui Pang (yp2604)
- Dongbing Han (dh3071)
- Jiapeng Guo (jg4403)

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
bundle exec db:migrate
bundle exec db:seed
```

3. Test our project
```
bundle exec rake cucumber
bundle exec rake spec
```

4. Run our project locally
```
bundle exec rails server
```

5. Open [http://localhost:3000/](http://localhost:3000/) in a browser
