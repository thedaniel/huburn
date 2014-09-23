# Description:
#   Find out how long until the man burns. Optionally update topic.

$ = require('cheerio')
request = require('request')

fetchBurn = (cb) ->
  request 'http://www.burningman.com/index/popcount.html', (err, resp, html) ->
    if err
      console.error err

    parsed = $.load(html)
    burnText = parsed('#countdown1').text()
    burnDate = new Date(Date.parse(burnText))
    millis = burnDate - Date.now()
    days = Math.floor(millis/(1000*60*60*24))
    cb(err, "The man burns in #{days} days, on #{burnText}")

module.exports = (robot) ->
  robot.hear /when does the man burn|how (long|many days) until the man burns/, (msg) ->
    fetchBurn (err, burnText) ->
      msg.send burnText
