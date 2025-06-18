# db/seeds/user.rb
User.find_or_create_by!(email: 'user1@example.com', name: 'User One') { |u| u.password = 'password1' }
User.find_or_create_by!(email: 'user2@example.com', name: 'User Two') { |u| u.password = 'password2' }
User.find_or_create_by!(email: 'user3@example.com', name: 'User Three') { |u| u.password = 'password3' }
User.find_or_create_by!(email: 'user4@example.com', name: 'User Four') { |u| u.password = 'password4' }
User.find_or_create_by!(email: 'user5@example.com', name: 'User Five') { |u| u.password = 'password5' }
User.find_or_create_by!(email: 'user6@example.com', name: 'User Six') { |u| u.password = 'password6' }
User.find_or_create_by!(email: 'user7@example.com', name: 'User Seven') { |u| u.password = 'password7' }
User.find_or_create_by!(email: 'user8@example.com', name: 'User Eight') { |u| u.password = 'password8' }
User.find_or_create_by!(email: 'user9@example.com', name: 'User Nine') { |u| u.password = 'password9' }
User.find_or_create_by!(email: 'user10@example.com', name: 'User Ten') { |u| u.password = 'password10' }