const path = require('path');
const pino = require('pino-http');


module.exports = pino(
    {
        transport:{
            target:"pino-pretty",
            options:{
                destination:path.join(__dirname,'info.log'),
                all:true,
                colorize:false,
                levelFirst:true,
                translateTime: "yyyy-dd-mm, h:MM:ss TT"
            }
        }
    }
);