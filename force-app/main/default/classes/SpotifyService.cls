public class SpotifyService {
    public static String getArtistInfo(String artistId) {
        // Spotify API endpoint for artist info
        String endpoint = 'https://api.spotify.com/v1/artists/' + artistId;
        //You can also check different playlists and songs using this api URL
        
        // Get access token
        String accessToken = SpotifyAuthService.getSpotifyAccessToken();

        // Prepare HTTP request
        HttpRequest req = new HttpRequest();
        req.setEndpoint(endpoint);
        req.setMethod('GET');
        req.setHeader('Authorization', 'Bearer ' + accessToken);

        // Make HTTP request
        Http http = new Http();
        HttpResponse res = http.send(req);

        // Check the response
        if (res.getStatusCode() == 200) {
            return res.getBody(); // Return artist information
        } else {
            throw new CalloutException('Error in fetching artist info. Status Code: ' + res.getStatusCode());
        }
    }
}