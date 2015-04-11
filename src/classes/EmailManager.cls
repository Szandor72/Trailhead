public class EmailManager {
    //Pubilc method
    public static void sendMail(String address, String subject, String body) {
        //create email message object
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        String[] toAddresses = new String[] {address};
        mail.setToAddresses(toAddresses);
        mail.setSubject(subject);
		mail.setPlainTextBody(body);
        //Pass message to the built in sendEmail method
        Messaging.SendEmailResult[] results = Messaging.sendEmail(new Messaging.SingleEmailMessage[] {mail});
        
        //call helper method to inspect results
        inspectResults(results);
    }
    
    //helper method
    private static Boolean inspectResults(Messaging.SendEmailResult[] results) {
        Boolean sendResult = true;
        
        // sendEmail returns an array of result objects.
        // Iterate through the list to inspect results.
        // In this class, the methods send only one email,
        // so we should have only one result.
        for (Messaging.SendEmailResult res : results) {
            if (res.isSuccess()) {
                System.debug('Email sent successfully');
            }
            else {
                sendResult = false;
            	System.debug('The following errors occurred: ' + res.getErrors());
            }
        }
        return sendResult;
    }

}