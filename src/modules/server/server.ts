import express, {Application} from "express";
import bodyParser from 'body-parser';
import {SystemsApi} from "../api/systems/systems.api";
import {DbConnector} from "../db/db-connector";
import {RealitiesApi} from "../api/realities/realities.api";

export class Server {
    static app: Application;
    private static port = '8080';

    static init() {
        this.app = express();
        this.listenOnPort();
        this.defineDefaultRoutes(this.app);
        DbConnector.init();
        SystemsApi.init(this.app);
        RealitiesApi.init(this.app);
        return this.app;
    }

    static listenOnPort() {
        this.app.listen(this.port, () => {
            // tslint:disable-next-line:no-console
            console.log(`server started at http://localhost:${Server.port}`);
        });
    }

    static defineDefaultRoutes(app: Application) {
        app.use((req, res, next) => {
            res.header("Access-Control-Allow-Origin", "*"); // update to match the domain you will make the request from
            res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept, Reality");
            res.header("Access-Control-Allow-Methods", "GET, POST, PUT, DELETE, OPTIONS");
            next();
        });
        app.use(bodyParser.json());
        app.use(bodyParser.urlencoded({extended: false}));
        app.get("/", (req, res) => {
            res.send("Hello worldddd!");
        });
    }
}
