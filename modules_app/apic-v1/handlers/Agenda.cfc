<cfcomponent output="false" hint="I am a new handler" extends="handlers.Base">
	
	<cfproperty name="service" inject="model:agenda.AgendaService">

	<cfscript>
		this.prehandler_only 		= "";
		this.prehandler_except 		= "";
		this.posthandler_only 		= "";
		this.posthandler_except 	= "";
		this.aroundHandler_only 	= "";
		this.aroundHandler_except 	= "";		
		// REST HTTP Methods Allowed for actions.
		// Ex: this.allowedMethods = {delete='POST,DELETE',index='GET'} */
		this.allowedMethods 	= {};
	</cfscript>

	<!------------------------------------------- PUBLIC EVENTS ------------------------------------------>
	<cffunction name="index" output="false" hint="index">
		<cfargument name="event">
		<cfargument name="rc">
		<cfargument name="prc">

		<cfset var s = service.index(arguments.rc.id_evento, session.language)>

		<cfif NOT structIsEmpty(s.data.records)>
			<cfset s.data.records = QueryToStruct(s.data.records)>
		</cfif>

		<cfset arguments.prc.response.setData(s.data).setError(!s.ok)> 
		<cfif NOT isEmpty(s.mensaje)><cfset arguments.prc.response.addMessage(s.mensaje)></cfif>
	</cffunction>

	<cffunction name="get" output="false" hint="index">
		<cfargument name="event">
		<cfargument name="rc">
		<cfargument name="prc">

		<cfset var s = service.get(arguments.rc.id_participante, arguments.rc.id_evento, session.language)>

		<cfif NOT structIsEmpty(s.data.records)>
			<cfset s.data.records = QueryToStruct(s.data.records)>
		</cfif>

		<cfset arguments.prc.response.setData(s.data).setError(!s.ok)> 
		<cfif NOT isEmpty(s.mensaje)><cfset arguments.prc.response.addMessage(s.mensaje)></cfif>
	</cffunction>

</cfcomponent>

