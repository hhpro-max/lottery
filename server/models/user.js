
const mongoose = require('mongoose');
const {lotteryCardSchema} = require('./lotterycard')


const userSchema =new mongoose.Schema(
    {
        userName:{
            type:String,
            required:true,
            trim:true
        },
        email:{
            type:String,
            required:true,
            trim:true
        },
        password:{
            type:String,
            required:true,
            trim:true
        },
        cart:[lotteryCardSchema]
    }
);

const User = new mongoose.model('User',userSchema);
module.exports = User;