<div>
	<g:form name="confirmDelete" action='delete' >
		<g:hiddenField name="id" value="${params.id}"/>
			<h2><g:message code="activity.delete.prompt" args="${ [ownerInstance.name] }"/></h2>
	</g:form>
</div>