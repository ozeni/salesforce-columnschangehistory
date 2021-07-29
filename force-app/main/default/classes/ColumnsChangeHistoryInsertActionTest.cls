@isTest 
private class ColumnsChangeHistoryInsertActionTest {
    @isTest 
    static void test() {
        List<List<ColumnsChangeHistory__b>> inputs = new List<List<ColumnsChangeHistory__b>>();
        List<ColumnsChangeHistory__b> input = new List<ColumnsChangeHistory__b>();
        input.add(new ColumnsChangeHistory__b(
            RecordId__c='test'
            , ColumnName__c = 'test'
            , UpdatedDateTime__c = Datetime.now()
        ));
        inputs.add(input);
        Test.startTest();
        ColumnsChangeHistoryInsertAction.execute(inputs);
        Test.stopTest();
    }
}