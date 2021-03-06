namespace :user_test do
  desc "user_test"
  task create_user: :environment do
    User.delete_all
    User.create(patient_code: "A0001" ,name: "Admin", email: "minhhuyho2011@gmail.com", birthday: "20/11/1994", gender: "male", password: "123456", role: "admin")
    (1..100).to_a.each do |index|
      User.create(patient_code: "D1234" + "#{index}" ,name: "Nguyen Van BS" + "#{index}", gender: :male, birthday: Date.today, email: "bs" + "#{index}" + "@gmail.com", password: "123456", role: :owner)
      User.create(patient_code: "P1234" + "#{index}" ,name: "Nguyen Van BN" + "#{index}", gender: :male, birthday: Date.today, email: "bn" + "#{index}" + "@gmail.com", password: "123456", role: :user_normal)
    end
  end
end
