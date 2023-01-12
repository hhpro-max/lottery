const mongoose = require('mongoose');


const slipSchema = new mongoose.Schema(
    {
        lotteryId:{
            type:String,
            required:true,
        },
        userId:{
            type:String,
            required:true
        },
        numbers:[[{
            type:Number,
            required:true
        }]],
    }
);

const Slip = new mongoose.model('Slip',slipSchema);

module.exports = Slip;