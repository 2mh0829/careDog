<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>
<style>
.page-tit {
	margin: 30px 0;
	color: #222;
	line-height: 1;
	margin-left: -2px;
	font-size: 32px;
	position: relative;
} /* 20171027 수정 */
.page-tit:before {
	display: block;
	width: 30px;
	margin-bottom: 12px;
	margin-left: 2px;
	border-top: 3px solid #1991d7;
	content: '';
}

html, body {
	margin: 0;
	padding: 0;
	height: 100%;
	font-family: arial;
	font-size: 13px;
	overflow: hidden;
}

#map_canvas {
	float: left;
	width: 820px;
	height: 406px;
}

#listing {
	float: left;
	margin-left: 1px;
	width: 205px;
	height: 326px;
	overflow: auto;
	cursor: pointer;
}

#controls {
	padding: 5px;
}

.placeIcon {
	width: 16px;
	height: 16px;
	margin: 2px;
}

#results {
	border-collapse: collapse;
	width: 184px;
}

#locationField {
	margin-left: 1px;
}

#autocomplete {
	width: 516px;
	border: 1px solid #ccc;
}
</style>

<div class="body-container">
<h1 class="page-tit">병원 정보</h1>
<script id="microloader" type="text/javascript" src=".sencha/app/microloader/development.js"></script>
	<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?sensor=false&amp;libraries=placeskey=AIzaSyBPA_xStX4VRi97SvEHjPOjZjlIC6aRWcs"></script>
	<script type="text/javascript">
		var map, places, iw;
		var markers = [];
		var autocomplete;

		function initialize() {
			var myLatlng = new google.maps.LatLng(37.566535, 126.97796919999996);
			var myOptions = {
				zoom: 14,
				center: myLatlng,
				mapTypeId: google.maps.MapTypeId.ROADMAP
			};
			map = new google.maps.Map(document.getElementById('map_canvas'), myOptions);
			places = new google.maps.places.PlacesService(map);
			google.maps.event.addListener(map, 'tilesloaded', tilesLoaded);
			autocomplete = new google.maps.places.Autocomplete(document.getElementById('autocomplete'));
			google.maps.event.addListener(autocomplete, 'place_changed', function () {
				showSelectedPlace();
			});
		}

		function tilesLoaded() {
			google.maps.event.clearListeners(map, 'tilesloaded');
			google.maps.event.addListener(map, 'zoom_changed', search);
			google.maps.event.addListener(map, 'dragend', search);
			search();
		}

		function showSelectedPlace() {
			clearResults();
			clearMarkers();
			var place = autocomplete.getPlace();
			alert(place.geometry.location);
			map.panTo(place.geometry.location);
			markers[0] = new google.maps.Marker({
				position: place.geometry.location,
				map: map
			});
			iw = new google.maps.InfoWindow({
				content: getIWContent(place)
			});
			iw.open(map, markers[0]);
		}

		function search() {
			var type;
			for (var i = 0; i < document.controls.type.length; i++) {
				if (document.controls.type[i].checked) {
					type = document.controls.type[i].value;
				}
			}
			autocomplete.setBounds(map.getBounds());
			var search = {
				bounds: map.getBounds()
			};
			if (type != 'establishment') {
				search.types = [type];
			}
			places.search(search, function (results, status) {
				if (status == google.maps.places.PlacesServiceStatus.OK) {
					clearResults();
					clearMarkers();
					for (var i = 0; i < results.length; i++) {
						markers[i] = new google.maps.Marker({
							position: results[i].geometry.location,
							animation: google.maps.Animation.DROP
						});
						google.maps.event.addListener(markers[i], 'click', getDetails(results[i], i));
						setTimeout(dropMarker(i), i * 100);
						addResult(results[i], i);
					}
				}
			});
		}

		function clearMarkers() {
			for (var i = 0; i < markers.length; i++) {
				if (markers[i]) {
					markers[i].setMap(null);
					markers[i] == null;
				}
			}
		}

		function dropMarker(i) {
			return function () {
				markers[i].setMap(map);
			}
		}

		function addResult(result, i) {
			var results = document.getElementById('results');
			var tr = document.createElement('tr');
			tr.style.backgroundColor = (i % 2 == 0 ? '#F0F0F0' : '#FFFFFF');
			tr.onclick = function () {
				google.maps.event.trigger(markers[i], 'click');
			};
			var iconTd = document.createElement('td');
			var nameTd = document.createElement('td');
			var icon = document.createElement('img');
			icon.src = result.icon.replace('http:', '');
			icon.setAttribute('class', 'placeIcon');
			var name = document.createTextNode(result.name);
			iconTd.appendChild(icon);
			nameTd.appendChild(name);
			tr.appendChild(iconTd);
			tr.appendChild(nameTd);
			results.appendChild(tr);
		}

		function clearResults() {
			var results = document.getElementById('results');
			while (results.childNodes[0]) {
				results.removeChild(results.childNodes[0]);
			}
		}

		function getDetails(result, i) {
			return function () {
				places.getDetails({
					reference: result.reference
				}, showInfoWindow(i));
			}
		}

		function showInfoWindow(i) {
			return function (place, status) {
				if (iw) {
					iw.close();
					iw = null;
				}
				if (status == google.maps.places.PlacesServiceStatus.OK) {
					iw = new google.maps.InfoWindow({
						content: getIWContent(place)
					});
					iw.open(map, markers[i]);
				}
			}
		}

		function getIWContent(place) {
			var content = '<table style="border:0"><tr><td style="border:0;">';
			content += '<img class="placeIcon" src="' + place.icon + '"></td>';
			content += '<td style="border:0;"><b><a href="' + place.url + '">' + place.name + '</a></b>';
			content += '</td></tr></table>';
			return content;
		}
		google.maps.event.addDomListener(window, 'load', initialize);
	</script>

	<div id="locationField">
		<input id="autocomplete" type="text" placeholder="Enter a location"
			autocomplete="off">
	</div>
	<div id="map_canvas" style="position: relative; overflow: hidden;">
		<div
			style="height: 100%; width: 100%; position: absolute; top: 0px; left: 0px; background-color: rgb(229, 227, 223);">
			<div class="gm-style"
				style="position: absolute; z-index: 0; left: 0px; top: 0px; height: 100%; width: 100%; padding: 0px; border-width: 0px; margin: 0px;">
				<div tabindex="0"
					style="position: absolute; z-index: 0; left: 0px; top: 0px; height: 100%; width: 100%; padding: 0px; border-width: 0px; margin: 0px; cursor: url(&quot;https://maps.gstatic.com/mapfiles/openhand_8_8.cur&quot;), default; touch-action: none;">
					<div
						style="z-index: 1; position: absolute; left: 50%; top: 50%; transform: translate(0px, 0px);">
						<div
							style="position: absolute; left: 0px; top: 0px; z-index: 100; width: 100%;">
							<div style="position: absolute; left: 0px; top: 0px; z-index: 0;">
								<div
									style="position: absolute; z-index: 1; transform: matrix(1, 0, 0, 1, -244, -242);">
									<div
										style="width: 256px; height: 256px; position: absolute; left: 256px; top: 256px;"></div>
									<div
										style="width: 256px; height: 256px; position: absolute; left: 0px; top: 256px;"></div>
									<div
										style="width: 256px; height: 256px; position: absolute; left: 0px; top: 0px;"></div>
									<div
										style="width: 256px; height: 256px; position: absolute; left: 256px; top: 0px;"></div>
									<div
										style="width: 256px; height: 256px; position: absolute; left: 512px; top: 0px;"></div>
									<div
										style="width: 256px; height: 256px; position: absolute; left: 512px; top: 256px;"></div>
									<div
										style="width: 256px; height: 256px; position: absolute; left: -256px; top: 256px;"></div>
									<div
										style="width: 256px; height: 256px; position: absolute; left: -256px; top: 0px;"></div>
								</div>
							</div>
						</div>
						<div
							style="position: absolute; left: 0px; top: 0px; z-index: 101; width: 100%;"></div>
						<div
							style="position: absolute; left: 0px; top: 0px; z-index: 102; width: 100%;"></div>
						<div
							style="position: absolute; left: 0px; top: 0px; z-index: 103; width: 100%;">
							<div
								style="position: absolute; left: 0px; top: 0px; z-index: -1;">
								<div
									style="position: absolute; z-index: 1; transform: matrix(1, 0, 0, 1, -244, -242);">
									<div
										style="width: 256px; height: 256px; overflow: hidden; position: absolute; left: 256px; top: 0px;"></div>
									<div
										style="width: 256px; height: 256px; overflow: hidden; position: absolute; left: 0px; top: 0px;"></div>
									<div
										style="width: 256px; height: 256px; overflow: hidden; position: absolute; left: 0px; top: -256px;"></div>
									<div
										style="width: 256px; height: 256px; overflow: hidden; position: absolute; left: 256px; top: -256px;"></div>
									<div
										style="width: 256px; height: 256px; overflow: hidden; position: absolute; left: 512px; top: -256px;"></div>
									<div
										style="width: 256px; height: 256px; overflow: hidden; position: absolute; left: 512px; top: 0px;"></div>
									<div
										style="width: 256px; height: 256px; overflow: hidden; position: absolute; left: 512px; top: 256px;"></div>
									<div
										style="width: 256px; height: 256px; overflow: hidden; position: absolute; left: 256px; top: 256px;"></div>
									<div
										style="width: 256px; height: 256px; overflow: hidden; position: absolute; left: 0px; top: 256px;"></div>
									<div
										style="width: 256px; height: 256px; overflow: hidden; position: absolute; left: -256px; top: 256px;"></div>
									<div
										style="width: 256px; height: 256px; overflow: hidden; position: absolute; left: -256px; top: 0px;"></div>
									<div
										style="width: 256px; height: 256px; overflow: hidden; position: absolute; left: -256px; top: -256px;"></div>
									<div
										style="width: 256px; height: 256px; overflow: hidden; position: absolute; left: 768px; top: -256px;"></div>
									<div
										style="width: 256px; height: 256px; overflow: hidden; position: absolute; left: 768px; top: 0px;"></div>
									<div
										style="width: 256px; height: 256px; overflow: hidden; position: absolute; left: 768px; top: 256px;"></div>
									<div
										style="width: 256px; height: 256px; overflow: hidden; position: absolute; left: -512px; top: 256px;"></div>
									<div
										style="width: 256px; height: 256px; overflow: hidden; position: absolute; left: -512px; top: 0px;"></div>
									<div
										style="width: 256px; height: 256px; overflow: hidden; position: absolute; left: -512px; top: -256px;"></div>
								</div>
							</div>
							<div
								style="width: 27px; height: 43px; overflow: hidden; position: absolute; left: -4061px; top: -1482px; z-index: -1439; animation-duration: 500ms; animation-iteration-count: 1; animation-name: _gm4712;">
								<img alt=""
									src="https://maps.gstatic.com/mapfiles/api-3/images/spotlight-poi2.png"
									draggable="false"
									style="position: absolute; left: 0px; top: 0px; width: 27px; height: 43px; user-select: none; border: 0px; padding: 0px; margin: 0px; max-width: none;">
							</div>
							<div
								style="width: 27px; height: 43px; overflow: hidden; position: absolute; left: 31px; top: -30px; z-index: 13; animation-duration: 500ms; animation-iteration-count: 1; animation-name: _gm4712;">
								<img alt=""
									src="https://maps.gstatic.com/mapfiles/api-3/images/spotlight-poi2.png"
									draggable="false"
									style="position: absolute; left: 0px; top: 0px; width: 27px; height: 43px; user-select: none; border: 0px; padding: 0px; margin: 0px; max-width: none;">
							</div>
							<div
								style="width: 27px; height: 43px; overflow: hidden; position: absolute; left: 123px; top: -150px; z-index: -107; animation-duration: 500ms; animation-iteration-count: 1; animation-name: _gm4712;">
								<img alt=""
									src="https://maps.gstatic.com/mapfiles/api-3/images/spotlight-poi2.png"
									draggable="false"
									style="position: absolute; left: 0px; top: 0px; width: 27px; height: 43px; user-select: none; border: 0px; padding: 0px; margin: 0px; max-width: none;">
							</div>
							<div
								style="width: 27px; height: 43px; overflow: hidden; position: absolute; left: -93px; top: 115px; z-index: 158; animation-duration: 500ms; animation-iteration-count: 1; animation-name: _gm4712;">
								<img alt=""
									src="https://maps.gstatic.com/mapfiles/api-3/images/spotlight-poi2.png"
									draggable="false"
									style="position: absolute; left: 0px; top: 0px; width: 27px; height: 43px; user-select: none; border: 0px; padding: 0px; margin: 0px; max-width: none;">
							</div>
							<div
								style="width: 27px; height: 43px; overflow: hidden; position: absolute; left: -52px; top: -73px; z-index: -30; animation-duration: 500ms; animation-iteration-count: 1; animation-name: _gm4712;">
								<img alt=""
									src="https://maps.gstatic.com/mapfiles/api-3/images/spotlight-poi2.png"
									draggable="false"
									style="position: absolute; left: 0px; top: 0px; width: 27px; height: 43px; user-select: none; border: 0px; padding: 0px; margin: 0px; max-width: none;">
							</div>
							<div
								style="width: 27px; height: 43px; overflow: hidden; position: absolute; left: -105px; top: 59px; z-index: 102; animation-duration: 500ms; animation-iteration-count: 1; animation-name: _gm4712;">
								<img alt=""
									src="https://maps.gstatic.com/mapfiles/api-3/images/spotlight-poi2.png"
									draggable="false"
									style="position: absolute; left: 0px; top: 0px; width: 27px; height: 43px; user-select: none; border: 0px; padding: 0px; margin: 0px; max-width: none;">
							</div>
							<div
								style="width: 27px; height: 43px; overflow: hidden; position: absolute; left: 14px; top: 102px; z-index: 145; animation-duration: 500ms; animation-iteration-count: 1; animation-name: _gm4712;">
								<img alt=""
									src="https://maps.gstatic.com/mapfiles/api-3/images/spotlight-poi2.png"
									draggable="false"
									style="position: absolute; left: 0px; top: 0px; width: 27px; height: 43px; user-select: none; border: 0px; padding: 0px; margin: 0px; max-width: none;">
							</div>
							<div
								style="width: 27px; height: 43px; overflow: hidden; position: absolute; left: 102px; top: 112px; z-index: 155; animation-duration: 500ms; animation-iteration-count: 1; animation-name: _gm4712;">
								<img alt=""
									src="https://maps.gstatic.com/mapfiles/api-3/images/spotlight-poi2.png"
									draggable="false"
									style="position: absolute; left: 0px; top: 0px; width: 27px; height: 43px; user-select: none; border: 0px; padding: 0px; margin: 0px; max-width: none;">
							</div>
							<div
								style="width: 27px; height: 43px; overflow: hidden; position: absolute; left: 1800px; top: 4684px; z-index: 4727; animation-duration: 500ms; animation-iteration-count: 1; animation-name: _gm4712;">
								<img alt=""
									src="https://maps.gstatic.com/mapfiles/api-3/images/spotlight-poi2.png"
									draggable="false"
									style="position: absolute; left: 0px; top: 0px; width: 27px; height: 43px; user-select: none; border: 0px; padding: 0px; margin: 0px; max-width: none;">
							</div>
						</div>
						<div style="position: absolute; left: 0px; top: 0px; z-index: 0;">
							<div
								style="position: absolute; z-index: 1; transform: matrix(1, 0, 0, 1, -244, -242);">
								<div
									style="position: absolute; left: 256px; top: 256px; width: 256px; height: 256px;">
									<img draggable="false" alt=""
										src="https://maps.googleapis.com/maps/vt?pb=!1m5!1m4!1i20!2i894154!3i406069!4i256!2m3!1e0!2sm!3i415114440!3m9!2sen-US!3sUS!5e18!12m1!1e68!12m3!1e37!2m1!1ssmartmaps!4e0!23i1301875&amp;token=47700"
										style="width: 256px; height: 256px; user-select: none; border: 0px; padding: 0px; margin: 0px; max-width: none;">
								</div>
								<div
									style="position: absolute; left: 0px; top: 256px; width: 256px; height: 256px;">
									<img draggable="false" alt=""
										src="https://maps.googleapis.com/maps/vt?pb=!1m5!1m4!1i20!2i894153!3i406069!4i256!2m3!1e0!2sm!3i415114440!3m9!2sen-US!3sUS!5e18!12m1!1e68!12m3!1e37!2m1!1ssmartmaps!4e0!23i1301875&amp;token=29480"
										style="width: 256px; height: 256px; user-select: none; border: 0px; padding: 0px; margin: 0px; max-width: none;">
								</div>
								<div
									style="position: absolute; left: 0px; top: 0px; width: 256px; height: 256px;">
									<img draggable="false" alt=""
										src="https://maps.googleapis.com/maps/vt?pb=!1m5!1m4!1i20!2i894153!3i406068!4i256!2m3!1e0!2sm!3i415114440!3m9!2sen-US!3sUS!5e18!12m1!1e68!12m3!1e37!2m1!1ssmartmaps!4e0!23i1301875&amp;token=24659"
										style="width: 256px; height: 256px; user-select: none; border: 0px; padding: 0px; margin: 0px; max-width: none;">
								</div>
								<div
									style="position: absolute; left: 256px; top: 0px; width: 256px; height: 256px;">
									<img draggable="false" alt=""
										src="https://maps.googleapis.com/maps/vt?pb=!1m5!1m4!1i20!2i894154!3i406068!4i256!2m3!1e0!2sm!3i415114440!3m9!2sen-US!3sUS!5e18!12m1!1e68!12m3!1e37!2m1!1ssmartmaps!4e0!23i1301875&amp;token=42879"
										style="width: 256px; height: 256px; user-select: none; border: 0px; padding: 0px; margin: 0px; max-width: none;">
								</div>
								<div
									style="position: absolute; left: 512px; top: 0px; width: 256px; height: 256px;">
									<img draggable="false" alt=""
										src="https://maps.googleapis.com/maps/vt?pb=!1m5!1m4!1i20!2i894155!3i406068!4i256!2m3!1e0!2sm!3i415114440!3m9!2sen-US!3sUS!5e18!12m1!1e68!12m3!1e37!2m1!1ssmartmaps!4e0!23i1301875&amp;token=61099"
										style="width: 256px; height: 256px; user-select: none; border: 0px; padding: 0px; margin: 0px; max-width: none;">
								</div>
								<div
									style="position: absolute; left: 512px; top: 256px; width: 256px; height: 256px;">
									<img draggable="false" alt=""
										src="https://maps.googleapis.com/maps/vt?pb=!1m5!1m4!1i20!2i894155!3i406069!4i256!2m3!1e0!2sm!3i415114440!3m9!2sen-US!3sUS!5e18!12m1!1e68!12m3!1e37!2m1!1ssmartmaps!4e0!23i1301875&amp;token=65920"
										style="width: 256px; height: 256px; user-select: none; border: 0px; padding: 0px; margin: 0px; max-width: none;">
								</div>
								<div
									style="position: absolute; left: -256px; top: 256px; width: 256px; height: 256px;">
									<img draggable="false" alt=""
										src="https://maps.googleapis.com/maps/vt?pb=!1m5!1m4!1i20!2i894152!3i406069!4i256!2m3!1e0!2sm!3i415114764!3m9!2sen-US!3sUS!5e18!12m1!1e68!12m3!1e37!2m1!1ssmartmaps!4e0!23i1301875&amp;token=53590"
										style="width: 256px; height: 256px; user-select: none; border: 0px; padding: 0px; margin: 0px; max-width: none;">
								</div>
								<div
									style="position: absolute; left: -256px; top: 0px; width: 256px; height: 256px;">
									<img draggable="false" alt=""
										src="https://maps.googleapis.com/maps/vt?pb=!1m5!1m4!1i20!2i894152!3i406068!4i256!2m3!1e0!2sm!3i415114764!3m9!2sen-US!3sUS!5e18!12m1!1e68!12m3!1e37!2m1!1ssmartmaps!4e0!23i1301875&amp;token=48769"
										style="width: 256px; height: 256px; user-select: none; border: 0px; padding: 0px; margin: 0px; max-width: none;">
								</div>
							</div>
						</div>
					</div>
					<div class="gm-style-pbc"
						style="z-index: 2; position: absolute; height: 100%; width: 100%; padding: 0px; border-width: 0px; margin: 0px; left: 0px; top: 0px; opacity: 0; transition-duration: 0.2s;">
						<p class="gm-style-pbt"></p>
					</div>
					<div
						style="z-index: 3; position: absolute; height: 100%; width: 100%; padding: 0px; border-width: 0px; margin: 0px; left: 0px; top: 0px; touch-action: pan-x pan-y;">
						<div
							style="z-index: 1; position: absolute; height: 100%; width: 100%; padding: 0px; border-width: 0px; margin: 0px; left: 0px; top: 0px;"></div>
						<div
							style="z-index: 4; position: absolute; left: 50%; top: 50%; transform: translate(0px, 0px);">
							<div
								style="position: absolute; left: 0px; top: 0px; z-index: 104; width: 100%;"></div>
							<div
								style="position: absolute; left: 0px; top: 0px; z-index: 105; width: 100%;"></div>
							<div
								style="position: absolute; left: 0px; top: 0px; z-index: 106; width: 100%;">
								<div class="gmnoprint"
									style="width: 27px; height: 43px; overflow: hidden; position: absolute; opacity: 0.01; left: -4061px; top: -1482px; z-index: -1439;">
									<img alt=""
										src="https://maps.gstatic.com/mapfiles/api-3/images/spotlight-poi2.png"
										draggable="false" usemap="#gmimap242"
										style="position: absolute; left: 0px; top: 0px; width: 27px; height: 43px; user-select: none; border: 0px; padding: 0px; margin: 0px; max-width: none;">
									<map name="gmimap242" id="gmimap242">
										<area href="javascript:void(0)" log="miw"
											coords="13.5,0,4,3.75,0,13.5,13.5,43,27,13.5,23,3.75"
											shape="poly" title=""
											style="cursor: pointer; touch-action: none;">
									</map>
								</div>
								<div class="gmnoprint"
									style="width: 27px; height: 43px; overflow: hidden; position: absolute; opacity: 0.01; left: 31px; top: -30px; z-index: 13;">
									<img alt=""
										src="https://maps.gstatic.com/mapfiles/api-3/images/spotlight-poi2.png"
										draggable="false" usemap="#gmimap243"
										style="position: absolute; left: 0px; top: 0px; width: 27px; height: 43px; user-select: none; border: 0px; padding: 0px; margin: 0px; max-width: none;">
									<map name="gmimap243" id="gmimap243">
										<area href="javascript:void(0)" log="miw"
											coords="13.5,0,4,3.75,0,13.5,13.5,43,27,13.5,23,3.75"
											shape="poly" title=""
											style="cursor: pointer; touch-action: none;">
									</map>
								</div>
								<div class="gmnoprint"
									style="width: 27px; height: 43px; overflow: hidden; position: absolute; opacity: 0.01; left: 123px; top: -150px; z-index: -107;">
									<img alt=""
										src="https://maps.gstatic.com/mapfiles/api-3/images/spotlight-poi2.png"
										draggable="false" usemap="#gmimap244"
										style="position: absolute; left: 0px; top: 0px; width: 27px; height: 43px; user-select: none; border: 0px; padding: 0px; margin: 0px; max-width: none;">
									<map name="gmimap244" id="gmimap244">
										<area href="javascript:void(0)" log="miw"
											coords="13.5,0,4,3.75,0,13.5,13.5,43,27,13.5,23,3.75"
											shape="poly" title=""
											style="cursor: pointer; touch-action: none;">
									</map>
								</div>
								<div class="gmnoprint"
									style="width: 27px; height: 43px; overflow: hidden; position: absolute; opacity: 0.01; left: -93px; top: 115px; z-index: 158;">
									<img alt=""
										src="https://maps.gstatic.com/mapfiles/api-3/images/spotlight-poi2.png"
										draggable="false" usemap="#gmimap245"
										style="position: absolute; left: 0px; top: 0px; width: 27px; height: 43px; user-select: none; border: 0px; padding: 0px; margin: 0px; max-width: none;">
									<map name="gmimap245" id="gmimap245">
										<area href="javascript:void(0)" log="miw"
											coords="13.5,0,4,3.75,0,13.5,13.5,43,27,13.5,23,3.75"
											shape="poly" title=""
											style="cursor: pointer; touch-action: none;">
									</map>
								</div>
								<div class="gmnoprint"
									style="width: 27px; height: 43px; overflow: hidden; position: absolute; opacity: 0.01; left: -52px; top: -73px; z-index: -30;">
									<img alt=""
										src="https://maps.gstatic.com/mapfiles/api-3/images/spotlight-poi2.png"
										draggable="false" usemap="#gmimap246"
										style="position: absolute; left: 0px; top: 0px; width: 27px; height: 43px; user-select: none; border: 0px; padding: 0px; margin: 0px; max-width: none;">
									<map name="gmimap246" id="gmimap246">
										<area href="javascript:void(0)" log="miw"
											coords="13.5,0,4,3.75,0,13.5,13.5,43,27,13.5,23,3.75"
											shape="poly" title=""
											style="cursor: pointer; touch-action: none;">
									</map>
								</div>
								<div class="gmnoprint"
									style="width: 27px; height: 43px; overflow: hidden; position: absolute; opacity: 0.01; left: -105px; top: 59px; z-index: 102;">
									<img alt=""
										src="https://maps.gstatic.com/mapfiles/api-3/images/spotlight-poi2.png"
										draggable="false" usemap="#gmimap247"
										style="position: absolute; left: 0px; top: 0px; width: 27px; height: 43px; user-select: none; border: 0px; padding: 0px; margin: 0px; max-width: none;">
									<map name="gmimap247" id="gmimap247">
										<area href="javascript:void(0)" log="miw"
											coords="13.5,0,4,3.75,0,13.5,13.5,43,27,13.5,23,3.75"
											shape="poly" title=""
											style="cursor: pointer; touch-action: none;">
									</map>
								</div>
								<div class="gmnoprint"
									style="width: 27px; height: 43px; overflow: hidden; position: absolute; opacity: 0.01; left: 14px; top: 102px; z-index: 145;">
									<img alt=""
										src="https://maps.gstatic.com/mapfiles/api-3/images/spotlight-poi2.png"
										draggable="false" usemap="#gmimap248"
										style="position: absolute; left: 0px; top: 0px; width: 27px; height: 43px; user-select: none; border: 0px; padding: 0px; margin: 0px; max-width: none;">
									<map name="gmimap248" id="gmimap248">
										<area href="javascript:void(0)" log="miw"
											coords="13.5,0,4,3.75,0,13.5,13.5,43,27,13.5,23,3.75"
											shape="poly" title=""
											style="cursor: pointer; touch-action: none;">
									</map>
								</div>
								<div class="gmnoprint"
									style="width: 27px; height: 43px; overflow: hidden; position: absolute; opacity: 0.01; left: 102px; top: 112px; z-index: 155;">
									<img alt=""
										src="https://maps.gstatic.com/mapfiles/api-3/images/spotlight-poi2.png"
										draggable="false" usemap="#gmimap249"
										style="position: absolute; left: 0px; top: 0px; width: 27px; height: 43px; user-select: none; border: 0px; padding: 0px; margin: 0px; max-width: none;">
									<map name="gmimap249" id="gmimap249">
										<area href="javascript:void(0)" log="miw"
											coords="13.5,0,4,3.75,0,13.5,13.5,43,27,13.5,23,3.75"
											shape="poly" title=""
											style="cursor: pointer; touch-action: none;">
									</map>
								</div>
								<div class="gmnoprint"
									style="width: 27px; height: 43px; overflow: hidden; position: absolute; opacity: 0.01; left: 1800px; top: 4684px; z-index: 4727;">
									<img alt=""
										src="https://maps.gstatic.com/mapfiles/api-3/images/spotlight-poi2.png"
										draggable="false" usemap="#gmimap250"
										style="position: absolute; left: 0px; top: 0px; width: 27px; height: 43px; user-select: none; border: 0px; padding: 0px; margin: 0px; max-width: none;">
									<map name="gmimap250" id="gmimap250">
										<area href="javascript:void(0)" log="miw"
											coords="13.5,0,4,3.75,0,13.5,13.5,43,27,13.5,23,3.75"
											shape="poly" title=""
											style="cursor: pointer; touch-action: none;">
									</map>
								</div>
							</div>
							<div
								style="position: absolute; left: 0px; top: 0px; z-index: 107; width: 100%;"></div>
						</div>
					</div>
				</div>
				<iframe frameborder="0" src="about:blank"
					style="z-index: -1; position: absolute; width: 100%; height: 100%; top: 0px; left: 0px; border: none;"></iframe>
				<div
					style="margin-left: 5px; margin-right: 5px; z-index: 1000000; position: absolute; left: 0px; bottom: 0px;">
					<a target="_blank"
						href="https://maps.google.com/maps?ll=37.565005,126.983397&amp;z=20&amp;t=m&amp;hl=en-US&amp;gl=US&amp;mapclient=apiv3"
						title="Click to see this area on Google Maps"
						style="position: static; overflow: visible; float: none; display: inline;"><div
							style="width: 66px; height: 26px; cursor: pointer;">
							<img alt=""
								src="https://maps.gstatic.com/mapfiles/api-3/images/google4.png"
								draggable="false"
								style="position: absolute; left: 0px; top: 0px; width: 66px; height: 26px; user-select: none; border: 0px; padding: 0px; margin: 0px;">
						</div></a>
				</div>
				<div
					style="background-color: white; padding: 15px 21px; border: 1px solid rgb(171, 171, 171); font-family: Roboto, Arial, sans-serif; color: rgb(34, 34, 34); box-shadow: rgba(0, 0, 0, 0.2) 0px 4px 16px; z-index: 10000002; display: none; width: 256px; height: 148px; position: absolute; left: 260px; top: 113px;">
					<div style="padding: 0px 0px 10px; font-size: 16px;">Map Data</div>
					<div style="font-size: 13px;">Map data ©2018 SK telecom</div>
					<div
						style="width: 13px; height: 13px; overflow: hidden; position: absolute; opacity: 0.7; right: 12px; top: 12px; z-index: 10000; cursor: pointer;">
						<img alt=""
							src="https://maps.gstatic.com/mapfiles/api-3/images/mapcnt6.png"
							draggable="false"
							style="position: absolute; left: -2px; top: -336px; width: 59px; height: 492px; user-select: none; border: 0px; padding: 0px; margin: 0px; max-width: none;">
					</div>
				</div>
				<div class="gmnoprint"
					style="z-index: 1000001; position: absolute; right: 71px; bottom: 0px; width: 140px;">
					<div draggable="false" class="gm-style-cc"
						style="user-select: none; height: 14px; line-height: 14px;">
						<div
							style="opacity: 0.7; width: 100%; height: 100%; position: absolute;">
							<div style="width: 1px;"></div>
							<div
								style="background-color: rgb(245, 245, 245); width: auto; height: 100%; margin-left: 1px;"></div>
						</div>
						<div
							style="position: relative; padding-right: 6px; padding-left: 6px; font-family: Roboto, Arial, sans-serif; font-size: 10px; color: rgb(68, 68, 68); white-space: nowrap; direction: ltr; text-align: right; vertical-align: middle; display: inline-block;">
							<a style="text-decoration: none; cursor: pointer; display: none;">Map
								Data</a><span>Map data ©2018 SK telecom</span>
						</div>
					</div>
				</div>
				<div class="gmnoscreen"
					style="position: absolute; right: 0px; bottom: 0px;">
					<div
						style="font-family: Roboto, Arial, sans-serif; font-size: 11px; color: rgb(68, 68, 68); direction: ltr; text-align: right; background-color: rgb(245, 245, 245);">Map
						data ©2018 SK telecom</div>
				</div>
				<div class="gmnoprint gm-style-cc" draggable="false"
					style="z-index: 1000001; user-select: none; height: 14px; line-height: 14px; position: absolute; right: 0px; bottom: 0px;">
					<div
						style="opacity: 0.7; width: 100%; height: 100%; position: absolute;">
						<div style="width: 1px;"></div>
						<div
							style="background-color: rgb(245, 245, 245); width: auto; height: 100%; margin-left: 1px;"></div>
					</div>
					<div
						style="position: relative; padding-right: 6px; padding-left: 6px; font-family: Roboto, Arial, sans-serif; font-size: 10px; color: rgb(68, 68, 68); white-space: nowrap; direction: ltr; text-align: right; vertical-align: middle; display: inline-block;">
						<a
							href="https://www.google.com/intl/en-US_US/help/terms_maps.html"
							target="_blank"
							style="text-decoration: none; cursor: pointer; color: rgb(68, 68, 68);">Terms
							of Use</a>
					</div>
				</div>
				<button draggable="false" title="Toggle fullscreen view"
					aria-label="Toggle fullscreen view" type="button"
					style="background: none; border: 0px; margin: 10px 14px; padding: 0px; position: absolute; cursor: pointer; user-select: none; width: 25px; height: 25px; overflow: hidden; top: 0px; right: 0px;">
					<img alt=""
						src="https://maps.gstatic.com/mapfiles/api-3/images/sv9.png"
						draggable="false" class="gm-fullscreen-control"
						style="position: absolute; left: -52px; top: -86px; width: 164px; height: 175px; user-select: none; border: 0px; padding: 0px; margin: 0px;">
				</button>
				<div draggable="false" class="gm-style-cc"
					style="user-select: none; height: 14px; line-height: 14px; z-index: 0; position: absolute; bottom: 127px; right: 0px;">
					<div
						style="opacity: 0.7; width: 100%; height: 100%; position: absolute;">
						<div style="width: 1px;"></div>
						<div
							style="background-color: rgb(245, 245, 245); width: auto; height: 100%; margin-left: 1px;"></div>
					</div>
					<div
						style="position: relative; padding-right: 6px; padding-left: 6px; font-family: Roboto, Arial, sans-serif; font-size: 10px; color: rgb(68, 68, 68); white-space: nowrap; direction: ltr; text-align: right; vertical-align: middle; display: none; padding-bottom: 0px;"></div>
				</div>
				<div draggable="false" class="gm-style-cc"
					style="user-select: none; height: 14px; line-height: 14px; display: none; position: absolute; right: 0px; bottom: 0px;">
					<div
						style="opacity: 0.7; width: 100%; height: 100%; position: absolute;">
						<div style="width: 1px;"></div>
						<div
							style="background-color: rgb(245, 245, 245); width: auto; height: 100%; margin-left: 1px;"></div>
					</div>
					<div
						style="position: relative; padding-right: 6px; padding-left: 6px; font-family: Roboto, Arial, sans-serif; font-size: 10px; color: rgb(68, 68, 68); white-space: nowrap; direction: ltr; text-align: right; vertical-align: middle; display: inline-block;">
						<a target="_blank" rel="noopener"
							title="Report errors in the road map or imagery to Google"
							href="https://www.google.com/maps/@37.565005,126.983397,20z/data=!10m1!1e1!12b1?source=apiv3&amp;rapsrc=apiv3"
							style="font-family: Roboto, Arial, sans-serif; font-size: 10px; color: rgb(68, 68, 68); text-decoration: none; position: relative;">Report
							a map error</a>
					</div>
				</div>
				<div
					class="gmnoprint gm-bundled-control gm-bundled-control-on-bottom"
					draggable="false" controlwidth="28" controlheight="93"
					style="margin: 10px; user-select: none; position: absolute; bottom: 107px; right: 28px;">
					<div class="gmnoprint" controlwidth="28" controlheight="55"
						style="position: absolute; left: 0px; top: 38px;">
						<div draggable="false"
							style="user-select: none; box-shadow: rgba(0, 0, 0, 0.3) 0px 1px 4px -1px; border-radius: 2px; cursor: pointer; background-color: rgb(255, 255, 255); width: 28px; height: 55px;">
							<button draggable="false" title="Zoom in" aria-label="Zoom in"
								type="button"
								style="background: none; display: block; border: 0px; margin: 0px; padding: 0px; position: relative; cursor: pointer; user-select: none; width: 28px; height: 27px; top: 0px; left: 0px;">
								<div
									style="overflow: hidden; position: absolute; width: 15px; height: 15px; left: 7px; top: 6px;">
									<img alt=""
										src="https://maps.gstatic.com/mapfiles/api-3/images/tmapctrl.png"
										draggable="false"
										style="position: absolute; left: 0px; top: 0px; user-select: none; border: 0px; padding: 0px; margin: 0px; max-width: none; width: 120px; height: 54px;">
								</div>
							</button>
							<div
								style="position: relative; overflow: hidden; width: 67%; height: 1px; left: 16%; background-color: rgb(230, 230, 230); top: 0px;"></div>
							<button draggable="false" title="Zoom out" aria-label="Zoom out"
								type="button"
								style="background: none; display: block; border: 0px; margin: 0px; padding: 0px; position: relative; cursor: pointer; user-select: none; width: 28px; height: 27px; top: 0px; left: 0px;">
								<div
									style="overflow: hidden; position: absolute; width: 15px; height: 15px; left: 7px; top: 6px;">
									<img alt=""
										src="https://maps.gstatic.com/mapfiles/api-3/images/tmapctrl.png"
										draggable="false"
										style="position: absolute; left: 0px; top: -15px; user-select: none; border: 0px; padding: 0px; margin: 0px; max-width: none; width: 120px; height: 54px;">
								</div>
							</button>
						</div>
					</div>
					<div class="gm-svpc" controlwidth="28" controlheight="28"
						style="background-color: rgb(255, 255, 255); box-shadow: rgba(0, 0, 0, 0.3) 0px 1px 4px -1px; border-radius: 2px; width: 28px; height: 28px; cursor: url(&quot;https://maps.gstatic.com/mapfiles/openhand_8_8.cur&quot;), default; touch-action: none; position: absolute; left: 0px; top: 0px;">
						<div style="position: absolute; left: 1px; top: 1px;"></div>
						<div style="position: absolute; left: 1px; top: 1px;">
							<div aria-label="Street View Pegman Control"
								style="width: 26px; height: 26px; overflow: hidden; position: absolute; left: 0px; top: 0px;">
								<img alt=""
									src="https://maps.gstatic.com/mapfiles/api-3/images/cb_scout5.png"
									draggable="false"
									style="position: absolute; left: -147px; top: -26px; width: 215px; height: 835px; user-select: none; border: 0px; padding: 0px; margin: 0px; max-width: none;">
							</div>
							<div aria-label="Pegman is on top of the Map"
								style="width: 26px; height: 26px; overflow: hidden; position: absolute; left: 0px; top: 0px; visibility: hidden;">
								<img alt=""
									src="https://maps.gstatic.com/mapfiles/api-3/images/cb_scout5.png"
									draggable="false"
									style="position: absolute; left: -147px; top: -52px; width: 215px; height: 835px; user-select: none; border: 0px; padding: 0px; margin: 0px; max-width: none;">
							</div>
							<div aria-label="Street View Pegman Control"
								style="width: 26px; height: 26px; overflow: hidden; position: absolute; left: 0px; top: 0px; visibility: hidden;">
								<img alt=""
									src="https://maps.gstatic.com/mapfiles/api-3/images/cb_scout5.png"
									draggable="false"
									style="position: absolute; left: -147px; top: -78px; width: 215px; height: 835px; user-select: none; border: 0px; padding: 0px; margin: 0px; max-width: none;">
							</div>
						</div>
					</div>
					<div class="gmnoprint" controlwidth="28" controlheight="0"
						style="display: none; position: absolute;">
						<div title="Rotate map 90 degrees"
							style="width: 28px; height: 28px; overflow: hidden; position: absolute; background-color: rgb(255, 255, 255); box-shadow: rgba(0, 0, 0, 0.3) 0px 1px 4px -1px; border-radius: 2px; cursor: pointer; display: none;">
							<img alt=""
								src="https://maps.gstatic.com/mapfiles/api-3/images/tmapctrl4.png"
								draggable="false"
								style="position: absolute; left: -141px; top: 6px; width: 170px; height: 54px; user-select: none; border: 0px; padding: 0px; margin: 0px; max-width: none;">
						</div>
						<div class="gm-tilt"
							style="width: 28px; height: 28px; overflow: hidden; position: absolute; background-color: rgb(255, 255, 255); box-shadow: rgba(0, 0, 0, 0.3) 0px 1px 4px -1px; border-radius: 2px; top: 0px; cursor: pointer;">
							<img alt=""
								src="https://maps.gstatic.com/mapfiles/api-3/images/tmapctrl4.png"
								draggable="false"
								style="position: absolute; left: -141px; top: -13px; width: 170px; height: 54px; user-select: none; border: 0px; padding: 0px; margin: 0px; max-width: none;">
						</div>
					</div>
				</div>
				<div class="gmnoprint"
					style="margin: 10px; z-index: 0; position: absolute; cursor: pointer; left: 0px; top: 0px;">
					<div class="gm-style-mtc" style="float: left; position: relative;">
						<div role="button" tabindex="0" title="Show street map"
							aria-label="Show street map" aria-pressed="true"
							draggable="false"
							style="direction: ltr; overflow: hidden; text-align: center; position: relative; color: rgb(0, 0, 0); font-family: Roboto, Arial, sans-serif; user-select: none; font-size: 11px; background-color: rgb(255, 255, 255); padding: 8px; border-bottom-left-radius: 2px; border-top-left-radius: 2px; background-clip: padding-box; box-shadow: rgba(0, 0, 0, 0.3) 0px 1px 4px -1px; min-width: 21px; font-weight: 500;">Map</div>
						<div
							style="background-color: white; z-index: -1; padding: 2px; border-bottom-left-radius: 2px; border-bottom-right-radius: 2px; box-shadow: rgba(0, 0, 0, 0.3) 0px 1px 4px -1px; position: absolute; left: 0px; top: 29px; text-align: left; display: none;">
							<div draggable="false" title="Show street map with terrain"
								style="color: rgb(0, 0, 0); font-family: Roboto, Arial, sans-serif; user-select: none; font-size: 11px; background-color: rgb(255, 255, 255); padding: 6px 8px 6px 6px; direction: ltr; text-align: left; white-space: nowrap;">
								<span role="checkbox"
									style="box-sizing: border-box; position: relative; line-height: 0; font-size: 0px; margin: 0px 5px 0px 0px; display: inline-block; background-color: rgb(255, 255, 255); border: 1px solid rgb(198, 198, 198); border-radius: 1px; width: 13px; height: 13px; vertical-align: middle;"><div
										style="position: absolute; left: 1px; top: -2px; width: 13px; height: 11px; overflow: hidden; display: none;">
										<img alt=""
											src="https://maps.gstatic.com/mapfiles/mv/imgs8.png"
											draggable="false"
											style="position: absolute; left: -52px; top: -44px; user-select: none; border: 0px; padding: 0px; margin: 0px; max-width: none; width: 68px; height: 67px;">
									</div></span><label style="vertical-align: middle; cursor: pointer;">Terrain</label>
							</div>
						</div>
					</div>
					<div class="gm-style-mtc" style="float: left; position: relative;">
						<div role="button" tabindex="0" title="Show satellite imagery"
							aria-label="Show satellite imagery" aria-pressed="false"
							draggable="false"
							style="direction: ltr; overflow: hidden; text-align: center; position: relative; color: rgb(86, 86, 86); font-family: Roboto, Arial, sans-serif; user-select: none; font-size: 11px; background-color: rgb(255, 255, 255); padding: 8px; border-bottom-right-radius: 2px; border-top-right-radius: 2px; background-clip: padding-box; box-shadow: rgba(0, 0, 0, 0.3) 0px 1px 4px -1px; min-width: 39px; border-left: 0px;">Satellite</div>
						<div
							style="background-color: white; z-index: -1; padding: 2px; border-bottom-left-radius: 2px; border-bottom-right-radius: 2px; box-shadow: rgba(0, 0, 0, 0.3) 0px 1px 4px -1px; position: absolute; right: 0px; top: 29px; text-align: left; display: none;">
							<div draggable="false" title="Show imagery with street names"
								style="color: rgb(0, 0, 0); font-family: Roboto, Arial, sans-serif; user-select: none; font-size: 11px; background-color: rgb(255, 255, 255); padding: 6px 8px 6px 6px; direction: ltr; text-align: left; white-space: nowrap;">
								<span role="checkbox"
									style="box-sizing: border-box; position: relative; line-height: 0; font-size: 0px; margin: 0px 5px 0px 0px; display: inline-block; background-color: rgb(255, 255, 255); border: 1px solid rgb(198, 198, 198); border-radius: 1px; width: 13px; height: 13px; vertical-align: middle;"><div
										style="position: absolute; left: 1px; top: -2px; width: 13px; height: 11px; overflow: hidden;">
										<img alt=""
											src="https://maps.gstatic.com/mapfiles/mv/imgs8.png"
											draggable="false"
											style="position: absolute; left: -52px; top: -44px; user-select: none; border: 0px; padding: 0px; margin: 0px; max-width: none; width: 68px; height: 67px;">
									</div></span><label style="vertical-align: middle; cursor: pointer;">Labels</label>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div id="controls">
		<form name="controls">
			<!-- <input type="radio" name="type" value="establishment" onclick="search()" checked="checked">기관, 시설
			<br> -->
			<input type="radio" name="type" value="hospital" onclick="search()">병원
			<br>
			<!-- <input type="radio" name="type" value="restaurant" onclick="search()">레스토랑
			<br>
			<input type="radio" name="type" value="subway_station" onclick="search()">지하철
			<br>
			<input type="radio" name="type" value="lodging" onclick="search()">숙박업소</form> -->
	</div>
	<!-- <div id="listing">
		<table id="results">
			<tr style="background-color: rgb(240, 240, 240);">
				<td><img
					src="https://maps.gstatic.com/mapfiles/place_api/icons/geocode-71.png"
					class="placeIcon"></td>
				<td>Seoul</td>
			</tr>
			<tr style="background-color: rgb(255, 255, 255);">
				<td><img
					src="https://maps.gstatic.com/mapfiles/place_api/icons/generic_business-71.png"
					class="placeIcon"></td>
				<td>알파카 한국매장</td>
			</tr>
			<tr style="background-color: rgb(240, 240, 240);">
				<td><img
					src="https://maps.gstatic.com/mapfiles/place_api/icons/restaurant-71.png"
					class="placeIcon"></td>
				<td>Outback Steakhouse</td>
			</tr>
			<tr style="background-color: rgb(255, 255, 255);">
				<td><img
					src="https://maps.gstatic.com/mapfiles/place_api/icons/restaurant-71.png"
					class="placeIcon"></td>
				<td>일미리금계찜닭 명동점</td>
			</tr>
			<tr style="background-color: rgb(240, 240, 240);">
				<td><img
					src="https://maps.gstatic.com/mapfiles/place_api/icons/restaurant-71.png"
					class="placeIcon"></td>
				<td>side snow</td>
			</tr>
			<tr style="background-color: rgb(255, 255, 255);">
				<td><img
					src="https://maps.gstatic.com/mapfiles/place_api/icons/restaurant-71.png"
					class="placeIcon"></td>
				<td>장수분식</td>
			</tr>
			<tr style="background-color: rgb(240, 240, 240);">
				<td><img
					src="https://maps.gstatic.com/mapfiles/place_api/icons/restaurant-71.png"
					class="placeIcon"></td>
				<td>사이드쇼</td>
			</tr>
			<tr style="background-color: rgb(255, 255, 255);">
				<td><img
					src="https://maps.gstatic.com/mapfiles/place_api/icons/generic_business-71.png"
					class="placeIcon"></td>
				<td>스탠다드차타드은행 명동</td>
			</tr>
			<tr style="background-color: rgb(240, 240, 240);">
				<td><img
					src="https://maps.gstatic.com/mapfiles/place_api/icons/geocode-71.png"
					class="placeIcon"></td>
				<td>Myeong-dong</td>
			</tr>
		</table> -->
	</div>


	<div class="pac-container pac-logo"
		style="display: none; width: 516px; position: absolute; left: 1px; top: 34px;"></div>