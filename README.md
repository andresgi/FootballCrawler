# FootballCrawler | SoccerCrawler
<b>Web Scraping | Information Retrieval for http://el.soccerway.com</b>

Stores matches results and goals (minute, player's name, team, own goals, penalty goals, player assist) for more than 100 leagues.

- It uses a MySQL Database for storing data (pending upload).

---------------------------------------------------------------------------------------------------------------------------------

For modifying the dates, currently you have to alter this lines:
- <code>HtmlPage page = webClient.getPage("http://el.soccerway.com/matches/2015/04/04/");</code>
- <code>url = "http://el.soccerway.com/a/block_date_matches?block_id=page_matches_1_block_date_matches_1&callback_params=%7B%22bookmaker_urls%22%3A%7B%2213%22%3A%5B%7B%22link%22%3A%22http%3A%2F%2Fwww.bet365.com%2Fhome%2F%3Faffiliate%3D365_308136%22%2C%22name%22%3A%22Bet%20365%22%7D%5D%7D%2C%22block_service_id%22%3A%22matches_index_block_datematches%22%2C%22date%22%3A%222015-04-04%22%2C%22stage-value%22%3A%2239%22%7D&action=showMatches&params=%7B%22competition_id%22%3A" + idLeague + "%7D";</code>
