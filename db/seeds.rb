puts " seed start"


User.destroy_all

User.create(username: "mikemike", password: "Mikemike1",email: "mike@gmail.com", name:"mike", photo:"https://scontent-lga3-1.xx.fbcdn.net/v/t31.0-1/p160x160/18673216_105764850018246_2172646986244779676_o.jpg?_nc_cat=102&_nc_oc=AQkoP9wiabA3aFv4gLxC__GhklzX3MaK4ugnjdOF3dcziH2adJqdF2bZEeDDkDudnJo&_nc_ht=scontent-lga3-1.xx&oh=a64fe2592f22f9056507e447137b8a40&oe=5E564E2F", age: 28, dob: "07/09/1991", city_state:"Bronx, Ny", about_me: "cat and anime lover.", sex: "male", active: false)
User.create(username: "ashley", password: "Ashley1", email:"ashley@gmail.com", name:"ahley", photo:"https://unsplash.com/photos/yRJpeID7AKE" ,age: 25, dob: "07/09/1991", city_state:"Bronx, Ny", about_me: "I like long walks on the beach.", sex: "female", active: false)
User.create(username: "alexa", password: "Alexa1", email:"alexa@gmail.com", name:"alexa" ,photo:"https://images.unsplash.com/photo-1512310604669-443f26c35f52?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=675&q=80", age: 24, dob: "07/09/1991", city_state:"Queens, Ny", about_me: "I love sweating in the gym.", sex: "female", active: false)
User.create(username: "Angel", password: "Angel1", email:"angel@gmail.com", name:"angel" ,photo:"https://images.unsplash.com/photo-1542053254535-def95e944232?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80" ,age: 23, dob: "07/09/1991", city_state:"Harlem, Ny", about_me: "making music is my passion.", sex: "male", active: false)
User.create(username: "justine", password: "Justine1", email:"justine@gmail.com", name:"justine", photo:"https://images.unsplash.com/photo-1565294124524-200bb738cdb7?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1588&q=80", age: 26, dob: "07/09/1991", city_state:"Brooklyn, Ny", about_me: "i would like to travel the world.", sex: "female", active: false)





puts " it has been seeded "


