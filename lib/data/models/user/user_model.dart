class UserModel {
	String? fullName;
	String? email;
	String? password;
	String? phoneNumber;
	String? address;
	String? city;
	String? state;
	String? profileProgress;
	String? sId;
	String? id;
	String? createdOn;
	String? updatedon;
	int? iV;

	UserModel({this.fullName, this.email, this.password, this.phoneNumber, this.address, this.city, this.state, this.profileProgress, this.sId, this.id, this.createdOn, this.updatedon, this.iV});

	UserModel.fromJson(Map<String, dynamic> json) {
		fullName = json['fullName'];
		email = json['email'];
		password = json['password'];
		phoneNumber = json['phoneNumber'];
		address = json['address'];
		city = json['city'];
		state = json['state'];
		profileProgress = json['profileProgress'];
		sId = json['_id'];
		id = json['id'];
		createdOn = json['createdOn'];
		updatedon = json['updatedon'];
		iV = json['__v'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['fullName'] = this.fullName;
		data['email'] = this.email;
		data['password'] = this.password;
		data['phoneNumber'] = this.phoneNumber;
		data['address'] = this.address;
		data['city'] = this.city;
		data['state'] = this.state;
		data['profileProgress'] = this.profileProgress;
		data['_id'] = this.sId;
		data['id'] = this.id;
		data['createdOn'] = this.createdOn;
		data['updatedon'] = this.updatedon;
		data['__v'] = this.iV;
		return data;
	}
}
