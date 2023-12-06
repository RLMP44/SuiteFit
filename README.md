![suitefitlogo1_small](https://github.com/RLMP44/SuiteFit/assets/109778611/f6898223-a485-4c3e-ac84-919d35c1b14c)


Suite Fit is a moving app that allows users to see if their furniture/items will fit in an apartment before moving, giving them the confidence they need to commit to a move.
At the same time, our app also allows real estate agents to gauge client interest in specific apartments and close sales more easily.


App home: www.suitefit.tech


<br>
Users can start from the homepage or scan a QR code from a real estate flier to launch the app.

![User Landing Page](https://github.com/RLMP44/SuiteFit/assets/109778611/4a63061f-f24d-416f-bef0-2293694823ca)

After scanning a QR code, the user can decide to favorite the apartment for later.
![User Apartment Show Page](https://github.com/RLMP44/SuiteFit/assets/109778611/bf2001cf-d272-4bde-895e-3ed3120182e3)

![User Apartment Show Page bottom](https://github.com/RLMP44/SuiteFit/assets/109778611/acc610e6-16da-44a4-9001-3bceeebad22b)

Users can then easily access all of their bookmarked apartments. From here, they can message a real estate agent, view details, remove from their bookmarks, or check their fit.
![User Bookmarks Index Page](https://github.com/RLMP44/SuiteFit/assets/109778611/46200a22-4002-4bfa-98ba-31bec79d1d4a)

Items are automatically and accurately scaled when placed on the canvas, and the app uses collision detection to tell a user when they can't place an item.
This allows users to see if all of their furniture/stuff will actually fit, therefore telling them if an apartment is plausible or not.
![User Bookmarks Fitting Page collision](https://github.com/RLMP44/SuiteFit/assets/109778611/751142ad-49ca-495f-ae05-b22a1225daf1)

Users can then save their arrangement for later reference.
![User Bookmarks Fitting Page finished](https://github.com/RLMP44/SuiteFit/assets/109778611/fd95aa6e-a1fe-4d42-9ed7-83d687b03361)

Real estate agents can view all of their listed apartments and the engagement statistics for each.
![Agency Index Page](https://github.com/RLMP44/SuiteFit/assets/109778611/64608c1b-87c1-45e7-8344-eb143efc78c3)

Agents are also able to respond to requests from clients, but only once they've been contacted first.
![Agency Requests Page](https://github.com/RLMP44/SuiteFit/assets/109778611/d6808279-cb1f-4c15-a84a-f9bd0770c6e7)



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
MAPBOX_API_KEY=your_own-mapbox_key
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
