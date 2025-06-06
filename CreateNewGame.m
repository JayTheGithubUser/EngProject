function success = CreateNewGame()
    
    channelID = 2981355;
    userAPIKey = 'BOVH3LOEU1YE2CC2'; 

    url = sprintf('https://api.thingspeak.com/channels/%s/feeds.json?api_key=%s', num2str(channelID), userAPIKey);
    webwrite(url, weboptions('RequestMethod','delete'));

end