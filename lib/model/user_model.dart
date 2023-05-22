class User {
   int id;
   String name,email;

  User.fromJson(dynamic json){
    id = json['id'];
    name = json['name'];
  }
  
}

//  "user": {
//         "id": 1,
//         "role_id": "1",
//         "name": "Wave Admin",
//         "email": "admin@admin.com",
//         "avatar": "https://etrading.360websitedemo.com/storage/avatars/admin.png",
//         "email_verified_at": null,
//         "settings": {
//             "locale": null
//         },