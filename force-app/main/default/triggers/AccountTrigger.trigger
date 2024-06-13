trigger AccountTrigger on Account (before insert, before update, before delete, 
									after insert, after update, after delete, after undelete)  { 
	
	
		switch on Trigger.OperationType {

			when BEFORE_INSERT {
				AccountHandler.beforeInsert(Trigger.new);			
			}
		}
	}