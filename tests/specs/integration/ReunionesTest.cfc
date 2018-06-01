<!---
*	Integration Test as BDD (CF10+ or Railo 4.1 Plus)
*
*	Extends the integration class: coldbox.system.testing.BaseTestCase
*
*	so you can test your ColdBox application headlessly. The 'appMapping' points by default to 
*	the '/root' mapping created in the test folder Application.cfc.  Please note that this 
*	Application.cfc must mimic the real one in your root, including ORM settings if needed.
*
*	The 'execute()' method is used to execute a ColdBox event, with the following arguments
*	* event : the name of the event
*	* private : if the event is private or not
*	* prePostExempt : if the event needs to be exempt of pre post interceptors
*	* eventArguments : The struct of args to pass to the event
*	* renderResults : Render back the results of the event
--->
<cfcomponent extends="coldbox.system.testing.BaseTestCase" appMapping="/">
	
	<!--- *********************************** LIFE CYCLE Methods *********************************** --->

	<cffunction name="beforeAll">

		<cfset super.beforeAll()>
	</cffunction>

	<cffunction name="afterAll">

		<cfset super.afterAll()>
	</cffunction>

	<!--- *********************************** BDD SUITES *********************************** --->
	
	<cffunction name="run">
		<cfscript>
		describe( "Reuniones Suite", function(){

			beforeEach(function( currentSpec ){
				// Setup as a new ColdBox request for this suite, VERY IMPORTANT. ELSE EVERYTHING LOOKS LIKE THE SAME REQUEST.
				setup();
			});

			it( "index", function(){
				var event = execute( event="Reuniones.index", renderResults=true );
				// expectations go here.
				expect( false ).toBeTrue();
			});

			it( "get", function(){
				var event = execute( event="Reuniones.get", renderResults=true );
				// expectations go here.
				expect( false ).toBeTrue();
			});


		});
		</cfscript>
	</cffunction>

</cfcomponent>