# Description:
#   Find out how long until the man burns. Optionally update topic.

$ = require('cheerio')
request = require('request')

module.exports = (robot) ->
  robot.hear /when does the man burn|how (long|many days) until the man burns|when the man burns/, (msg) ->
    # This used to fetch a page from burningman.com but it went away so.. let's be cheesy
    burnDate = new Date(Date.UTC(2015,8,6,4))
    millis = burnDate - Date.now()
    days = Math.floor(millis/(1000*60*60*24))

    msg.send "The man burns in #{days} days, on #{burnDate.toDateString()}"
