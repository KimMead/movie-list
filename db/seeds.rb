Kim = User.create(username: "Kim", email: "kimmeadows8@gmail.com", password: "password")
Karen = User.create(username: "Karen", email: "karen@gmail.com", password: "password")

Movie.create(title: "John Wick 3", user_id: Kim.id, release_date: "May 17 2019")
