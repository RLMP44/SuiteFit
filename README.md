![suitefitlogo1_small](https://github.com/RLMP44/SuiteFit/assets/109778611/f6898223-a485-4c3e-ac84-919d35c1b14c)


A moving app that allows users to see if their furniture/items will fit in an apartment before moving.


![User Bookmarks Fitting Page collision](https://github.com/RLMP44/SuiteFit/assets/109778611/76b62f28-7bbc-46dd-842b-d79559129d27)
![User Bookmarks Index Page](https://github.com/RLMP44/SuiteFit/assets/109778611/0dbdfbab-3c05-4d34-8460-5f7f1fdc90dd)
![User Items New](https://github.com/RLMP44/SuiteFit/assets/109778611/fac00ba6-dfbc-42f1-bff6-2d15dc0ecb5a)


<br>
App home: www.suitefit.tech
   

## Getting Started
### Setup

Install gems
```
bundle install
```

### ENV Variables
Create `.env` file
```
touch .env
```
Inside `.env`, set these variables. For any APIs, see group Slack channel.
```
CLOUDINARY_URL=your_own_cloudinary_url_key
```

### DB Setup
```
rails db:create
rails db:migrate
rails db:seed
```

### Run a server
```
rails s
```

## Built With
- [Rails 7](https://guides.rubyonrails.org/) - Backend / Front-end
- [Stimulus JS](https://stimulus.hotwired.dev/) - Front-end JS
- [Heroku](https://heroku.com/) - Deployment
- [PostgreSQL](https://www.postgresql.org/) - Database
- [Bootstrap](https://getbootstrap.com/) — Styling
- [Figma](https://www.figma.com) — Prototyping

## Acknowledgements
Inspired by all the stress-filled moves we've all experienced.

## Team Members
- [Shinji Matsudo](https://github.com/vShinji)
- [Mario Paju](https://github.com/MarioPaju1991)
- [Rina Iwamine](https://github.com/herah-s)

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

## License
This project is licensed under the MIT License

<h1>User Stories</h1>

As a user, I can view one specific agency Apartment  
As a user, I can access an agency Apartment via QR code  
As a user, I can see all of my bookmarked Apartments  
As a user, I can bookmark an Apartment  
As a user, I can contact the agency of a listed Apartment  
As a user, I can see all of my Items  
As a user, I can add Items to my list  
As a user, I can place my Items in one of my Apartments  
As a user, I can see my landing page  
As a user, I can edit my Item  
As a user, I can save my Item arrangement and fitting result (good/bad fit) in a specific apartment  
As a user, I can destroy Items from my list  

As a rep, I can upload/list an Apartment and generate a QR code  
As a rep, I can see all of my uploaded Apartments  
As a rep, I can edit my Apartment  
As a rep, I can destroy my Apartment  
As a rep, I can see how many people have bookmarked my Apartment/statistics for all apartments  
