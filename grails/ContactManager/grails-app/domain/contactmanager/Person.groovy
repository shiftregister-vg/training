package contactmanager

class Person {
	
	Date dateCreated
	
	String firstName
	String lastName
	String email
	Date dateOfBirth
	
	static hasMany = [addresses:Address,phones:Phone]
	
    static constraints = {
		firstName blank:false
		lastName  blank:false
		email     blank:false, email:true
    }
	
	String toString(){
		"$firstName $lastName"
	}
}
