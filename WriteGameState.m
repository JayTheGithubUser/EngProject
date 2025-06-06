function success = WriteGameState(dice, playerID, turnNumber, turnScore, accumulatedScore, event, rerollCount)
    channelID = 2981355;
    
    % This is available from https://thingspeak.com/account/profile
    userAPIKey = 'BOVH3LOEU1YE2CC2'; 
    
    % This code removes old data from the ThingSpeak channel
    % url = sprintf('https://api.thingspeak.com/channels/%s/feeds.json?api_key=%s', num2str(channelID), userAPIKey);
    % webwrite(url, weboptions('RequestMethod','delete'));

    % Insert your own API keys here
    % readKey = '90X7QDWKM2IQXQFR';
    writeKey = 'M1F5PQIKJ3UJIOZA';

    % STRUCTURE:
    % Field 1: turnNumber: Global Turn Number
    % Field 2: playerID: ID of the player completing the turn
    % Field 3: turnScore: Score in this turn
    % Field 4: accumulatedScore: Total Score up to that point
    % Field 5: event: Special Event that occurred in turn
    % Field 6: diceEncoded: Encoded Version of all dice values
    % Field 7: rerollCount: Times the player rerolled in that turn
    % Field 8: empty for now

    dice = string(dice);

    diceEncoded = char(strjoin(dice, ' '));

    values = {turnNumber, playerID, turnScore, accumulatedScore, event, diceEncoded, rerollCount};

    response = thingSpeakWrite(channelID, "WriteKey", writeKey, "Fields", [1, 2, 3, 4, 5, 6, 7],...
        "Values", values);

    response

    success = true;

end