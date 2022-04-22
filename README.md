# 501_C_Free
### README

## Table of Contents
- [Overview](#overview)
- [Schema](#schema)
- [Setup](#setup)
- [Endpoints](#endpoints)
- [Technologies](#technologies)
- [Contributors](#contributors)

### <ins>Overview</ins>
Backend application for 501-c-Free creates a platform where non-profits that do not have the capital for web development projects can connect with new developers seeking real world projects to gain experience and resume building.
This application allows users to authenticate with third party service and consumes 2 apis. Utilizes facades, services, serializers and poros design patterns to assist in exposing api endpoints

### <ins>Schema</ins>
This application uses a PostgresQL database to store Customer and Subscription information.
<img width="600" alt="be_schema" src="https://user-images.githubusercontent.com/92329376/164086840-03363d87-9cb2-4fce-8644-10126b9da4e3.png">

### <ins>Setup</ins>
1. Fork and Clone the repo: [Github - 501-c-free](https://github.com/501-c-Free/back_end_501cFree)
2. Install gem packages: `bundle install`
3. Setup the database: `rails db:{drop,create,migrate,seed}`
4. Get [Charity.3scale API key](https://charity.3scale.net/)
5. Set up Figaro: `bundle exec figaro install`
6. Add API keys to `config/application.yml`
7. Run test suite locally with `bundle exec rspec`

### <ins>Endpoints</ins>
Index for all projects: 
/api/v1/projects
<img width="365" alt="Screen Shot 2022-04-21 at 12 52 54 AM" src="https://user-images.githubusercontent.com/92293363/164582788-19990e72-6d71-4fd3-b33a-699ffdb47c93.png">

Project show page: 
/api/v1/projects/{project_id}
<img width="482" alt="Screen Shot 2022-04-21 at 12 53 21 AM" src="https://user-images.githubusercontent.com/92293363/164583060-a274d45f-4d25-4f1f-9acc-0554ace0b97f.png">

All developers: 
/api/v1/developer
<img width="540" alt="Screen Shot 2022-04-21 at 12 53 34 AM" src="https://user-images.githubusercontent.com/92293363/164583155-180ea92d-13b7-4d1c-8084-fd1acce0baa0.png">

### <ins>Technologies</ins>

#### Versions
- Ruby 2.7.4
- Rails 5.2.6

#### Development
<img src="https://img.shields.io/badge/Ruby_on_Rails-CC0000?style=for-the-badge&logo=ruby-on-rails&logoColor=white" /> 
<img src="https://img.shields.io/badge/Postman-FF6C37?style=for-the-badge&logo=postman&logoColor=white" />
<img src="https://img.shields.io/badge/Atom-66595C?style=for-the-badge&logo=Atom&logoColor=white" />
<img src="https://img.shields.io/badge/GitHub_Actions-2088FF?style=for-the-badge&logo=github-actions&logoColor=white" />
<img src="https://user-images.githubusercontent.com/64919819/113648232-81d60d00-9649-11eb-8ea4-0ff5e399afb6.png" />
<img src="https://img.shields.io/badge/Markdown-000000?style=for-the-badge&logo=markdown&logoColor=white" />
<img src="https://img.shields.io/badge/PostgreSQL-316192?style=for-the-badge&logo=postgresql&logoColor=white" />
<img src="https://img.shields.io/badge/circleci-343434?style=for-the-badge&logo=circleci&logoColor=white" />
<img src="https://img.shields.io/badge/Postman-FF6C37?style=for-the-badge&logo=Postman&logoColor=white"/>
<img src="https://user-images.githubusercontent.com/64919819/113648167-6965f280-9649-11eb-8794-0f1082ae8d1c.png" />
<img src="https://img.shields.io/badge/Heroku-430098?style=for-the-badge&logo=heroku&logoColor=white" />

### <ins>Contributors</ins>

- [Conor Barthel](https://github.com/conorbarthel)
- [Greg Flaherty](https://github.com/gregoryjflaherty)
- [Gunnar Sorensen](https://github.com/glsorensen)
- [Maximilian Wagner](https://github.com/MWagner3)
- [Michael Brandt](https://github.com/mbrandt00)
- [Becky Nisttahuz](https://github.com/benistta)
