
const express = require('express');
const chefserve = express();
const morgan = require('morgan');
const mysql = require('mysql');
const cors = require('cors');
const bodyParser = require('body-parser');

chefserve.use(bodyParser.urlencoded({extended: false}));
chefserve.use(express.static('./temp'));
chefserve.use(cors());
chefserve.use(morgan('short'));

function getconnection(){
    return mysql.createConnection({
        host:'localhost',
        user:'root',
        database:'mypersonalchef',
        password:'AbhI'
    });
}

//working
// get all users in mysql
chefserve.get("/mysqlusers", (req,res)=>{
    console.log('connectiong to database');
    const selectAll = "select * from users";
    getconnection().query(selectAll,(err,rows)=>{
        console.log(" fetched users ");
        // res.send('hello');
        res.json(rows);
        console.log(''+JSON.stringify(rows));
        console.log("" +rows.length);
    });
});


//working
// start only admin
//redirecting admin
chefserve.post("/admin",(req,res)=>{
    res.redirect('/adminlogin.html');
});

chefserve.post("/alogin",(req,res)=>{
    const an = req.body.aname;
    const ap = req.body.apass;
    if(an === "Admin"  && ap === "Admin")
    res.redirect('/admin.html');
    else {
        res.sendStatus(401);
    }
});

chefserve.post("/user_del",(req, res) =>{
    const del = req.body.d_id;
    console.log('working'+del);
    const deleteUser ="Delete from users where user_id = ?";
    getconnection().query(deleteUser,[del],(err ,results, fields)=>{
        if(err){
            console.log("failed to delete user with id: " +del +", error: " +del);
            res.sendStatus(500);
            return;
        }
        console.log("user deleted successfully with id : " +del);
        res.send("user deleted successfully with id : " +results.insertId);
        res.end();
    });
});


//end of only admin



//working
//start only user
chefserve.post("/user",(req,res)=>{
    res.redirect('/userlogin.html');
});

chefserve.post("/usignup",(req,res)=>{
    const fname = req.body.fname;
    const lname = req.body.lname;
    const upass = req.body.upass;
    const uemail = req.body.uemail;
    const uno = req.body.uno;
    const ustreet1 = req.body.ustreet1;
    const ustreet2 = req.body.ustreet2;
    const ucity = req.body.ucity;
    const ustate = req.body.ustate;
    const uzip = req.body.uzip;
    const insertuser = "insert into users(first_name,last_name,pswd,email_id,mobile_no,street1,street2,city,state,zipcode) values " +
        "( ?,?,?,?,?,?,?,?,?,?)";
    getconnection().query(insertuser,[fname,lname,upass,uemail,uno,ustreet1,ustreet2,ucity,ustate,uzip],(err,results,fields)=>{
        if(err){
            console.log('error'+err);
            res.send(err);
            return;
        }
        console.log('user created successfully'+results.insertId);
        // res.redirect('userlogin');
        res.send('user created successfully with id : '+results.insertId);
        // res.end();
    });
});


chefserve.post("/ulogin",(req,res)=>{
    const ulname = req.body.ulname;
    const ulpass = req.body.ulpass;
    const selectuser = 'select * from users where first_name = ? and pswd = ?';
    getconnection().query(selectuser,[ulname,ulpass],(err,results,fields) =>{
        if(err){
            console.log('failed' +err);
            res.send("wrong credentials");
            // return;
        }
        if(results.length === 1)
        {
            res.write('welcome : '+ulname);
            // res.json(results);
            console.log(results.length +"Logged in as : " +results.insertId );
            res.end();
        }else{
            res.send('credential error');
        }
    });
});





//end only user

// testing
// start recipe api
chefserve.get("/recipes", (req,res)=>{
    console.log('connectiong to database');
    const selectAll = "select * from recipes";
    getconnection().query(selectAll,(err,rows)=>{
        console.log(" fetched recipes ");
        res.json(rows);
        console.log(''+JSON.stringify(rows));
        console.log("" +rows.length);
    });
});

chefserve.get("/ingredients", (req,res)=>{
    console.log('connectiong to database');
    const selectAll = "select * from ingredients";
    getconnection().query(selectAll,(err,rows)=>{
        console.log(" fetched ingredients ");
        res.json(rows);
        console.log(''+JSON.stringify(rows));
        console.log("" +rows.length);
    });
});
// end recipe api


//working
chefserve.get('/', (req,res)=>{
    console.log("responding to root route");
    res.send("Hello form root")
});

//working
chefserve.listen(3000 ,()=>{
    console.log('server is up and listening to 3333...')
});
