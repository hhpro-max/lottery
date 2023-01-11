const {Router} = require('express');
const connectionRouter = Router();

connectionRouter.get('/check',(req,res)=>{
    req.log.info("user is checking connection")
    res.json({msg:"you are connected!"});
});

module.exports=connectionRouter;