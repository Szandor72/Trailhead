public class EmailResponseController {
    //Map PageParameters 
    private Map<string,string> pageParams=ApexPages.currentPage().getParameters();

    //Return Value of Parameter
    private static string GetValueFromParam(string ParamKey) {
        string toReturn='';
        if(ApexPages.currentPage().getParameters().containsKey(ParamKey)) {
            toReturn=ApexPages.currentPage().getParameters().get(ParamKey);
        }
        return toReturn;
    }

	private static void setMessage(String result) {
		//Setup Message
		ApexPages.Message msg = new ApexPages.Message(ApexPages.Severity.INFO, result);
		ApexPages.addMessage(msg);
	}

	public EmailResponseController() {}

	public static void setResponse() {
		//Default message
		String result = 'Unfortunately, we cannot process your update at this time';

		//Set parameters
		String managerId = GetValueFromParam('mgr');
		String contactId = GetValueFromParam('cont');
		String response = GetValueFromParam('response');
		System.debug('Manager Id: ' + managerId + ' Contact Id: ' + contactId + ' Response: ' + response);

		//Get Feedback for Response
		EmailResponse__c fb = EmailResponse__c.getInstance(response);
		System.debug(fb.Email_Feedback__c);	

		//Get Rating Record
		List<Rating__c> rating = [SELECT Feedback__c, Feedback_Received__c FROM Rating__c WHERE Manager__r.Id = :managerId AND Contact__r.Id = :contactId ORDER BY CreatedDate DESC LIMIT 1];

		//Update Rating with Feedback
		try {
			if (rating.size() == 1 && fb.Email_Feedback__c != null) {
				rating[0].Feedback__c = fb.Email_Feedback__c;
				rating[0].Feedback_Received__c = datetime.now();
				update rating;
				result = 'Your input has been recorded successfully';
				setMessage(result);
			} else {
				setMessage(result);
			}
		} catch(DmlException  e) {
			System.debug('***ERROR: ' + e.getMessage());
			setMessage(result);
		}		
	}
}