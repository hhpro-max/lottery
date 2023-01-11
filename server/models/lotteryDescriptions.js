const mongoose = require('mongoose');

const lotteryDescriptionsSchema = new mongoose.Schema({
    main:{
        type:String,
        trim:true,
        required:true
    },
    info:{
        type:String,
        trim:true,
        required:true
    },
    how:{
        type:String,
        trim:true,
        required:true
    },
    moreInfo:{
        type:String,
        trim:true,
        required:true
    },
    rules:{
        type:Object,
        required:true
    },
    explanation:{
        type:String,
        trim:true,
        required:true
    },
    drawDate:{
        type:String,
        trim:true,
        required:true
    },
    finishTime:{
        type:String,
        trim:true,
        required:true
    }

});

module.exports=lotteryDescriptionsSchema;