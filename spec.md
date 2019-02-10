# Specifications for the Sinatra Assessment

Specs:  
- [x] Use Sinatra to build the app
- [x] Use ActiveRecord for storing information in a database
  2 tables: User Table and Movie Table
- [x] Include more than one model class (e.g. User, Post, Category)
  2 models: User model and Movie model
- [x] Include at least one has_many relationship on your User model (e.g. User has_many Posts)
  User has many movies
- [x] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User)
  A movie belongs to a user
- [x] Include user accounts with unique login attribute (username or email)
  Users sign up with a username, email, and password.  Users log in to their list using their username and password.  
- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying
  Users can create a movie to add to their list, view the movies in their list, edit the movie information in their list, and delete a movie entry that is in their list.
- [x] Ensure that users can't modify content created by other users
  Users are shown their list only.  They can only modify/delete movies in their list.
- [x] Include user input validations
  @user.authenticate
- [ ] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new)
- [ ] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code

Confirm
- [x] You have a large number of small Git commits
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message
