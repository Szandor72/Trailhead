@isTest
private class TestVerifyDate {
	@isTest static void ThirtyDays() {
		Date thirtyDaysTrue = VerifyDate.CheckDates(Date.today(), Date.newInstance(2015, 	3, 	25));
		System.assertEquals(Date.newInstance(2015, 	3, 	25), thirtyDaysTrue);
	}

	@isTest static void EndOfMonth() {
		Date endOfMonth = VerifyDate.CheckDates(Date.today(), Date.newInstance(2015, 	6, 	25));
		System.assertEquals(Date.newInstance(2015, 	3, 	31), endOfMonth);
	}	
}