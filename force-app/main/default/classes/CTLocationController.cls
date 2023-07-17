public with sharing class CTLocationController {

    public static List<Location__c> getRecentStatusChanges() {
        return [SELECT Id, Name, Address__c, Pincode__c, Red_Score__c, Status_Update_Date__c, Status__c 
                    FROM Location__c 
                        ORDER BY Status_Update_Date__c NULLS LAST 
                        LIMIT 100];
    }

    public static List<Location__c> searchLoactions(String searcTerm){
        searcTerm = searcTerm + '%';
        return [SELECT Id, Name, Address__c, Pincode__c, Red_Score__c, Status_Update_Date__c, Status__c 
                    FROM Location__c 
                    WHERE Name LIKE :searcTerm 
                        OR Address__c LIKE : searcTerm
                        OR Pincode__c LIKE : searcTerm 
                    ORDER BY Status_Update_Date__c DESC NULLS LAST];
    }

    public static Location__c getLocationById(String locationId){
        List<Location__c> locations = [SELECT Id, Name, Address__c, Pincode__c, Red_Score__c, Status_Update_Date__c, Status__c 
                                        FROM Location__c  WHERE Id = :locationId];
        
        if(locations != null && locations.size() > 0){
            return locations[0];
        }
        return null;
    }
}