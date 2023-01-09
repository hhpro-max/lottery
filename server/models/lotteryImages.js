const mongoose = require('mongoose');

const lotteryImageSchema=new mongoose.Schema({
    mianColor:{
        type:String,
        trim:true,
        required:true
    },
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
    inPage:{
        type:String,
        trim:true,
        required:true
    }
});

module.exports = lotteryImageSchema;