// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import "bootstrap"
import "../stylesheets/application"
import * as Routes from '../routes';

window.Routes = Routes;

Rails.start()
Turbolinks.start()
ActiveStorage.start()

const $ = require('jquery')

function like() {
  var videoID = $('#videoId').val();
  var typeLike = $(this).attr('type')

  likeVideo(videoID, typeLike)
    .done((data) => {
      $('.like-section').html(data['like_block'])
    }).fail((data)=> {
      window.location.href = '/signin'
    });
}

function likeVideo(videoID, typeLike) {
  return $.post(Routes.likes_path({ id: videoID }), { id: videoID, type: typeLike, _method: 'post' })
}

$(function () {
  $(document).delegate(".js-like", "click", like);
})

