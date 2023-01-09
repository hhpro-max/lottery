const { Router } = require('express');
const lotteryRoute = Router();
const {LotteryCard} = require('../models/lotterycard');

lotteryRoute.get('/lotteries', async (req, res) => {
    try {
        let allLotteries = await LotteryCard.find();
        res.json(allLotteries);
        //loging
        req.log.info("request to get lotteries infos" + "\n" + allLotteries);
        //
    } catch (e) {
        res.status(500).json({ err: e.message });
        //loging
        req.log.fatal("request to get main lottery infos" + "\n" + allLotteries);
        console.log(e.message);
        console.log(e);
        //
    }
});

module.exports = lotteryRoute;

