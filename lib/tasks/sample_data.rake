namespace :db do
  desc 'Drop, create, migrate, seed and populate sample data'
  task prepare: [:drop, :create, "schema:load", :seed, :populate_sample_data] do
    puts 'Ready to go!'
  end

  desc 'Populates the database with sample data'
  task populate_sample_data: :environment do
    Todo.create!(title: "Test", priority: 1, description: "Test")
    Todo.create!(title: "Test", priority: 1, description: "Test")
    Todo.create!(title: "Test2", priority: 2, description: "Test2")
    Todo.create!(title: "Test2", priority: 2, description: "Test2")
    Todo.create!(title: "Test3", priority: 3, description: "Test3")
    Todo.create!(title: "Test3", priority: 3, description: "Test3")
  end
end
