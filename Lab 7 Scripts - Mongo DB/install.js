//lets require/import the mongodb native drivers.
var mongodb = require('mongodb');

//We need to work with "MongoClient" interface in order to connect to a mongodb server.
var MongoClient = mongodb.MongoClient;

// Connection URL. This is where your mongodb server is running.
var url = 'mongodb://localhost:27017/my_bakery';

// Use connect method to connect to the Server
MongoClient.connect(url, function (err, db) {
  if (err) {
    console.log('Unable to connect to the mongoDB server. Error:', err);
  } else {
    //HURRAY!! We are connected. :)
    console.log('Connection established to', url);

    // do some work here with the database.
    var collection = db.collection('employee');

	var user1 = {name: 'a', birthdate: '1/1/11', hiredate: '4/4/44', workdays: ['M'] , college_major: 'IT' };
    var user2 = {name: 'b', birthdate: '2/2/22', hiredate: '5/5/55', workdays: ['W'] , college_major: 'CS' };
    var user3 = {name: 'c', birthdate: '3/3/33', hiredate: '6/6/66', workdays: ['F'] , college_major: 'CS' };
 	var user4 = {name: 'd', birthdate: '1/1/11', hiredate: '4/4/44', workdays: ['M'] , college_major: 'IT' };
    var user5 = {name: 'e', birthdate: '2/2/22', hiredate: '5/5/55', workdays: ['W'] , college_major: 'IT' };
    var user6 = {name: 'f', birthdate: '3/3/33', hiredate: '6/6/66', workdays: ['F'] , college_major: 'CS' };
    var user7 = {name: 'g', birthdate: '3/3/33', hiredate: '6/6/66', workdays: ['F'] , college_major: 'CS' };


    // Insert some users
    collection.insert([user1, user2, user3, user4, user5, user6, user7], function (err, result) {
      if (err) {
        console.log(err);
      } else {
        console.log('Inserted %d documents into the "users" collection. The documents inserted with "_id" are:', result.length, result);
      }
      //Close connection
      db.close();
    });
  }
});