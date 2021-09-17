const express = require("express");
const bodyParser = require("body-parser");
const ejs = require("ejs");
const mongoose = require("mongoose");
const app = express();
app.set('view engine', 'ejs');
app.use(bodyParser.urlencoded({extended: true}));
app.use(express.static("public"));
mongoose.connect("mongodb://localhost:27017/bookDB", {useNewUrlParser:true,  useUnifiedTopology: true});
const bookSchema = {

  title:String,
  content:String,
  isItAvailable:Boolean,
  rating:Number,



};
const Book = mongoose.model("Book", bookSchema);
//////// Request targeting all articles/////////////////
app.get("/books",function(req,res){
  Book.find(function(err,results){
    if (!err){
      res.send(results);

    }
    else {
      res.send(err);
    }
    console.log(results);

  })
});
app.post("/books",function(req,res){
  console.log(req.body.title);
  console.log(req.body.content);
  console.log(req.body.rating);
  console.log(req.body.isItAvailable);
  const newBook = new Book({
    title:req.body.title,
    content:req.body.content,
    rating:req.body.rating,
    isItAvailable:true
  });
  newBook.save(function(err){
    if (!err){
      res.send("Successfully added the new Book");
    }
    else {
      res.send(err);
      console.log(err);
    }

  });
});
/////Request for Getting specific articles////////////
app.get("/books/:bookTitle",function(req,res){
  Article.findOne({title:req.params.bookTitle},function(err,results){
    if (!err){
      res.send(results);
      console.log(results);
    }
    else {
      res.send(err);
      console.log(err);
    }

  });
});
/// Request for deleting a specific article ////
app.delete("/books/:bookTitle",function(req,res){
  Book.deleteOne({title:req.params.bookTitle},function(err){
    if (!err){
      res.send("Successfully deleted the specific article");
    }
    else {
      console.log(err);
      res.send(err);
    }
  });
});



app.listen(3000,function(){
  console.log("The server is running on port 3000");
});