
class Contact {
    String name;
    String email;

    Contact({this.name,this.email});

     Contact.fromJson(Map<String, dynamic>json): 
       name = json['name'],
       email = json['email'];
}
