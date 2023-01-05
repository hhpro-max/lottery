const mongoose = require('mongoose');

const lotteryCardSchema = new mongoose.Schema({
    lotteryName:{
        type:String,
        trim:true,
        required:true
    },
    images:{
        type:Map,
        require:true
    },
    description:{
        type:String,
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
    }
});

const LotteryCard = new mongoose.model("LotteryCard",lotteryCardSchema);
module.exports={LotteryCard,lotteryCardSchema}