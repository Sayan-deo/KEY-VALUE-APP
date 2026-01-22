const keyvalueDB=process.env.KEY_VALUE_DB;
const keyvalueuser=process.env.KEY_VALUE_USER;
const keyvaluepassword=process.env.KEY_VALUE_PASSWORD;

db=db.getSiblingDB(keyvalueDB);

db.createUser(
	{
	    user:keyvalueuser,
	    pwd:keyvaluepassword,
	    roles:[{
		    role:'readWrite',
		    db: keyvalueDB
		  }]
	}
)
