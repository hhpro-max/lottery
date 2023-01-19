const {Router} = require('express');
const paymentRouter = Router();
const mongoose = require('mongoose');
const coinGateSDK = require('api')('@coingate/v2#b8gd3olbgkvfrv');
paymentRouter.get('/sandbox',(req,res,next)=>{
    
    coinGateSDK.createOrder({
        order_id: 'testUniqId12231',
        price_amount: 10,
        price_currency: 'USD',
        receive_currency: 'DO_NOT_CONVERT',
        title: 'thisIsTestForMyApiSetting',
        description: 'this is test description about my api',
        callback_url: 'https://mylototest.requestcatcher.com/',
        cancel_url: 'https://mylototest.requestcatcher.com/',
        success_url: 'https://mylototest.requestcatcher.com/',
        token: process.env.COINGATE_AUTH_TOKEN,
        purchaser_email: 'btcethzcoin@gmail.com'
      }, {accept: 'application/json'})
        .then(({ data }) => console.log(data))
        .catch(err => console.error(err));
     res.json({msg:'tested'});   
});
paymentRouter.get('/cancel',(req,res)=>{
    console.log('canceld');
    res.json({msg:"canceled"});
});
paymentRouter.get('/success',(req,res)=>{
    console.log('success');
    res.json({msg:"success"});
});

module.exports = paymentRouter;