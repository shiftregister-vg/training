package contactmanager

class Phone {
	
	Date dateCreated
	
	int npa
	int nxx
	String nxxx
	String extension
	
	static belongsTo = [Person]
	static hasMany = [people:Person]
	
    static constraints = {
		npa		range:100..999
		nxx     range:100..999
		nxxx    blank:false,nullable:false,minSize:4
		extension blank:true, nullable:true
    }
	
	String toString(){
		"($npa) $nxx-$nxxx ${ extension ?: '' }"
	}
}
