public with sharing class AccountHandler {
	public static Account insertNewAccount(String name) {
		try {
			Account acct = new Account(Name=name);
			insert acct;
			System.debug('Account Id: ' + acct.Id);
			return acct;

		} catch (DmlException e) {
			return null;
		}

	}
}