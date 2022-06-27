// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
$("#participantsTable").DataTable()
    pagingType: 'full_numbers'

//= require jquery
//= require dataTables/jquery.dataTables