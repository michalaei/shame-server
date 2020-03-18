import express, {Application} from 'express';
import bodyParser from 'body-parser';
import {SystemsApi} from '../api/systems/systems.api';
import {DbConnector} from '../db/db-connector';
import {RealitiesApi} from '../api/realities/realities.api';
import {StatisticsApi} from '../api/statistics/statistics.api';
import {SocketsManager} from '../sockets-manager/sockets-manager';


export class Server {
    static app: Application;
    private static port = '8080';

    static init() {
        this.app = express();
        let server = this.listenOnPort(this.app);
        this.defineDefaultRoutes(this.app);
        DbConnector.init();
        SocketsManager.init(server);
        SystemsApi.init(this.app);
        RealitiesApi.init(this.app);
        StatisticsApi.init(this.app);
    }

    static listenOnPort(app: Application) {
        return app.listen(this.port, () => {
            // tslint:disable-next-line:no-console
            console.log(`server started at http://localhost:${Server.port}`);
        });
    }

    static defineDefaultRoutes(app: Application) {
        app.use((req, res, next) => {
            res.header('Access-Control-Allow-Origin', '*');
            res.header('Access-Control-Allow-Headers', 'Origin, X-Requested-With, Content-Type, Accept, reality');
            res.header('Access-Control-Allow-Methods', 'GET, POST, PUT, DELETE, OPTIONS');
            next();
        });
        app.use(bodyParser.json());
        app.use(bodyParser.urlencoded({extended: false}));
        app.get('/', (req, res) => {
            res.send('<h1>ShameFul Service is Up And Running</h1>');
        });
    }
}
