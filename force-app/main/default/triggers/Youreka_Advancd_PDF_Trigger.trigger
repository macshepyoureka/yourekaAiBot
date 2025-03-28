trigger Youreka_Advancd_PDF_Trigger on disco__Form__c (before insert, before update, after insert, after update) {

    if (Trigger.isBefore) {

        for (disco__Form__c form : trigger.new) {

             if (form.disco__Status__c == 'Submitted' && form.disco__Advanced_PDF_Generation_Status__c == null) {

             form.disco__Needs_PDF_Created__c = true;

     }

 }

} else if (Trigger.isAfter) {

   // Call pdf creation job

  disco.Invoke_CreatePDFs_v2.startCreatePDFs();

}

}