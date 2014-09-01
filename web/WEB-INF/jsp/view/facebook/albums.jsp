<spring:message code="title.facebook.albums" var="facebookAlbums" />
<template:basic htmlTitle="${facebookAlbums}"
	bodyTitle="${facebookAlbums}">
	
	<div id="content" layout:fragment="content">
			<h3>Your Facebook Photo Albums</h3>
			
			
			<ul class="albums">
				<c:forEach items="${albums}" var="album">
					ALBUM: 
					<a href="${'/facebook/album/' + ${album.id}}"> ${album.name} </a>
					
				</c:forEach>
			
			</ul>
		</div>
		
		
</template:basic>
