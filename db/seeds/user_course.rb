# db/seeds/user_course.rb
users = User.all.to_a
courses = Course.all.to_a

users.each do |user|
  courses.sample(rand(1..3)).each do |course|
    UserCourse.find_or_create_by!(user_id: user.id, course_id: course.id)
  end
end