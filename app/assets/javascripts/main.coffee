# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
window.snack = (options)->
	document.querySelector("#global-snackbar")
		.MaterialSnackbar.showSnackbar(options)

window.loading = false

$(document).on "turbolinks:load page:fetch ready", ()->
	componentHandler.upgradeDom();
	$(".mdl-layout").scroll ->
		if !window.loading && $(".mdl-layout").scrollTop() > $(document).height() - 200
			window.loading = true
			url = $(".next_page").attr("href")
			$.getScript url if url
			console.log("cargando...")
