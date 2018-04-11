// npm install moment mongodb 
var MongoClient = require('mongodb').MongoClient;
var assert = require('assert');
var moment = require('moment');

// Connection URL
var url = 'mongodb://localhost:27017/bakery_partb';
// // Use connect method to connect to the Server
MongoClient.connect(url, function(err, db) {


	assert.equal(null, err);
	console.log("Connected correctly to server");

	db.dropDatabase( function() { 
		// Create a collection
		var collection = db.collection('employees');

		// Create a lot of documents to insert
		var docs = [];
		for(var i = 0; i < 7; i++) {
			docs.push({'name': "John Clark", birthdate: new Date('Jan 5, 1990'), hiredate: new Date(), workdays: [ 'M', 'W', 'F' ], manager: 0 });
		}

		// Insert documents into collection
		collection.insertMany(docs, {w:1}, function(err, ids) {
			// Peform a find to get a cursor
			var cursor = collection.find();

			var update_started = 0;
			var update_finished = 0;
			var done = false;
			cursor.each( function( err, item ) {
				if( item == null )
				{
					done = true;
					if( update_started == update_finished )
						db.close();
				}
				else
				{
					update_started += 1;
					// update birthdate here using moment
					 var newdate = moment(item.birthdate).subtract(10, 'years').toDate();

					collection.update( { "_id": item._id }, {$set:{"birthdate": newdate}} , function(err, updated) {
						if(err) throw err;
						console.dir("Updated Doc" + item._id);
						update_finished += 1;
						if( done ) 
						{
							if( update_started == update_finished ) db.close();
						}
					});
					//console.log( item );
				}
			});
		});
	});
});