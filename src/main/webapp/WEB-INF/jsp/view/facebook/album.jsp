<spring:message code="title.facebook.album" var="facebookAlbum" />
<template:basic htmlTitle="${facebookAlbum}"
	bodyTitle="${facebookAlbum}">
	<div id="content" layout:fragment="content">
		<h3>Your Facebook Photo Album: ${album.name}</h3>

		<c:forEach items="${photos}" var="photo">
			<span> <img src="${photo.images[0].source}" align="middle" />
			</span>
		</c:forEach>

	</div>
</template:basic>