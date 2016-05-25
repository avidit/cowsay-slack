# cowsay-slack

![moo](http://goo.gl/swrbwK)

Post `cowsay` messages in slack.
```
 ______ 
< Moo! >
 ------ 
   \
    \
        .--.
       |o_o |
       |:_/ |
      //   \ \
     (|     | )
    /'\_   _/`\
    \___)=(___/
```
## Running Locally

Make sure you have [Ruby](https://www.ruby-lang.org/) and the [Heroku Toolbelt](https://toolbelt.heroku.com/) installed.

```sh
git clone git@github.com:avidit/cowsay-slack.git
cd cowsay-slack
bundle install
```
Edit env.example with your environment variables and save it as .env

run `heroku local`

Your app should now be running on [localhost:5000](http://localhost:5000/).

## Deploying to Heroku

```
heroku create
git push heroku master
heroku open
```

Alternatively, [![Deploy to Heroku](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy)
