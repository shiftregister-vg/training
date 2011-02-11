<cffunction name="duplicateDB" access="public" returntype="void" output="false" hint="I duplicate a MySQL database locally on the same server.">
	<cfargument name="datasource" type="string" required="true" />
	<cfargument name="source" type="string" required="true" />
	<cfargument name="target" type="string" required="true" />
	<cfargument name="copyData" type="boolean" required="false" default="false" />
	
	<cfquery datasource="#arguments.datasource#">
	CREATE DATABASE  IF NOT EXISTS #arguments.target#;
	</cfquery>
	
	<cfdbinfo datasource="#arguments.datasource#" name="local.tbls" type="tables" />
	
	<cfloop query="local.tbls">
		<cfquery datasource="#arguments.datasource#">
		CREATE TABLE #arguments.target#.#table_name# LIKE #arguments.source#.#table_name#;
		</cfquery>
		
		<cfif arguments.copydata>
			<cfquery datasource="#arguments.datasource#">
			INSERT INTO #arguments.target#.#table_name# SELECT * FROM #arguments.source#.#table_name#;
			</cfquery>
		</cfif>
	</cfloop>
</cffunction>