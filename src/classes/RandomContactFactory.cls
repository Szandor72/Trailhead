public with sharing class RandomContactFactory {
	public static List<Contact> generateRandomContacts(Integer numCons, String lName) {
        List<Contact> cons = new List<Contact>();

        for(Integer i=0; i<numCons; i++) {
            Contact c = new Contact(LastName=lName, FirstName='Test '+i);
            cons.add(c);
        }
        
        return cons;				
	}
}