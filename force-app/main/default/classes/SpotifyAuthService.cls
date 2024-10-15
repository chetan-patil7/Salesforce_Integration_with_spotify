public class SpotifyAuthService { 
    @AuraEnabled(cacheable=true)
    public static String getSpotifyAccessToken() {
        // Spotify OAuth token URL
        String tokenUrl = 'https://accounts.spotify.com/api/token';
        
        // Client ID and Client Secret from Spotify Developer Dashboard
        String clientId = 'Client_ID';
        String clientSecret = 'Client_Secret_Id';
        
        // Base64 encode clientId:clientSecret
        String authHeader = 'Basic ' + EncodingUtil.base64Encode(Blob.valueOf(clientId + ':' + clientSecret));

        // Prepare HTTP request
        HttpRequest req = new HttpRequest();
        req.setEndpoint(tokenUrl);
        req.setMethod('POST');
        req.setHeader('Authorization', authHeader);
        req.setHeader('Content-Type', 'application/x-www-form-urlencoded');
        req.setBody('grant_type=client_credentials');

        // Make HTTP request
        Http http = new Http();
        HttpResponse res = http.send(req);

        // Check the response
        if (res.getStatusCode() == 200) {
            // Parse JSON response and return access token
            Map<String, Object> result = (Map<String, Object>) JSON.deserializeUntyped(res.getBody());
            return (String) result.get('access_token');
        } else {
            throw new CalloutException('Error in getting Spotify Access Token. Status Code: ' + res.getStatusCode());
        }
    }
}