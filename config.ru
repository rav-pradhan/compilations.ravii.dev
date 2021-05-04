require './app'
require 'sassc'

run App

template = File.read('app/assets/scss/main.scss')

options = {
  style: :compressed,
  filename: 'main.scss',
  output_path: 'main.css',
  load_paths: [
      'app/assets/scss/core',
      'app/assets/scss/components',
      'app/assets/scss/primitives'
    ]
}

engine = SassC::Engine.new(template, options)

css = engine.render
File.write('public/stylesheets/main.css', css)
