namespace :app do
  
  desc "Ensures that the reset task only happens in development, 
        not the production environment"
  task ensure_development_environment: :environment do
    if Rails.env.production?
      raise "Rake tasks aborted - you are running a production environment.\n
      (You are requesting that the production database is dropped!)"
    end
  end
  
  desc "Resets database and populates with seed and development data"
  task :reset => %w[ ensure_development_environment db:drop 
                     db:create db:migrate db:seed app:populate ]
  
  # Articles
  desc "Populate the database with development data"
  task populate: :environment do
    [ { title: "Awesomeness comes as standard.",
        body: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, 
        sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. 
          Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris 
          nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in 
          reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla 
          pariatur. Excepteur sint occaecat cupidatat non proident, sunt in 
          culpa qui officia deserunt mollit anim id est laborum." 
          #,author_id: 1 
          },
      { title: "Here comes Vader!",
        body: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, 
        sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. 
        Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris 
        nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in 
        reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla 
        pariatur. Excepteur sint occaecat cupidatat non proident, sunt in 
        culpa qui officia deserunt mollit anim id est laborum."
        #,        author_id: 2 
      }
    ].each do |attributes|
      Article.find_or_create_by_title_and_body(attributes)
    end      
  end
  
  # Authors  
  task populate: :environment do
    [ { username: "admin",
        email: "admin@example.com" },
      { username: "jamie",
        email: "jamie@example.com" }
    ].each do |attributes|
      Author.find_or_create_by_username(attributes)
    end      
  end  
  
  # Comments  
  task populate: :environment do
    [ { 
        article_id:   1,
        author_name:  "Yoda",
        body:         "Yes. A Jedi's strength flows from the force.", 
      },
      { 
        article_id:   2,
        author_name:  "Luke",
        body:         "I'm not looking for a friend, I'm looking for a Jedi 
        master.", 
      },
      { 
        article_id:   1,
        author_name:  "Darth Vader",
        body:         "Search your feelings, Luke", 
      }
    ].each do |attributes|
      Comment.find_or_create_by_author_name(attributes)
    end
  end
end