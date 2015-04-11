public with sharing class ContactSearch {
	public static List<Contact> searchForContacts(String name, String zip) {
		List<Contact> con = [Select Id, Name From Contact Where LastName = :name And MailingPostalCode = :zip];
		return con;		
	}
}