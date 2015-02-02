# Google allintitle scraper

## About this app

If you're into SEO you probably know how valuable the "allintitle" data from Google is. If you have no idea of what I'm talking about, nevermind... none of this will really make sense.

For the SEO lovers, this is a simple scraper that lets you use Nokogiri to extract the "all in title" results from Google. This scraper is built using Ruby on Rails.

You simply add keywords (individually or in bulk) and then run the scraper rake task to query Google for your result counts. The scraper now incudes a history of result counts (the TitleResult object, belongs to Keyword) that allows tracking of changes over time.

The tool keeps track of the changes as you go, and provides trendline data for keywords with over two scrapes. This can help identify terms that are becoming opportunities or are rapidly increasing in competitiveness. Ideally, you should be able to create and track a long list of terms over time to watch and anticipate competition around money terms.

At the current state of build, you should be able to run several thousand keywords through this without issue. Just need pagination/table-sort to make it easy to view!

## For users of the previous versions:

2014-12-29: Run '$ rake db:migrate' and then '$ rake db_update:update_keywords' to take existing keywords and create associate TitleResult objects in the DB. _Please back up your database before running this if you have info you don't want to lose!_

2015-01-11: Run '$ rake db:migrate' and then '$ rake db_update:add_counters' do add the counters to your keyword records.

## Getting your scraper ready:

### Local Copy

1. Download a local copy of this app
2. Run '$ bundle'
3. Run '$ rake db:migrate'
4. Boot up the app either '$ rails server' and navigate to http://localhost:3000/
5. Make individual new keywords or add them via the 'add multiple keywords' option (line separated)
6. Run '$ rake scraper:get_all'
7. Profit!

### Heroku

1. Git clone to a local repository
2. '$ heroku create [your app name here]'
3. '$ git push heroku master'
4. '$ heroku run rake db:migrate'
5. '$ heroku config:set USERNAME=[a username you want]'
6. '$ heroku config:set PASSWORD=[a password you want]'
7. Open the app at your-app-name.herokuapp.com and log in.
8. Navigate to your-app-name.herokuapp.com/keyword_sets/new and add your desired keywords (line separated)
9. '$ heroku addons:add scheduler:standard'
10. '$ heroku addons:open scheduler'
11. In the scheduler view, schedule a task for every day with the command 'rake scraper:get_all'
12. Wait about 5 minutes or so and the task will automatically run. You can also manually fire it with '$ heroku run rake scraper:get_all'

You can view the results in your browser and also can click the excel output method to get all the results in an easily pastable format.

## Notes:

* Google typically limits you to 100 queries per day per IP address. Go patronize your local coffee shop or use a VPN!
* You cannot scrape more than once every 24 hours. This is a limit set in the model which you can individually override (keyword.getallintitle(true) to override). This is in place so that your history doesn't get all hosed as you go.
* Apparently sometimes the allintitle count is wildly out of whack for some terms. This mucks with trendlines, so I'm investigating an algorithm that will allow me to discard results that are statistical outliers (or at least severely discount them)

## Todo:

* Add sorted tables
* Add Bing and other search engine scraping
