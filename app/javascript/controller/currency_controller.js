
import { Controller } from "stimulus"
import consumer from '../channels/consumer';

export default class extends Controller {
    static targets = ['bookstatus']

    connect() {
        console.log("connect");

        this.channel = consumer.subscriptions.create({ channel: 'CurrencyChannel'}, {
            connected: this._cableConnected.bind(this),
            disconnected: this._cableDisconnected.bind(this),
            received: this._cableReceived.bind(this),
          });
    }

    _cableConnected() {
        console.log('_cableConnected');
    }

    _cableDisconnected() {
        console.log('_cableDisconnected');
    }

    _cableReceived(data) {
        console.log('_cableReceived');
        console.log(data);

    }
}