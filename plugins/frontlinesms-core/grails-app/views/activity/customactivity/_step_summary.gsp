<%@ page import="frontlinesms2.JoinActionStep" %>
<%@ page import="frontlinesms2.LeaveActionStep" %>
<%@ page import="frontlinesms2.ReplyActionStep" %>

<g:if test="${stepInstance?.shortName == 'join'}">
	<div class='step-summary ' id="step-${stepInstance?.id}">	
		<p>${stepInstance?.group.name}</p>
		<p>${stepInstance?.group.members.size()} members</p>
		<g:link controller="group" action="show" id="${stepInstance?.group.id}" class="btn">
			<g:message code="subscription.group.goto"/>
		</g:link>
	</div>
</g:if>
<g:if test="${stepInstance?.shortName == 'leave'}">
	<div class='step-summary ' id="step-${stepInstance?.id}">
		<p>${stepInstance?.group.name}</p>
		<p>${stepInstance?.group.members.size()} members</p>
		<g:link controller="group" action="show" id="${stepInstance?.group.id}" class="btn">
			<g:message code="subscription.group.goto"/>
		</g:link>
	</div>
</g:if>
<g:if test="${stepInstance?.shortName == 'reply'}">
	<div class='step-summary ' id="step-${stepInstance?.id}">
		<p>${stepInstance?.getProperty('autoreplyText')}</p>
	</div>
</g:if>
<g:if test="${stepInstance?.shortName == 'forward'}">
	<div class='step-summary ' id="step-${stepInstance?.id}">
		<p>${stepInstance?.getProperty('sentMessageText')}</p>
	</div>
</g:if>
