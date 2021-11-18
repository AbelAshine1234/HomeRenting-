const mongoose = require('mongoose');

const messageSchema = new mongoose.Schema({
    senderName:{
        type:String,
        required:"senderName is required"
    },
    message:{
        type:String,
        required:"Message is required",
    },
    time:{
        type:Date,
        default:Date.now
    }
});
// * USER SCHEMA

const chatRoomSchema = new mongoose.Schema({
    user1Id:{
        type:String
    },
    user1Name:{
        type:String
    },
    user2Id:{
        type:String
    },
    user2Name:{
        type:String
    },
    messages:{
        type:[messageSchema]
    }
    
});



module.exports = mongoose.model('Chatroom', chatRoomSchema);