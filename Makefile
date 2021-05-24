format:
	bundle exec rbprettier --write '**/*.rb' '**/*.ru'

test:
	bundle exec rspec --format documentation

run-dev:
	rackup

generate-data:
	irb -r ./lib/generate_data.rb

sass-watch:
	sass --sourcemap=none --style compressed --watch assets/stylesheets/main.scss:public/stylesheets/main.css

sass-prod:
	sass --sourcemap=none --style compressed assets/stylesheets/main.scss:public/stylesheets/main.css

dev-watch:
	make -j 2 sass-watch run-dev