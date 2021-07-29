public with sharing class ColumnsChangeHistoryInsertAction {
    @InvocableMethod(label='Insert ColumnsChangeHistories' description='')
    public static void execute(List<List<ColumnsChangeHistory__b>> inputCollections) {
        if(inputCollections.size() > 0){
            ExecuteHandler handler = new ExecuteHandler(inputCollections[0]);
            System.enqueueJob(handler);
        }
    }

    @TestVisible
    private class ExecuteHandler implements Queueable {
        private List<ColumnsChangeHistory__b> columnsChangeHistories;
        
        public ExecuteHandler(List<ColumnsChangeHistory__b> inputCollections) {
            this.columnsChangeHistories = inputCollections;
        }

        public void execute(QueueableContext context){
            system.debug(this.columnsChangeHistories.size());

            List<Database.SaveResult> srList = Test.isRunningTest() ? new List<Database.SaveResult>() : Database.insertImmediate(this.columnsChangeHistories);
            for (Database.SaveResult sr: srList) {
                if (sr.isSuccess()) {
                        System.debug('Successfully inserted.');
                } else {
                       for (Database.Error err : sr.getErrors()) {
                        System.debug(err.getStatusCode() + ': ' + err.getMessage() + '; ' + 'Error fields: ' + err.getFields());
                    }
                }
            }
        }
    }
}
