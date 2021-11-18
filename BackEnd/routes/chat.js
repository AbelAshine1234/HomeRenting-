const router = require('express').Router()
const User = require('../model/User');
const Message = require('../model/Message');
const Chatroom = require('../model/Chatroom');

const verify = require('../verifyToken')


router.post('/createChat',verify,async (req,res)=>{
    console.log("create called");

    const user1 = await User.findOne({ _id: req.user._id });
    if(!user1) return res.status(404).send("User not Found");
    console.log(user1);

    const user2 = await User.findOne({ _id: req.body.user2Id});
    if(!user2) return res.status(404).send("User not Found");
    console.log(user2);
    // * Create a new user
    const chatRoom = new Chatroom({
        user1Id: user1._id,
        user2Id: user2._id,
        user1Name: user1.name,
        user2Name: user2.name,
    });
    try {
        const char = await chatRoom.save();
        var query = await User.findByIdAndUpdate(user1._id,
            { "$push": { "mychats": chatRoom._id} }
        );
        var query2 = await User.findByIdAndUpdate(user2._id,
            { "$push": { "mychats": chatRoom._id} }
        );
        res.status(201).send({ chatRoom: chatRoom._id });
        console.log("Room created");
    } catch (err) {
        res.status(400).send(err);
        console.log(err); 

    }
});

router.get('/loadChats',verify,async(req,res)=>{
    console.log("Load called");
    const chats = await Chatroom.find({$or:[{user1Id: req.user._id},{user2Id:req.user._id}]});
    console.log(chats);
    res.send(chats);

});


router.get('/loadMessages/:id',verify,async(req,res)=>{
    console.log("LoadMessages");
    console.log(req.params.id);
    const chat = await Chatroom.findById(req.params.id);
    console.log(chat.messages);
    res.send(chat.messages);

});


router.put('/sendMessage',verify,async(req,res)=>{

    console.log(req.body.chatId);
    const user = await User.findOne({ _id: req.user._id });
    if(!user) return res.status(404).send("User not Found");
    
    const chat = await Chatroom.findOne({_id:req.body.chatId});
    var message = new Message({
        senderName : user.name,
        message: req.body.message
    });
    var query = await Chatroom.findByIdAndUpdate(chat._id,
        { "$push": { "messages": message}});
    console.log(query);
    res.status(201).send(chat);

});




module.exports = router;