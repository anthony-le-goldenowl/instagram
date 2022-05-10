
//= require jquery
//= require popper
//= require turbolinks
//= require bootstrap
//= require_tree.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

import Rails from '@rails/ujs'
import Turbolinks from 'turbolinks'
import * as ActiveStorage from '@rails/activestorage'
import 'channels'
import * as bootstrap from 'bootstrap'
import "@fortawesome/fontawesome-free/js/all";
import "@hotwired/turbo-rails"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

const images = require.context('../images', true);
const imagePath = (name) => images(name, true);


window.addEventListener('turbolinks:load', () => {
  var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
  var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
    return new bootstrap.Tooltip(tooltipTriggerEl)
  })
})