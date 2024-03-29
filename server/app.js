// import from packages 
const express = require('express');
const mongoose = require('mongoose');
const path = require('path');
const dotEnv = require('dotenv');
//import from local files
const logger = require('./logs/logger');
const authRoute = require('./routes/auth');
const lotteryRoute = require('./routes/lottery');
const connectionRouter = require("./routes/connection");
const paymentRouter = require('./routes/payment');
// loading configs
dotEnv.config(
    {
        path:path.join(__dirname,'configs/config.env')
    }
);
// init
const port = process.env.PORT || 3050;
const app = express();
const dbURL = process.env.MONGO_URI;
// express middle wares 
app.use(express.json());
app.use(logger);
//routes
app.use('/auth',authRoute);
app.use('/lottery',lotteryRoute);
app.use('/connection',connectionRouter);
app.use('/payment',paymentRouter);
//starting server
setTimeout(
    ()=>{
        mongoose.connect(dbURL).then(
            ()=>{
                console.log("!CONNECTED_TO_DATABASE!");
                
            }
        ).catch((e)=>{
            console.log(e);
        });
        app.listen(port,()=>{
            console.log(`!SERVER_IS_RUNNING_ON_PROT_${port}!`);
        });
    }
);