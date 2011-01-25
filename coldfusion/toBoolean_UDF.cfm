<!---
	REQUIRES COLDFUSION 9+
--->
<cffunction name="toBoolean" access="public" returnType="boolean" output="false">
	<cfargument name="value" type="any" required="true" />
	
	<cfif isNull(arguments.value)>
		<cfreturn false />
	</cfif>
	
	<cfif isValid("boolean",arguments.value)>
		<cfreturn arguments.value />
	</cfif>
	
	<cfif isValid("numeric",arguments.value)>
		<cfif arguments.value lte 0>
			<cfreturn false />
		<cfelse>
			<cfreturn true />
		</cfif>
	</cfif>
	
	<cfif isValid("struct",arguments.value)>
		<cfreturn toBoolean(listLen(StructKeyList(arguments.value))) />
	</cfif>
	
	<cfif isValid("array",arguments.value)>
		<cfreturn toBoolean(arrayLen(arguments.value)) />
	</cfif>
	
	<cfif isValid("string",arguments.value)>
		<cfif not len(arguments.value)>
			<cfreturn false />
		</cfif>
		<cfswitch expression="#arguments.value#">
			<cfcase value="n,no,flase,negative,NULL">
				<cfreturn false />
			</cfcase>
			<cfdefaultcase>
				<cfreturn true />
			</cfdefaultcase>
		</cfswitch>
	</cfif>
	
	<cfthrow type="cannot_convert" message="Cannot convert to boolean" />
	
</cffunction>