## Balanced Payments HipChat Notifier
A Sinatra service to receive webhook events from Balanced Payments and forward them as messages to a HipChat room

### Basic Installation
1. Install the app to a server of your choice.
2. Set environment variables for `HIPCHAT_API_KEY` and `HIPCHAT_ROOM_ID`
3. Create a webhook in your Balanced marketplace. You can do this in Dashboard > My Marketplace > Settings > Add a webhook

### Heroku Installation
1. [![Deploy](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy?template=https://github.com/faithstreet/Balanced-HipChat-Notifier)
2. Set the environment variables `heroku config:set HIPCHAT_API_KEY=youapikey HIPCHAT_ROOM_ID=roomid`
3. Create a webhook in your Balanced marketplace. You can do this in Dashboard > My Marketplace > Settings > Add a webhook

### Credits
Balanced HipChat Notifier is released under the [MIT License](http://www.opensource.org/licenses/MIT). It is maintained courtesy of [FaithStreet](http://www.faithstreet.com) by [Glenn Ericksen](https://twitter.com/glennericksen).
