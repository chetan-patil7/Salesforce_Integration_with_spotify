import { LightningElement, wire } from 'lwc';
import getArtistInfo from '@salesforce/apex/SpotifyService.getArtistInfo';

export default class SpotifyArtist extends LightningElement {
    artistId = '';  // Artist ID entered by the user
    artistInfo = '';
    error;

    handleInputChange(event) {
        this.artistId = event.target.value;
    }

    handleGetArtistInfo() {
        // Call the Apex method to get artist info
        getArtistInfo({ artistId: this.artistId })
            .then((result) => {
                this.artistInfo = result;  // Store the artist info
                this.error = undefined;
            })
            .catch((error) => {
                this.error = error;
                this.artistInfo = undefined;
            });
    }
}
