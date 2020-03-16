import {Application, Request, Response} from "express";
import {DbConnector} from "../../db/db-connector";

export class SystemsApi {
    static init(app: Application) {
        app.post('/systems', SystemsApi.getSystems);
        app.post('/systems/message', SystemsApi.systems);
    }

    static async getSystems(req: Request, res: Response) {
        let result = await DbConnector.query('SELECT * FROM public.servers');
        let reality = req.headers.reality;
        console.log('Incoming request - Get All systems, Reality:', reality);
        res.send(result.rows);
    }

    static async systems(req: Request, res: Response) {
        let data = req.body.data;
        console.log(`Incoming request - with payload: ${data}`);
        res.send(JSON.stringify({data: 'hello'}));
    }
}
