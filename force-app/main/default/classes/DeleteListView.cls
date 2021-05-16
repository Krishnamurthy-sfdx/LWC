public with sharing class DeleteListView {

	@AuraEnabled(cacheable = true)
	public static List<DataTableWrapper> deleteListVi(){
		List<Account> listacc =  [SELECT Id, Name,OwnerId, Website FROM Account LIMIT 20];
		
        List<DataTableWrapper> wrapper = new List<DataTableWrapper>();
        for(Account acc : listacc){
            DataTableWrapper obj = new DataTableWrapper();
            obj.accId = acc.Id;
            obj.name = acc.Name;
			obj.nameUrl = '/'+acc.Id;
			obj.website = acc.Website;
            wrapper.add(obj);
        }

        return wrapper;
	}

	@AuraEnabled
	public static void deleteAccount(Id[] accountIds){
		delete [SELECT Id,Name,OwnerId, Website FROM Account where Id=:accountIds];
		
	}

	private class DataTableWrapper {
        @AuraEnabled
        public Id accId {get;set;}
        @AuraEnabled
        public String name {get;set;}
        @AuraEnabled
		public String nameUrl {get;set;}
		@AuraEnabled
        public String website {get;set;}
    }

}