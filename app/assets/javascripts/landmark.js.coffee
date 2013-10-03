# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
	console.log "Yo, index loaded!"

	map = {}

	displayNearby = (objs) ->
		console.log "found nearby #{objs.length} on map #{map}"
		console.log map
		markers = objs.map (mark) ->
			#console.log mark
			options = 
				position: new google.maps.LatLng(mark.latitude, mark.longitude)
				map: map
			return new google.maps.Marker(options)

		console.log "done looping. made #{markers.length} markers"

	getNearby = (pos) ->
		console.log "lat = #{pos.coords.latitude}, lon = #{pos.coords.longitude}"
		map.setCenter(new google.maps.LatLng(pos.coords.latitude, pos.coords.longitude))
		# ajax it up
		data = lat: pos.coords.latitude, lon: pos.coords.longitude
		$.get("http://localhost:3000/landmark/within", data).done(displayNearby)

	# make a new map
	initialize = () ->
        mapOptions = {
          zoom: 13,
          mapTypeId: google.maps.MapTypeId.ROADMAP
        }
        map = new google.maps.Map(document.getElementById("map-canvas"),
            mapOptions);

        console.log "initailized"

        navigator.geolocation.getCurrentPosition(getNearby);

 	google.maps.event.addDomListener(window, 'load', initialize);