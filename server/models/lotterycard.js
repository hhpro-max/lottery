const mongoose = require('mongoose');
const lotteryDescriptionsSchema = require('./lotteryDescriptions');
const lotteryImageSchema = require('./lotteryImages');

const lotteryCardSchema = new mongoose.Schema({
    lotteryName:{
        type:String,
        trim:true,
        required:true
    },
    images:lotteryImageSchema,
    descriptions:lotteryDescriptionsSchema,
    rules:{
        type:Object,
        trim:true,
        required:true
    },
    numberCount:{
        type:Number,
        required:true
    },
    price:{
        type:Number,
        required:true
    },
    jackPot:{
        type:Number,
        required:true,
    },
    isMain:{
        type:Number,
        required:true
    },
    numberRange:{
        type:Number,
        required:true
    }
});

const LotteryCard = new mongoose.model("LotteryCard",lotteryCardSchema);
module.exports={LotteryCard,lotteryCardSchema}